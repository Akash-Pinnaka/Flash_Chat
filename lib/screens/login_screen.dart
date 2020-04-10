import 'package:flutter/material.dart';
import '../widgets/round_button.dart';
import 'chat_screen.dart';
import 'package:flash_chat/constants.dart';

class LoginScreen extends StatefulWidget {
  static const tag="Login_Screen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldStyle,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value) {
                //Do something with the user input.
              },
              decoration: kTextFieldStyle,
            ),
            SizedBox(
              height: 24.0,
            ),
            Hero(
              tag: "login",
              child: RoundButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onPress: (){
                  Navigator.pushNamed(context, ChatScreen.tag);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
