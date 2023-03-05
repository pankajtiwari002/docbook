import 'dart:developer';

import 'package:docbook/Authentication/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String smsCode = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(50)),
                child: Image.asset('assets/images/logo.jpg'),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Phone Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'We need to register your phone without getting started!',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Pinput(
                length: 6,
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onChanged: (val) {
                  smsCode = val;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: Phone.verify, smsCode: smsCode);
                      await auth.signInWithCredential(credential);
                      log(Phone.verify.toString());
                      final prefs = await SharedPreferences.getInstance();
                      prefs.setBool('isLogin', true);
                      Navigator.pushNamedAndRemoveUntil(context, 'home', (route) => false);
                    } catch (e) {
                      log(Phone.verify.toString());
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Wrong Otp',textAlign: TextAlign.center,)));
                    }
                  },
                  child: const Text('verify Phone number'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
