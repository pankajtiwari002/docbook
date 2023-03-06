import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  final image;
  final name;
  final specialist;
  Pages(this.image, this.name, this.specialist);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      // color: Colors.blue,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 22, 18, 241),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            // mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 5,
              ),
              Text(
                'Looking for your Disease\n Specialist Doctor?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
              Text(
                specialist,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              )
            ],
          ),
          Container(
            height: double.infinity,
            width: 113,
            child: Image.asset(image,fit: BoxFit.cover,),
          )
        ],
      ),
    );
  }
}
