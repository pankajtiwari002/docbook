// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class SignUp extends StatefulWidget {
//   static String username = "";
//   static String phone = "";
//   static String verify = "";
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController countryCode = TextEditingController();
//   String phone = '';
//   String username = '';
//   @override
//   void initState() {
//     // TODO: implement initState
//     countryCode.text = '+91';
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         color: Colors.white,
//         alignment: Alignment.center,
//         margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Container(
//                 height: 150,
//                 width: 150,
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(50)),
//                 child: Image.asset('assets/images/logo.jpg'),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'Phone Verification',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               const Text(
//                 'We need to register your phone before getting started!',
//                 style: TextStyle(fontSize: 15),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 padding: EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   border: Border.all(),
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     border: InputBorder.none,
//                     label: Text('Username'),
//                     hintText: 'Enter Username'
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10,),
//               Container(
//                 padding: EdgeInsets.only(left: 10),
//                 decoration: BoxDecoration(
//                     border: Border.all(),
//                     borderRadius: BorderRadius.circular(10)),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 30,
//                       child: TextField(
//                         controller: countryCode,
//                         decoration: const InputDecoration(
//                           border: InputBorder.none,
//                         ),
//                         keyboardType: TextInputType.phone,
//                       ),
//                     ),
//                     const Text(
//                       '|',
//                       style: TextStyle(color: Colors.grey, fontSize: 34),
//                     ),
//                     Expanded(
//                       child: Container(
//                         margin: const EdgeInsets.only(left: 10),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             hintText: 'Phone',
//                             border: InputBorder.none,
//                           ),
//                           keyboardType: TextInputType.phone,
//                           onChanged: ((value) {
//                             phone = value;
//                           }),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Container(
//                 height: 45,
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   style: ButtonStyle(),
//                   onPressed: () async {
//                     await FirebaseAuth.instance.verifyPhoneNumber(
//                       phoneNumber: countryCode.text + phone,
//                       verificationCompleted:
//                           (PhoneAuthCredential credential) {},
//                       verificationFailed: (FirebaseAuthException e) {},
//                       codeSent: (String verificationId, int? resendToken) {
//                         SignUp.verify = verificationId;
//                       },
//                       codeAutoRetrievalTimeout: (String verificationId) {},
//                     );
//                     SignUp.phone = countryCode.text + phone;
//                     SignUp.username = username;
//                     Navigator.pushNamed(context, 'otp');
//                   },
//                   child: const Text('Send the code'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
