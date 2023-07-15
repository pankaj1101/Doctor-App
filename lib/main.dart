import 'package:doctorapp/screens/doctor_profile.dart';
import 'package:doctorapp/screens/firstscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: Colors.deepPurple),
      home: const MyHomePage(),
    );
  }
}
