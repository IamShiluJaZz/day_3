

import 'package:day_3/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';





Future<void> main() async {
  await Firebase.initializeApp(

    options: DefaultFirebaseOptions.currentPlatform,

);
  runApp(MaterialApp(home: Login()));
}

