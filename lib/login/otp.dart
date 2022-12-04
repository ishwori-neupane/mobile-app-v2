// ignore_for_file: unused_local_variable, use_build_context_synchronously, sort_child_properties_last

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firsttask/login/login.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import 'alert.dart';

class MyOTP extends StatefulWidget {
  const MyOTP({super.key});

  @override
  State<MyOTP> createState() => _MyOTPState();
}

class _MyOTPState extends State<MyOTP> {
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
          margin: const EdgeInsets.only(left: 25, right: 25),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                "Enter OTP",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Did not get otp??",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {

                  FirebaseAuth auth = FirebaseAuth.instance;
              await auth.verifyPhoneNumber(
        phoneNumber:MyPhone.phonenumber,
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) {
          setState(() {});
          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) async {
          setState(() {
           MyPhone.verify = verificationID;
          });
          Navigator.pushNamed(context, "otp");
        },
        codeAutoRetrievalTimeout: (verificationID) async {});
                  
                },
                child: const Text("Resend Otp."),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                onChanged: (value) {
                  code = value;
                },
                // pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                // onCompleted: (pin) => print(pin),
              ),
              ElevatedButton(
                  onPressed: () async{
                    // Navigator.pushNamed(context, "phone");
                    // print('fg');
                    try{
                        FirebaseAuth auth = FirebaseAuth.instance;

                    PhoneAuthCredential credential = 
                    PhoneAuthProvider.credential(verificationId: MyPhone.verify, smsCode: code);

                  // Sign the user in (or link) with the credential
                    await auth.signInWithCredential(credential);
                     Navigator.pushNamed(context, "home");
                    }catch(e){
                      showErrorDialog(context , 'error' , 'wrong otp !');
                    }
                    
                     

              


                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                  child: const Text("Verify Otp.")),
              // const Text("Do you wanna take video??"),
              // TextButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, "camera");
              //     },
              //     child: const Text("Take Video")),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     TextButton(
              //         onPressed: () {
              //           Navigator.pushNamed(context, "phone");
              //         },
              //         child: const Text("Back")),
              //   ],
              // )
            ]),
          ),
        ));
  }
}