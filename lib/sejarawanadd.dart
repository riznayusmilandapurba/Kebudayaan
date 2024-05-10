import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kebudayaan/model/modelsejarawandd.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/sejarawan.dart';
import 'package:http_parser/http_parser.dart';



class SejarawanAdd extends StatefulWidget {
  const SejarawanAdd({super.key});

  @override
  State<SejarawanAdd> createState() => _SejarawanAddState();
}

class _SejarawanAddState extends State<SejarawanAdd> {
    final TextEditingController txtNama = TextEditingController();
  final TextEditingController txtTglLahir = TextEditingController();
  final TextEditingController txtAsal = TextEditingController();
  final TextEditingController txtJK = TextEditingController();
  final TextEditingController txtDeskripsi = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool isLoading = false;

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      }
    });
  }

  Future<void> postSejarawan() async {
    try {
      setState(() {
        isLoading = true;
      });

      var request = http.MultipartRequest(
        'POST',
        Uri.parse('http://192.168.0.100/kebudayaan_server/postSejarawan.php'),
      );

      request.fields['nama'] = txtNama.text;
      request.fields['tgl_lahir'] = txtTglLahir.text;
      request.fields['asal'] = txtAsal.text;
      request.fields['jk'] = txtJK.text;
      request.fields['deskripsi'] = txtDeskripsi.text;

      if (_imageFile != null) {
        var pic = await http.MultipartFile.fromPath(
          'foto',
          _imageFile!.path,
          contentType: MediaType('image', 'jpeg'),
        );
        request.files.add(pic);
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Berhasil Tambah Data')),
        );
        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal Tambah Data')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      color: Color.fromRGBO(255, 247, 212, 1),
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Form(
        key: keyForm,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tambah Sejarawan',
              style: GoogleFonts.raleway(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 30),
            TextFormField(
              controller: txtNama,
              decoration: InputDecoration(
                labelText: 'Nama',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama is required';
                }
                return null;
              },
            ),
            TextFormField(
                  controller: txtTglLahir,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Tanggal Lahir is required';
                    }
                    return null;
                  },
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                      initialDatePickerMode: DatePickerMode.day,
                    );
                    if (pickedDate != null) {
                      txtTglLahir.text = pickedDate.toString().split(' ')[0];
                    }
                  },
                ),
            TextFormField(
              controller: txtAsal,
              decoration: InputDecoration(
                labelText: 'Asal',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Asal is required';
                }
                return null;
              },
            ),
            DropdownButtonFormField<String>(
              value: txtJK.text,
              onChanged: (String? newValue) {
                setState(() {
                  txtJK.text = newValue!;
                });
              },
              items: <String>['', 'Laki-laki', 'Perempuan'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(
                labelText: 'Jenis Kelamin',
              ),
            ),
            TextFormField(
              controller: txtDeskripsi,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Deskripsi is required';
                }
                return null;
              },
            ),
              TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Foto',
                  ),
                  validator: (value) {
                    if (_imageFile == null) {
                      return 'Foto is required';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Unggah Foto'),
                ),
                SizedBox(height: 20),
                _imageFile != null
                    ? Image.file(_imageFile!, width: 100, height: 100)
                    : SizedBox(),

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (keyForm.currentState!.validate()) {
                  postSejarawan();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromRGBO(191, 0, 0, 1),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Color.fromRGBO(191, 0, 0, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Center(
                  child: Text(
                    'Simpan',
                    style: GoogleFonts.publicSans(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    ),
  );
}
}