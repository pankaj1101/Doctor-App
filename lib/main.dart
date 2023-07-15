import 'package:doctorapp/screens/firstscreen.dart';
import 'package:doctorapp/utils/screen_size.dart';
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

class MyScreen extends StatefulWidget {
  const MyScreen({super.key});

  @override
  State<MyScreen> createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    final bool isSmallScreen = size.width <= ScreenSize.kmobileSize;
    final bool isMediumScreen = size.width > ScreenSize.kmobileSize &&
        size.width <= ScreenSize.ktabletSize;
    // final bool isLargeScreen = size.width > ScreenSize.ktabletSize;
    // Doctor App

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Responsive Design", style: TextStyle(fontSize: 30)),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (isSmallScreen)
                          ? 2
                          : (isMediumScreen)
                              ? 4
                              : 6,
                      mainAxisExtent: (isSmallScreen)
                          ? 80
                          : (isMediumScreen)
                              ? 150
                              : 150),
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: (isSmallScreen)
                          ? const ListTile(
                              title: Text("Lenovo"),
                              subtitle: Text("2099"),
                              trailing: CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.red,
                              ),
                            )
                          : (isMediumScreen)
                              ? const GridTile(
                                  child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.red,
                                    ),
                                    Text("Lenovo"),
                                    Text("2099"),
                                  ],
                                ))
                              : const GridTile(
                                  child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundColor: Colors.red,
                                    ),
                                    Text("Lenovo"),
                                    Text("2099"),
                                  ],
                                )),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
