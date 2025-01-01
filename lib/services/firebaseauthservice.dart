import 'package:day_3/bottom_navigation_screen.dart';
import 'package:day_3/profilescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

String email = 'admin@gmail.com';

Future<void>signup(
    {
    required String username,
    required String email,
    required String password,
    required BuildContext context}) async {


  // print(username);
  // print(email);
  // print(password);

  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationScreen(),));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Registration Successful")));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
   
  }
}


Future<void>login(
    {
    required String email,
    required String password,
    required BuildContext context}) async {


  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    Navigator.push(context,MaterialPageRoute(builder: (context) => BottomNavigationScreen(),));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Login Successful")));
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
   
  }
}
