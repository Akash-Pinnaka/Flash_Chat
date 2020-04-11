import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import '../widgets/round_button.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const tag = "Registration_Screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool loading=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: loading,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: "logo",
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  setState(() {
                    email = value;
                  });
                },
                decoration: kTextFieldStyle.copyWith(hintText: "Enter Email"),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                decoration: kTextFieldStyle.copyWith(hintText: "Enter password"),
              ),
              SizedBox(
                height: 24.0,
              ),
              Hero(
                tag: "register",
                child: RoundButton(
                  color: Colors.blueAccent,
                  onPress: () async{
                    setState(() {
                      loading=true;
                    });
                    try {
                      final user =await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
                      if(user!= null)
                        Navigator.pushNamed(context, ChatScreen.tag);
                    }catch(e){
                      print(e);
                    }
                    setState(() {
                      loading=false;
                    });
                  },
                  text: "Register",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
