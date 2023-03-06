import 'package:docbook/Authentication/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Phone extends StatefulWidget {
  static String verify = "";
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController countryCode = TextEditingController();
  String phone = '';

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = '+91';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'We need to register your phone before getting started!',
                style: TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Container(
                      width: 30,
                      child: TextField(
                        controller: countryCode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.phone,
                      ),
                    ),
                    const Text(
                      '|',
                      style: TextStyle(color: Colors.grey, fontSize: 34),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: 'Phone',
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          onChanged: ((value) {
                            phone = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              // Row(
              //   children: [
              //     Text('If you not reister? '),
              //     TextButton(
              //       onPressed: () {
              //         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SignUp()));
              //       },
              //       child: Text('sign up'),
              //     ),
              //   ],
              // ),
              Container(
                height: 45,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () async {
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCode.text + phone,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        Phone.verify = verificationId;
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    Navigator.pushNamed(context, 'otp');
                  },
                  child: const Text('Send the code'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
