import 'package:docbook/Screens/Categorydetailscreen.dart';
import 'package:flutter/material.dart';

import '../Provider/categoryprovider.dart';
import '../Provider/doctorprovider.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  final String description;
  final String imageurl;
  final List<Doctor> suggestedDoctor;
  final List<Exercise> exercise;

  CategoryWidget({
    required this.category,
    required this.description,
    required this.imageurl,
    required this.suggestedDoctor,
    required this.exercise,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) => CategoryDetailScreen(category: category, description: description, imageurl: imageurl, suggestedDoctor: suggestedDoctor, exercise: exercise,))));
      },
      child: Container(
        height: 100,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 60,
              child: Image.asset(imageurl,fit: BoxFit.cover,),
            ),
            Text(category),
          ],
        ),
      ),
    );
  }
}