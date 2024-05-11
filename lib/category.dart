import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/sejarah.dart';
import 'package:kebudayaan/tradisi.dart';
import 'package:kebudayaan/budaya.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/warisanseni.dart';
import 'package:kebudayaan/sejarawan.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebudayaan/user.dart';


class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seputar Budaya',
          style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(191, 0, 0, 1),
        toolbarHeight: 105,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color:  Color.fromARGB(255, 253, 242, 178),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Sejarah()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 253, 242, 178),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(color: Color.fromRGBO(191, 0, 0, 1)),
                  ),
                  minimumSize: Size(346, 69),
                ),
                child: Text('SEJARAH',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Budaya()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 253, 242, 178),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                    side: BorderSide(color: Color.fromRGBO(191, 0, 0, 1)),
                  ),
                  minimumSize: Size(346, 69),
                ),
                child: Text('BUDAYA',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Tradisi()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 253, 242, 178), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                    side: BorderSide(color: Color.fromRGBO(191, 0, 0, 1)),
                  ),
                  minimumSize: Size(346, 69),
                ),
                child: Text('TRADISI',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Warisanseni()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 253, 242, 178), 
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), 
                    side: BorderSide(color: Color.fromRGBO(191, 0, 0, 1)),
                  ),
                  minimumSize: Size(346, 69),
                ),
                child: Text('WARISAN SENI',
                style: GoogleFonts.raleway(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Kategori',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Sejarawan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        backgroundColor: Color.fromRGBO(191, 0, 0, 1),
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Category()),
              );
              break;
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Sejarawan()),
              );
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => User()),
              );
              break;
          }
        },
      ),
    );
  }
}