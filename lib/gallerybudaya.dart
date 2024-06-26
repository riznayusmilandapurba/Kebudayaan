import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/gallerybudayadetail.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/sejarawan.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/model/modelbudaya.dart';

class GalleryBudaya extends StatefulWidget {
  const GalleryBudaya({super.key});

  @override
  State<GalleryBudaya> createState() => _GalleryBudayaState();
}

class _GalleryBudayaState extends State<GalleryBudaya> {
 Future<List<Datum>?> getGalleryBudaya() async{
    try{
      http.Response res = await http.get(Uri.parse('http://192.168.100.97/kebudayaan_server/getBudaya.php'));
      return ModelBudayaFromJson(res.body).data;
    }catch(e){
      setState(() {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.toString()))
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery',
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: FutureBuilder<List<Datum>?>(
            future: getGalleryBudaya(),
            builder: (BuildContext context, AsyncSnapshot<List<Datum>?> snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    Datum? data = snapshot.data?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GalleryBudayaDetail(data)),
                        );
                      },
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 16 / 9, 
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  'http://192.168.100.97/kebudayaan_server/gambar_kebudayaan/${data?.gambar}',
                                  fit: BoxFit.cover, 
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orange,
                  ),
                );
              }
            },
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