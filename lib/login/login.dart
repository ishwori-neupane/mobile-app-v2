// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});
  static String verify = "";
  static String phonenumber = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  
  String verificationID = "";
  TextEditingController countrycode = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _PhoneController = TextEditingController();
  var phone = "";
  @override
  void initState() {
    countrycode.text = '+977';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.lime,
        body: Container(
      margin: const EdgeInsets.only(left: 25, right: 25),
      alignment: Alignment.center,
      child: Form(
               key: _formKey,
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            width: 200,
            'assets/images/download.jpg',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "Phone Verification",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Enter Your Mobile number.",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 55,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextFormField(
                    controller: countrycode,
                   
                validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Country Code is required !';
              }
              return null;
            },
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "+977"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  '|',
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _PhoneController,
                   
                validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Phone number is required !';
              }
              return null;
            },
                    keyboardType: TextInputType.phone,
                    
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "Phone"),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () async {
               if (_formKey.currentState!.validate()){

              // FirebaseAuth auth = FirebaseAuth.instance;
              // await auth.verifyPhoneNumber(
              //   phoneNumber: '${countrycode.text + _PhoneController.text}',
              //   verificationCompleted: (PhoneAuthCredential credential) {},
              //   codeAutoRetrievalTimeout: (String verificationId) {},
              //   codeSent: (String verificationId, int? forceResendingToken) {
              //     MyPhone.verify = verificationId;
              //   },
              //   verificationFailed: (FirebaseAuthException error) {},
              // );
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.verifyPhoneNumber(
        phoneNumber: '${countrycode.text + _PhoneController.text}',
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) {
          setState(() {});
          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) async {
          setState(() {
            this.verificationID = verificationID;
            MyPhone.verify = verificationID;
            MyPhone.phonenumber = '${countrycode.text + _PhoneController.text}';
          });
          Navigator.pushNamed(context, "otp");
        },
        codeAutoRetrievalTimeout: (verificationID) async {});

              
              // Navigator.pushNamed(context, "otp");
               }
            },
            child: const Text("Send Otp"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          )
        ]),
      ),
    )));
  }
}
