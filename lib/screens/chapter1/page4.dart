import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(child: Flexible(child: Image.network('https://hosting.photobucket.com/images/i/wahab_ahmad/4.jpg'))),
      ],
    );
  }
}
