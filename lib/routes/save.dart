import 'package:flutter/material.dart';

import '../widgets/custonActionBar.dart';

class Save extends StatelessWidget {
  const Save({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [Center(child: Text('HomePage')), custonActioBar("Save", "0")],
    ));
  }
}
