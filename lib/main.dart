import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/constants/app_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counter>(
        create: (_) => Counter(),
        child: Scaffold(
          body: CounterContainer(),
          floatingActionButton: Consumer<Counter>(
            builder: (context, value, child) {
              return FloatingActionButton(
                onPressed: () {
                  value.increase();
                },
                child: Icon(Icons.add),
              );
            },
          ),
        ));
  }
}

class CounterContainer extends StatelessWidget {
  const CounterContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    
      final counter = context.watch<Counter>().counter;
      return Center(
          child: Text(
        '$counter',
        style: GoogleFonts.abel(
          textStyle: TextStyle(color: Colors.blue, fontSize: 40),
        ),
      ));
  }
}

class Counter extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increase() {
    _counter++;
    notifyListeners();
  }
}
