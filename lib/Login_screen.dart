import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:DGEST/Student_screens/Home_student_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  //TODO:Da al mfrod sign up w lasa h3melha sign in w nshof hn3mel asln sign up wala l2.
  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundImage(
        image: 'images/sora5.jpeg',
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'DGEST',
                    style: TextStyle(
                      fontFamily: 'PressStart2P',
                      fontSize: 70.0,
                      color: Color(0xFFecf8f8),
                    ),
                  ),
                  Text(
                    'Welcome ツ',
                    style: TextStyle(
                        fontFamily: 'Lobster',
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  TextFiledLogIn(
                    hintText: 'Username',
                    hideText: false,
                    onChange: (value) {
                      email = value;
                    },
                  ),
                  TextFiledLogIn(
                    hintText: 'Password',
                    hideText: true,
                    onChange: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonLogIn(
                    buttonText: 'Sign In',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 120.0),
                    onPress: () async {
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: email, password: password);
                        if (newUser != null) {
                          Navigator.pushNamed(context, '/home');
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                  ),
                  Text(
                    'Forget Password ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Don\'t have an account ?',
                    style: TextStyle(color: Colors.white),
                  ),
                  ButtonLogIn(
                    buttonText: 'Sign Up',
                    buttonPadding: EdgeInsets.symmetric(horizontal: 60.0),
                    onPress: () {
                      print('Sign Up Buttons is Pressed !');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFiledLogIn extends StatelessWidget {
  TextFiledLogIn({@required this.hintText, this.hideText, this.onChange});
  final String hintText;
  final bool hideText;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 5.0),
      child: TextField(
        obscureText: hideText,
        style: TextStyle(color: Colors.black),
        onChanged: onChange,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}

class ButtonLogIn extends StatelessWidget {
  ButtonLogIn(
      {@required this.buttonText, this.buttonPadding, @required this.onPress});
  final String buttonText;
  final EdgeInsetsGeometry buttonPadding;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Color(0xFF06D6A0),
        shape: StadiumBorder(),
        padding: buttonPadding,
        onPressed: onPress,
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 20, color: Colors.black54),
        ),
      ),
    );
  }
}
