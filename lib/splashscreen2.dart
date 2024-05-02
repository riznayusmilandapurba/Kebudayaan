import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebudayaan/register.dart';

class Splashscreen2 extends StatefulWidget {
  const Splashscreen2({Key? key}) : super(key: key);

  @override
  State<Splashscreen2> createState() => _Splashscreen2State();
}

class _Splashscreen2State extends State<Splashscreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(191, 0, 0, 1),
        child: Stack(
          children: [
            Positioned(
              top: 40,
              left: 85,
              child: Image.asset(
                'images/1.png',
                width: 300,
                height: 270,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 55,
              top: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Let`s Get\nStarted',
                    style: GoogleFonts.raleway(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'menyediakan informasi tentang sejarah, budaya,\ntradisi, dan warisan seni budaya Batak, termasuk\nseni musik, tarian, pakaian adat, dan arsitektur',
                    style: GoogleFonts.raleway(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 20), // Menambahkan jarak
                    Container(
                      width: 200,
                      decoration: BoxDecoration(
                        color:  Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Material(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Register()),
                            );
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 32),
                            child: Text(
                              'Join Now',
                              style: GoogleFonts.roboto(
                                textStyle: Theme.of(context).textTheme.displayLarge,
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
