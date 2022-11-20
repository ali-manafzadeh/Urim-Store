import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool mode;
  final bool loading;
  CustomButton(
      {required this.text,
      required this.onTap,
      required this.mode,
      required this.loading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 55.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: mode ? Colors.transparent : Colors.black,
            borderRadius: BorderRadius.circular(13),
            border: Border.all(
              color: Colors.black,
              width: 2,
            )),
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Stack(
          children: [
            Visibility(
              visible: loading ? false : true,
              child: Center(
                child: Text(text,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: mode ? Colors.black : Colors.white)),
              ),
            ),
            Visibility(
              visible: loading ? true : false,
              child: Center(
                  child: SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator())),
            )
          ],
        ),
      ),
    );
  }
}
