// ignore_for_file: unused_local_variable, use_build_context_synchronously, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firsttask/login/login.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

    

    
    var code = "";
    return Scaffold(
        extendBodyBehindAppBar: true,
        // backgroundColor: Colors.lime,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "phone");
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.only(left: 25, right: 25,top: 25),
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              
              
              const Text("Do you wanna take video??"),
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "camera");
                  },
                  child: const Text("Take Video")),
             
            ]),
          ),
        ));
  }
}