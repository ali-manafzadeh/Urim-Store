import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:store/widgets/custonActionBar.dart';

class MainHome extends StatelessWidget {
  // const MainHome({super.key});

  final Stream<QuerySnapshot> _product =
      FirebaseFirestore.instance.collection("product").snapshots();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        StreamBuilder(
          stream: _product,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            //if the connection has Error
            if (snapshot.hasError) {
              return Center(
                child: Text('Error ${snapshot.error}'),
              );
            }
            //if connection was ok = 200 ok
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: Center(child: Text('productName : shoes')),
            );
          },
        ),
        custonActioBar("Home", "0")
      ],
    ));
  }
}
