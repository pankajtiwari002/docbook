import 'package:flutter/material.dart';

class RuntimeData extends StatelessWidget {
  const RuntimeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 249, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text('RunTime Description'),
      ),
      body: Container(
        child: Image.asset('assets/images/img2.jpeg',fit: BoxFit.cover,),
      ),
    );
  }
}