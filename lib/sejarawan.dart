import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/model/modelsejarawan.dart';
import 'package:kebudayaan/sejarawanadd.dart';
import 'package:kebudayaan/sejarawandetail.dart';
import 'package:kebudayaan/sejarawanedit.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/category.dart';

class Sejarawan extends StatefulWidget {
  const Sejarawan({Key? key}) : super(key: key);

  @override
  State<Sejarawan> createState() => _SejarawanState();
}

class _SejarawanState extends State<Sejarawan> {
  late List<Datum> _sejarahList;
  late List<Datum> _filteredSejarah;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _sejarahList = [];
    _filteredSejarah = [];
    _searchController = TextEditingController();
    _getsejarah();
  }

  Future<void> _getsejarah() async {
    try {
      http.Response res = await http.get(Uri.parse('http://192.168.100.97/kebudayaan_server/getSejarawan.php'));
      if (res.statusCode == 200) {
        List<Datum> sejarahList = ModelSejarawanFromJson(res.body).data ?? [];
        setState(() {
          _sejarahList = sejarahList;
          _filteredSejarah = sejarahList;
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  Future<void> _deleteSejarawan(String id) async {
    try {
      http.Response res = await http.post(
        Uri.parse('http://192.168.100.97/kebudayaan_server/deleteSejarawan.php'),
        body: {'id': id},
      );
      if (res.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data Sejarawan berhasil dihapus')),
        );
        _getsejarah();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Gagal menghapus Data Sejarawan')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  void _filtersejarah(String keyword) {
    keyword = keyword.toLowerCase();
    setState(() {
      _filteredSejarah = _sejarahList.where((sejarah) =>
          sejarah.nama.toLowerCase().contains(keyword)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(191, 0, 0, 1),
        toolbarHeight: 105,
        title: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 34,
                child: TextField(
                  controller: _searchController,
                  onChanged: _filtersejarah,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search Sejarawan!...',
                    hintStyle: GoogleFonts.lato(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Color.fromRGBO(255, 247, 212, 1),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: Colors.white,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => SejarawanAdd()),
                );
              },
            ),
          ],
        ),
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
      body: ListView.builder(
        itemCount: _filteredSejarah.length,
        itemBuilder: (context, index) {
          Datum data = _filteredSejarah[index];
          return Container(
            margin: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color.fromRGBO(255, 247, 212, 1),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Container(
              color: Color.fromRGBO(255, 217, 90, 1),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'http://192.168.100.97/kebudayaan_server/gambar_sejarawan/${data.foto}',
                        width: 122,
                        height: 118,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.5),
                          child: Text(
                            data.nama,
                            style: GoogleFonts.firaSans(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.5),
                          child: Text(
                            data.deskripsi.length > 100 ? data.deskripsi.substring(0, 50) + '...' : data.deskripsi,
                            style: GoogleFonts.firaSans(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.5),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.visibility),
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => SejarawanDetail(data)),
                                  );
                                },
                              ),
                              SizedBox(width: 7),
                              IconButton(
                                icon: Icon(Icons.edit),
                                color: Colors.black,
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => SejarawanEdit(
                                      id: data.id,
                                      nama: data.nama,
                                      tgl_lahir: data.tgl_lahir,
                                      asal: data.asal,
                                      jk: data.jk,
                                      deskripsi: data.deskripsi,
                                      currentFoto: data.foto,
                                    )),
                                  );
                                },
                              ),
                              SizedBox(width: 7),
                              IconButton(
                                icon: Icon(Icons.delete),
                                color: Colors.black,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text('Konfirmasi'),
                                        content: Text('Apakah Anda yakin ingin menghapus data ini?'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Batal'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              _deleteSejarawan(data.id);
                                              Navigator.of(context).pop();
                                            },
                                            child: Text('Hapus'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
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
