import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/sejarawan.dart';

class SejarawanEdit extends StatefulWidget {
  final String id;
  final String nama;
  final String tgl_lahir;
  final String asal;
  final String jk;
  final String deskripsi;
  final String currentFoto;

  const SejarawanEdit({
    required this.id,
    required this.nama,
    required this.tgl_lahir,
    required this.asal,
    required this.jk,
    required this.deskripsi,
    required this.currentFoto,
    Key? key,
  }) : super(key: key);

  @override
  State<SejarawanEdit> createState() => _SejarawanEditState();
}

class _SejarawanEditState extends State<SejarawanEdit> {
  late TextEditingController _txtNama;
  late TextEditingController _txtTglLahir;
  late TextEditingController _txtAsal;
  late TextEditingController _txtJK;
  late TextEditingController _txtDeskripsi;
  late GlobalKey<FormState> _keyForm;
  late bool _isLoading;
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _txtNama = TextEditingController(text: widget.nama);
    _txtTglLahir = TextEditingController(text: widget.tgl_lahir);
    _txtAsal = TextEditingController(text: widget.asal);
    _txtJK = TextEditingController(text: widget.jk);
    _txtDeskripsi = TextEditingController(text: widget.deskripsi);
    _keyForm = GlobalKey<FormState>();
    _isLoading = false;
  }

  Future<void> _editSejarawan() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse('http://192.168.100.97/kebudayaan_server/updateSejarawan.php');
      final request = http.MultipartRequest('POST', url);

      request.fields.addAll({
        "id": widget.id,
        "nama": _txtNama.text,
        "tgl_lahir": _txtTglLahir.text,
        "asal": _txtAsal.text,
        "jk": _txtJK.text,
        "deskripsi": _txtDeskripsi.text,
      });

      // Tambahkan foto jika ada
      if (_imageFile != null) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'foto',
            _imageFile!.path,
          ),
        );
      }

      final response = await request.send();
      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data Sejarawan berhasil diupdate')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Sejarawan()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal mengupdate Data Sejarawan')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 247, 212, 1),
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Edit Sejarawan',
                  style: GoogleFonts.raleway(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: _txtNama,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                  ),
                ),
                TextFormField(
                  controller: _txtTglLahir,
                  decoration: InputDecoration(
                    labelText: 'Tanggal Lahir',
                  ),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      _txtTglLahir.text = pickedDate.toString();
                    }
                  },
                ),
                TextFormField(
                  controller: _txtAsal,
                  decoration: InputDecoration(
                    labelText: 'Asal',
                  ),
                ),
                DropdownButtonFormField<String>(
                  value: _txtJK.text,
                  onChanged: (String? newValue) {
                    setState(() {
                      _txtJK.text = newValue!;
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
                  controller: _txtDeskripsi,
                  maxLines: 5,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi',
                  ),
                ),
                TextFormField(
                  enabled: false,
                  decoration: InputDecoration(
                    labelText: 'Foto',
                  ),
                ),
                ElevatedButton(
                  onPressed: _getImage,
                  child: Text('Pilih Foto'),
                ),
                SizedBox(height: 20),
                _imageFile != null
                    ? Image.file(_imageFile!, width: 100, height: 100)
                    : Image.network(
                        'http://192.168.100.97/kebudayaan_server/gambar_sejarawan/${widget.currentFoto}',
                        width: 100,
                        height: 100,
                      ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_keyForm.currentState!.validate()) {
                      _editSejarawan();
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
