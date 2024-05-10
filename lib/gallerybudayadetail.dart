import 'package:flutter/material.dart';
import 'package:kebudayaan/model/modelbudaya.dart';

class GalleryBudayaDetail extends StatelessWidget {

   final Datum? data;

  const GalleryBudayaDetail(this.data, {super.key});

 Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
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
            ],
          ),
        ),
      ),
    );
  }
}