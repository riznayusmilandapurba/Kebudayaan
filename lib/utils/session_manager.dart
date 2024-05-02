import 'package:shared_preferences/shared_preferences.dart';

class SessionManager{
  int? value;
  String? id;
  String? fullname;
  String? phone;
  String? email;
  

  //simpan sesi
  Future<void> saveSession(int val, String id, String fullname,  String phone, String email ) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt("value", val);
    pref.setString("id", id);
    pref.setString("fullname", fullname);
    pref.setString("phone", phone);
    pref.setString("email", email);
    
  }

  Future getSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    value = pref.getInt("value");
    id = pref.getString("id");
    fullname = pref.getString("fullname");
    phone = pref.getString("phone");
    email = pref.getString("email");
    
  }
  //remove --> logout
  Future clearSession() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
  }

}

//instance class biar d panggil
SessionManager sessionManager = SessionManager();