import 'package:flutter/material.dart';

import '../widgets/custonActionBar.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Stack(
      children: [
        Center(child: Text('HomePage')),
        custonActioBar("Search", "0")
      ],
    ));
  }
}
