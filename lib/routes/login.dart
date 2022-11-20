import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/routes/const.dart';
import 'package:store/routes/signUp.dart';
import 'package:store/widgets/customButton.dart';
import 'package:store/widgets/customInput.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> advanceAlertDialog(String message) {
    return Get.defaultDialog(
      title: "Invalid Input",
      content: Text(message),
      actions: [
        ElevatedButton(onPressed: () => Get.back(), child: const Text('Ok !'))
      ],
    );
  }

  Future<String?> LoginMethod() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: takeEmail, password: takePassword);
      return "ok";
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        return 'No user found for that email';
      } else if (error.code == 'wrong-password') {
        return 'wrong password provided for that user.';
      }
      return error.message;
    } catch (error) {
      return error.toString();
    }
  }

  void LogIn() async {
    setState(() {
      isLoading = true;
    });

    String? result = await LoginMethod();
    if (result != "ok") {
      advanceAlertDialog(result!);

      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Get.snackbar("successful", "U are login ",
          backgroundColor: Colors.green,
          icon: Icon(Icons.check_circle),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  bool isLoading = false;
  String takeEmail = "";
  String takePassword = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "Welcome to the \n Urim Store",
                    style: Consts.headingTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    CustomInput(
                      text: "Enter Email ...",
                      onChanged: (Value) {
                        takeEmail = Value;
                      },
                      checkPassword: false,
                    ),
                    CustomInput(
                      text: "Enter password ...",
                      onChanged: (value) {
                        takePassword = value;
                      },
                      checkPassword: true,
                    ),
                    CustomButton(
                      text: "Login",
                      onTap: () => LogIn(),
                      loading: isLoading,
                      mode: false,
                    )
                  ],
                ),
                CustomButton(
                  text: "Create New Account",
                  onTap: (() => Get.to(() => SignUp())),
                  mode: true,
                  loading: false,
                )
              ]),
        ),
      ),
    );
  }
}
