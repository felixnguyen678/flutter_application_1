import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/constants/app_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double topHeight = size.height / 5;
    return Scaffold(
      body: Stack(children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Container(
                      height: topHeight,
                      color: Colors.blue,
                    ),
                    Container(
                      height: (size.height - topHeight) / 3,
                      color: Colors.black,
                    ),
                    Container(
                      height: (size.height - topHeight) / 3,
                      color: Colors.yellow,
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.pink,
                  margin: EdgeInsets.only(right: 10),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.pink,
                )),
          ],
        ),
        Positioned(
          top: topHeight + (size.height - topHeight) * 4 / 9,
          left: (size.width / 4) * 3 / 4 ,
          child: Container(
            color: Color.fromARGB(55, 70, 19, 16),
            width: 100,
            height: 100,
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Do something when the button is pressed
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
