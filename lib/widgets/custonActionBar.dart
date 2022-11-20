import 'package:flutter/material.dart';
import 'package:store/routes/const.dart';

class custonActioBar extends StatelessWidget {
  //  custonActioBar({super.key});

  final String title;
  final String number;

  custonActioBar(this.title, this.number);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 55, left: 18, right: 18, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Consts.headingTextStyle,
          ),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(6.5),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
