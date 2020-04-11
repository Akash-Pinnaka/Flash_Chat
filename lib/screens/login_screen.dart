import 'package:flutter/material.dart';
import '../widgets/round_button.dart';
import 'chat_screen.dart';
import 'package:flash_chat/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const tag="Login_Screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                tag: "login",
                child: RoundButton(
                  color: Colors.lightBlueAccent,
                  text: 'Log In',
                  onPress: ()async{
                    setState(() {
                      loading=true;
                    });
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user!= null)
                        Navigator.pushNamed(context, ChatScreen.tag);
                    }catch(e){
                      print(e);
                    }
                    setState(() {
                      loading=false;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
