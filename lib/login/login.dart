import 'package:firebase_auth/firebase_auth.dart';
import 'package:firsttask/login/otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyPhone extends StatefulWidget {
  const MyPhone({super.key});
  static String verify = "";

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController countrycode = TextEditingController();
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
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            width: 200,
            'images/download.jpg',
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
                  child: TextField(
                    controller: countrycode,
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
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    onChanged: (value) {
                      phone = value;
                    },
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
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth.verifyPhoneNumber(
                phoneNumber: '${countrycode.text + phone}',
                verificationCompleted: (PhoneAuthCredential credential) {},
                codeAutoRetrievalTimeout: (String verificationId) {},
                codeSent: (String verificationId, int? forceResendingToken) {
                  MyPhone.verify = verificationId;
                },
                verificationFailed: (FirebaseAuthException error) {},
              );
              Navigator.pushNamed(context, "otp");
            },
            child: const Text("Next"),
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
          )
        ]),
      ),
    ));
  }
}
