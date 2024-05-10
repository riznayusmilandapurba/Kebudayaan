import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:kebudayaan/category.dart';
import 'package:kebudayaan/model/modellogin.dart';
import 'package:kebudayaan/utils/session_manager.dart';



class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
 TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> loginAccount() async {
    try {
      setState(() {
        isLoading = true;
      });
      http.Response res = await http.post(
        Uri.parse('http://192.168.0.100/kebudayaan_server/login.php'),
        body: {
          "email": txtEmail.text,
          "password": txtPassword.text,
        },
      );

      ModelLogin data = modelLoginFromJson(res.body);
      if (data.value == 1) {
        setState(() {
          isLoading = false;
          sessionManager.saveSession(
              data.value ?? 0,
              data.id ?? "",
              data.fullname ?? "",
              data.phone ?? "",
              data.email ?? "");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Category()),
            (route) => false,
          );
        });
      } else if (data.value == 2) {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      } else {
        setState(() {
          isLoading = false;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${data.message}')));
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.toString())));
      });
    }
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
                'Hi, Welcome Back!',
                style: GoogleFonts.raleway(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Hello again, You have been missed!',
                style: GoogleFonts.raleway(
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: txtEmail,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: txtPassword,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  return null;
                },
              ),
              SizedBox(height: 55),
              ElevatedButton(
                onPressed: () {
                  if (keyForm.currentState?.validate() == true) {
                    loginAccount();
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
                      'LOGIN',
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