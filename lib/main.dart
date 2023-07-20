import 'package:doctorapp/config/colors.dart';
import 'package:doctorapp/screens/firstscreen.dart';
import 'package:doctorapp/screens/make_appoinment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'screens/sample.dart';

void main() {
  runApp(const MyApp());
}

// Reference Link...
// https://dribbble.com/shots/15818547-Doctor-App-Interaction

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doctor App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              backgroundColor: const Color(0xFFFAFAFA),
              elevation: 0,
              iconTheme: const IconThemeData(color: Colors.black),
              titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontFamily: GoogleFonts.lato().fontFamily)),
          fontFamily: GoogleFonts.lato().fontFamily,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple, primary: AppColors.primaryColor),
          primaryColor: Colors.deepPurple),
      home: const MyHomePage(),
    );
  }
}
