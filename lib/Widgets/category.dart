import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String image;
  final String disease;

  Category(this.disease ,this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15)
      ),
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            child: Image.asset(image,fit: BoxFit.cover,),
          ),
          Text(disease),
        ],
      ),
    );
  }
}