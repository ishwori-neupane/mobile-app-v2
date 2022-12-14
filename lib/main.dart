import 'package:firebase_core/firebase_core.dart';
import 'package:firsttask/home.dart';
import 'package:flutter/material.dart';

import 'camera/video.dart';
import 'login/login.dart';
import 'login/otp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "phone",
      routes: {
        'phone': (context) => MyPhone(),
        'camera': (context) => MyCamera(),
        "otp": (context) => MyOTP(),
        "home": (context) => Home(),
      },
    );
  }
}
