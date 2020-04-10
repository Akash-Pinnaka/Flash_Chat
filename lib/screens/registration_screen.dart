import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import '../widgets/round_button.dart';

class RegistrationScreen extends StatefulWidget {
  static const tag = "Registration_Screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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
              tag: "register",
              child: RoundButton(
                  color: Colors.blueAccent,
                  onPress: () {
                    Navigator.pop(context);
                  },
                  text: "Register"),
            ),
          ],
        ),
      ),
    );
  }
}
