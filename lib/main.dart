import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/constants/app_fonts.dart';
import 'package:flutter_application_1/packages/quote/qoute_model.dart';
import 'package:flutter_application_1/packages/quote/quote.dart';
import 'package:flutter_application_1/screens/landing_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Quotes().getAll();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      title: 'Flutter Demo',
      home: const LandingScreen(),
    );
  }
}
