import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/routes/const.dart';
import 'package:store/routes/login.dart';
import 'package:store/widgets/customButton.dart';
import 'package:store/widgets/customInput.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Future<String?> singInMethod() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: takeEmail, password: takePassword);
      return "ok";
    } on FirebaseAuthException catch (error) {
      if (error.code == 'weak-password') {
        return 'the password is weak';
      } else if (error.code == 'email-is-already-use') {
        return 'the account with this email is already exist !';
      }
      return error.message;
    } catch (error) {
      return error.toString();
    }
  }

  Future<void> advanceAlertDialog(String message) {
    return Get.defaultDialog(
      title: "Invalid Input",
      content: Text(message),
      actions: [
        ElevatedButton(onPressed: () => Get.back(), child: const Text('Ok !'))
      ],
    );
  }

  void signIn() async {
    setState(() {
      isLoading = true;
    });

    String? result = await singInMethod();
    if (result != "ok") {
      advanceAlertDialog(result!);

      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      Get.to(LoginPage());
      Get.snackbar("succesfull", "Account Created",
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
                    "Create a\n New Account !",
                    style: Consts.headingTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Column(
                  children: [
                    CustomInput(
                      text: "Enter Email ...",
                      onChanged: (value) {
                        takeEmail = value;
                        print(value);
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
                      text: "Create New Account",
                      loading: isLoading,
                      onTap: () {
                        signIn();
                      },
                      mode: false,
                    )
                  ],
                ),
                CustomButton(
                  text: "Back to Login",
                  onTap: () => Get.back(),
                  mode: true,
                  loading: false,
                )
              ]),
        ),
      ),
    );
  }
}
