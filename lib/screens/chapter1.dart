import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'chapter1/page10.dart';
import 'chapter1/page11.dart';
import 'chapter1/page12.dart';
import 'chapter1/page13.dart';
import 'chapter1/page14.dart';
import 'chapter1/page15.dart';
import 'chapter1/page4.dart';
import 'chapter1/page5.dart';
import 'chapter1/page6.dart';
import 'chapter1/page7.dart';
import 'chapter1/page8.dart';
import 'chapter1/page9.dart';

class Chapter1 extends StatefulWidget {
  @override
  _Chapter1State createState() => _Chapter1State();
}

class _Chapter1State extends State<Chapter1> {
  var controller = PageController(
    viewportFraction: 1,
    initialPage: 0,
  );
  List<Widget> _pages = <Widget>[
    Page4(),
    Page5(),
    Page6(),
    Page7(),
    Page8(),
    Page9(),
    Page10(),
    Page11(),
    Page12(),
    Page13(),
    Page14(),
    Page15(),
  ];
  int _curr = 0;

  void _scrollToIndex(int index) {
    controller.animateToPage(index, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chapter 01'),
        centerTitle: true,
      ),
      body: InteractiveViewer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: PageView(
                children: _pages,
                controller: controller,
                scrollDirection: Axis.horizontal,
                onPageChanged: (num) {
                  setState(() {
                    _curr = num;
                  });
                },
              ),
            ),
            Expanded(
              child: Wrap(
                children: List.generate(_pages.length - 1, (index) {
                  return GestureDetector(
                    onTap: () {
                      _scrollToIndex(index);
                    },
                    child: Container(
                      height: 32,
                      width: 32,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Center(child: Text('${index + 4}', style: TextStyle(color: Colors.white))),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
