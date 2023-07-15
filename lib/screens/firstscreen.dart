import 'package:flutter/material.dart';
import 'homescreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Image.asset("assets/images/background.png",
            fit: BoxFit.cover, height: MediaQuery.sizeOf(context).height),
        const Positioned(
          top: 60,
          left: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Complete\nHealth\nSolutions",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              SizedBox(height: 15),
              Text(
                "Easily protection for\nFamily health",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: -10,
          child: Image.asset(
            "assets/images/doctor.png",
            width: 400,
          ),
        ),
        Positioned(
          left: 30,
          bottom: 50,
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
            child: Container(
              width: 130,
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: const Text("Get Started",
                  style: TextStyle(color: Colors.deepPurple)),
            ),
          ),
        )
      ]),
    );
  }
}
