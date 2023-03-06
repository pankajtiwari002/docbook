// import 'package:docbook/Screens/detaildoctorScreen.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:docbook/Provider/categoryprovider.dart';
import 'package:docbook/Screens/tabsscreen.dart';
import 'package:docbook/constants.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
// import 'dart:html';

import 'Provider/doctorprovider.dart';
import 'Screens/SplashScreen.dart';
import 'Screens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import './Authentication/otp.dart';
import './Authentication/phone.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget{
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   log(logIn.toString());
  //   autoLogin().then((value) {
      
  //     setState(() {
  //       logIn = value;
  //     });
  //     // log(logIn.toString() + ' 1');
  //   });
  //   super.initState();
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Doctors(),
        ),
        ChangeNotifierProvider(
          create: (context) => Categories(),
        ),
      ],
      child: Phoenix(
        child: ThemeProvider(
          initTheme: kDarkTheme,
          child: Builder(builder: (context){
            return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'DocBook',
          routes: {
            // 'detail screen':(context) => DetailDoctorScreen(),
            'otp':(context) => Otp(),
            'phone': (context) => Phone(),
            'home' : (context) => Home(),
            'splash': (context) => SplashScreen(),
            'tabs': (context)=> TabsScreen(),
          },
          initialRoute: 'splash',
            );
          })
        ),
      ),
    );
  }
}
