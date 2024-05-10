import 'package:flutter/material.dart';
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/sejarawan.dart';
import 'package:kebudayaan/login.dart';
import 'package:kebudayaan/useredit.dart';
import 'package:kebudayaan/utils/session_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class User extends StatefulWidget {
  const User({super.key});

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {

 @override
  void initState() {
    super.initState();
    sessionManager.getSession().then((_) {
      setState(() {}); 
    });
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: GoogleFonts.raleway(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Color.fromRGBO(191, 0, 0, 1),
        toolbarHeight: 105,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            color: Colors.white,
            onPressed: () {
              sessionManager.clearSession();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: sessionManager.fullname != null && sessionManager.email != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 15),
                  Text(
                    '${sessionManager.fullname}',
                    style: GoogleFonts.raleway(
                      fontSize: 23,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserEdit()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(191, 0, 0, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: Color.fromRGBO(191, 0, 0, 1)),
                      ),
                      minimumSize: Size(202, 50),
                    ),
                    child: Text(
                      'Edit',
                      style: GoogleFonts.itim(
                        fontSize: 13,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromRGBO(255, 247, 212, 1),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.phone),
                            SizedBox(width: 6),
                            Text(
                              '${sessionManager.phone}',
                              style: GoogleFonts.itim(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email),
                            SizedBox(width: 6),
                            Text(
                              '${sessionManager.email}',
                              style: GoogleFonts.itim(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : CircularProgressIndicator(),
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
        selectedItemColor: Colors.white,
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