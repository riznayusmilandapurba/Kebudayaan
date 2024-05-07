import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/sejarawan.dart';
import 'package:kebudayaan/model/modeltradisi.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/tradisidetail.dart';


class Tradisi extends StatefulWidget {
  const Tradisi({super.key});

  @override
  State<Tradisi> createState() => _TradisiState();
}

class _TradisiState extends State<Tradisi> {
  late List<Datum> _tradisiList;
  late List<Datum> _filteredTradisi;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _tradisiList = [];
    _filteredTradisi = [];
    _searchController = TextEditingController();
    _gettradisi();
  }

  Future<void> _gettradisi() async {
    try {
      http.Response res = await http.get(Uri.parse('http://172.22.0.42/kebudayaan_server/getTradisi.php'));
      if (res.statusCode == 200) {
        List<Datum> tradisiList = ModelTradisiFromJson(res.body).data ?? [];
        setState(() {
          _tradisiList = tradisiList;
          _filteredTradisi = tradisiList;
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
      _filteredTradisi = _tradisiList.where((tradisi) =>
          tradisi.judul.toLowerCase().contains(keyword) ||
          tradisi.konten.toLowerCase().contains(keyword)
      ).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(191, 0, 0, 1),
        toolbarHeight: 105,
        title: Column(
          children: [
            SizedBox(
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
        itemCount: _filteredTradisi.length,
        itemBuilder: (context, index) {
          Datum data = _filteredTradisi[index];
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
                        'http://172.22.0.42/kebudayaan_server/gambar_kebudayaan/${data.gambar}',
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
                          MaterialPageRoute(builder: (context) => TradisiDetail(data)),
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