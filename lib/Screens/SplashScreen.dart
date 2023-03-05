import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? logIn;
  Future<bool> autoLogin()async{
    final prefs = await SharedPreferences.getInstance();
    if(!prefs.containsKey('isLogin')){
      logIn = false;
      return false;
    }
    logIn = await prefs.getBool('isLogin');
    log(logIn.toString());
    return logIn!;
  }

  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 2), () => autoLogin().then((value) async{
      if(value){
        Navigator.pushNamedAndRemoveUntil(context, 'tabs', (route) => false);
      }else{
        Navigator.pushNamedAndRemoveUntil(context, 'phone', (route) => false);
      }
    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              child: Image.asset('assets/images/logo.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}