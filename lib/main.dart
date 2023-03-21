import 'dart:async';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamController<int> _streamController = StreamController<int>();
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _streamController.stream.listen((count) {
      setState(() {
        _counter = count;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   child: Image.asset(AppUI.img_meo),
      // ),
      body: CounterContainer(counter: _counter),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _streamController.sink.add(_counter + 1);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterContainer extends StatelessWidget {
  final int counter;
  const CounterContainer({super.key, required this.counter});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      '$counter',
      style: GoogleFonts.abel(
        textStyle: TextStyle(color: Colors.blue, fontSize: 40),
      ),
    ));
  }
}
