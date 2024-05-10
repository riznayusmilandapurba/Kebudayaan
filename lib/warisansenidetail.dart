import 'package:flutter/material.dart';
import 'package:kebudayaan/model/modelwarisanseni.dart';
import 'package:google_fonts/google_fonts.dart';


class WarisanseniDetail extends StatelessWidget {
   final Datum? data;

   const WarisanseniDetail(this.data, {super.key});

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
                    'http://192.168.0.100/kebudayaan_server/gambar_kebudayaan/${data?.gambar}',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  data?.judul ?? "",
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
                child: Text(
                  data?.konten ?? "",
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