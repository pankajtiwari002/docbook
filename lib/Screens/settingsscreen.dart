import 'package:docbook/Screens/runtimedata.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text('RunTime'),
      ),
      backgroundColor: Color.fromARGB(255, 250, 249, 249),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Data from Digital Wellbeing',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RuntimeData()));
              },
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(12),
                child: Image.asset('assets/images/img.jpeg'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
