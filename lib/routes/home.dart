import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:store/routes/account.dart';
import 'package:store/routes/mainHome.dart';
import 'package:store/routes/save.dart';
import 'package:store/routes/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  int currentIndex = 0;

  List<Widget> bottomTabs = <Widget>[MainHome(), Search(), Save(), Account()];

  // this is a build widget ******************
  Widget build(BuildContext context) {
    return Scaffold(
      body: bottomTabs.elementAt(currentIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20.0, color: Colors.black.withOpacity(0.1))
        ]),
        child: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.black,
            iconSize: 24,
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Colors.grey[100]!,
            color: Colors.black,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'home',
              ),
              GButton(
                icon: Icons.search,
                text: 'search',
              ),
              GButton(
                icon: Icons.save,
                text: 'save',
              ),
              GButton(
                icon: Icons.person,
                text: 'person',
              ),
            ],
            selectedIndex: currentIndex,
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        )),
      ),
    );
  }
}
