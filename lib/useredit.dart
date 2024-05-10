import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/model/modellogin.dart';
import 'package:kebudayaan/user.dart';
import 'package:kebudayaan/utils/session_manager.dart';



class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  late TextEditingController _fullnameController;
  late TextEditingController _phoneController;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fullnameController = TextEditingController(text: sessionManager.fullname ?? '');
    _phoneController = TextEditingController(text: sessionManager.phone ?? '');
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

 void _saveChanges() {
    sessionManager.fullname = _fullnameController.text;
    sessionManager.phone = _phoneController.text;

    sessionManager.saveSession(
      1, 
      sessionManager.id ?? '', 
      sessionManager.fullname ?? '', 
      sessionManager.email ?? '', 
      _phoneController.text, 
      
    );

  Navigator.maybePop(context);
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => User()),
  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 247, 212, 1),
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: keyForm,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Edit User',
                style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Editing your profile allows you to tailor your experience with us. Whether its updating your contact details, changing your preferences, or adding new information, it ensures that we can provide you with the best service possible.',
                style: GoogleFonts.raleway(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: _fullnameController,
                decoration: InputDecoration(
                labelText: 'Fullname',
                ),
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              SizedBox(height: 55),
              ElevatedButton(
                onPressed: () {
                  if (keyForm.currentState?.validate() == true) {
                    _saveChanges();
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
                      'UserEdit',
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
    );
  }
}