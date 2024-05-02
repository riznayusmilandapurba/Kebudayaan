import 'package:flutter/material.dart';
import 'package:kebudayaan/splashscreen2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key? key}) : super(key: key);

  @override
  _Splashscreen1State createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  @override
  void initState() {
    super.initState();
    splashscreenStart();
  }

  splashscreenStart() async {
    var duration = const Duration(seconds: 5);
    return Timer(duration, navigate);
  }

  void navigate() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Splashscreen2()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(191, 0, 0, 1),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Batak",
                style: GoogleFonts.jomhuria(
                  fontSize: 90,
                  color: Colors.white,
                ),
              ),
              Text(
                "heritage",
                style: GoogleFonts.jomhuria(
                  fontSize: 54,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
