import 'package:flutter/material.dart';
import 'package:kebudayaan/model/modelsejarawan.dart';
import 'package:google_fonts/google_fonts.dart';


class SejarawanDetail extends StatelessWidget {
   final Datum? data;

   const SejarawanDetail(this.data, {super.key});

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color.fromRGBO(255, 247, 212, 1),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'http://192.168.100.97/kebudayaan_server/gambar_sejarawan/${data?.foto}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  data?.nama ?? "",
                  style: GoogleFonts.firaSans(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.calendar_month),
                         Text(
                          data?.tgl_lahir ?? "",
                          style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ), 
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person),
                         Text(
                          data?.jk ?? "",
                          style: GoogleFonts.firaSans(
                            color: Colors.black,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ],
                ), 
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  data?.deskripsi ?? "",
                  style: GoogleFonts.firaSans(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}