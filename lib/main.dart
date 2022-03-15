import 'package:flutter/material.dart';
import 'screens/chapter1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Flutter Hello World',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // A widget which will be started on application startup
      home: Chapter1(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  var list = [
    "Home",
    "Services",
    "Work",
    "About"
  ];
  var colors = [
    Colors.orange,
    Colors.blue,
    Colors.red,
    Colors.green
  ];

  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
              ),
              Spacer(),
              Row(
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {
                      _scrollToIndex(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Text(list[index + 1]),
                    ),
                  );
                }),
              )
            ],
          ),
          Expanded(
            child: PageView(
                scrollDirection: Axis.vertical,
                pageSnapping: false,
                controller: controller,
                children: List.generate(list.length - 1, (index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: double.maxFinite,
                    color: colors[index],
                    child: Center(
                      child: Text(
                        list[index],
                        style: TextStyle(color: Colors.white, fontSize: 50),
                      ),
                    ),
                  );
                })),
          ),
        ],
      )),
    );
  }

  void _scrollToIndex(int index) {
    controller.animateToPage(index + 1, duration: Duration(seconds: 2), curve: Curves.fastLinearToSlowEaseIn);
  }
}
