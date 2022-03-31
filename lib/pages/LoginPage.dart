// ignore_for_file: prefer_const_constructors

import 'package:auth_buttons/auth_buttons.dart';

import 'package:flutter/material.dart';
import '../AuthService.dart';
// import '../services/auth_service.dart';
import 'RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home.dart';

//import 'package:auth_buttons/auth_buttons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, 
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            emailInput(),
            paaswordInput(),
            signupButton(),
            signinButton(),
            const Divider(),
            GoogleAuthButton(
              onPressed: () async {
                UserCredential userCredential = await signInWithGoogle();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(),
                    ));
                // your implementation
              },
              darkMode: false,
            ),
          ],
        ),
      ),
    );
  }

  Widget emailInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _email,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.email)),
      ),
    );
  }

  Widget paaswordInput() {
    return SizedBox(
      width: 250,
      child: TextFormField(
        controller: _pass,
        obscureText: true,
        decoration: const InputDecoration(prefixIcon: Icon(Icons.password)),
      ),
    );
  }

  signupButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          RegisterPage()),
                    ));
              // registerUser(_email.text, _pass.text);
            },
            child: const Text('Register'),
          ),
        ],
      ),
    );
  }

  signinButton() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            onPressed: ()  {
              loginUser(_email.text, _pass.text).then((value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            });
            },
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
