import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'login_screen.dart';
import 'registration_screen.dart';
import '../widgets/round_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const tag = "Welcome_Screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
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
            Row(
              children: <Widget>[
                Flexible(
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: "logo",
                    child: Container(
                      child: Image.asset('images/logo.png'),
                      height: 65.0,
                    ),
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  speed: Duration(milliseconds: 250),
                  totalRepeatCount: 3,
                ),
              ],
            ),
            SizedBox(
              height: 16.0,
            ),
            Hero(
              tag: "login",
              child: RoundButton(
                color: Colors.lightBlueAccent,
                text: 'Log In',
                onPress: () {
                  setState(() {
                    Navigator.pushNamed(context, LoginScreen.tag);
                  });
                },
              ),
            ),
            Hero(
              tag: "register",
              child: RoundButton(
                color: Colors.blueAccent,
                text: "Register",
                onPress: () {
                  setState(() {
                    Navigator.pushNamed(context, RegistrationScreen.tag);
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

