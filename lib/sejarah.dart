import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebudayaan/gallerysejarah.dart';
import 'package:kebudayaan/sejarahdetail.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/sejarawan.dart';
import 'package:kebudayaan/model/modelsejarah.dart';
import 'package:http/http.dart' as http;


class Sejarah extends StatefulWidget {
  const Sejarah({super.key});

  @override
  State<Sejarah> createState() => _SejarahState();
}

class _SejarahState extends State<Sejarah> {
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
      http.Response res = await http.get(Uri.parse('http://192.168.100.97/kebudayaan_server/getSejarah.php'));
      if (res.statusCode == 200) {
        List<Datum> sejarahList = ModelSejarahFromJson(res.body).data ?? [];
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

  void _filtersejarah(String keyword) {
    keyword = keyword.toLowerCase();
    setState(() {
      _filteredSejarah = _sejarahList.where((sejarah) =>
          sejarah.judul.toLowerCase().contains(keyword) ||
          sejarah.konten.toLowerCase().contains(keyword)
      ).toList();
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
                  hintText: 'Search here!...',
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
            icon: Icon(Icons.picture_in_picture),
            color: Colors.white,
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => GallerySejarah()),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.15),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        'http://192.168.100.97/kebudayaan_server/gambar_kebudayaan/${data.gambar}',
                        width: double.infinity,
                        height: 162,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.15),
                    child: Text(
                      data.judul,
                      style: GoogleFonts.firaSans(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.15),
                    child: Text(
                      data.konten.length > 100 ? data.konten.substring(0, 100) + '...' : data.konten,
                      style: GoogleFonts.firaSans(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.15),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SejarahDetail(data)),
                        );
                      },
                      child: Text(
                        'Read more',
                        style: GoogleFonts.firaSans(
                          color: Colors.black,
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),
                      ),
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