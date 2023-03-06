import 'package:docbook/Screens/detaildoctorScreen.dart';
import 'package:flutter/material.dart';

class DoctorItem extends StatelessWidget {
  final String image;
  final String name;
  final String specialist;
  final double patients;
  final int experience;
  final String hospital;
  final String about;
  final double rating;

  DoctorItem(
      {required this.about,
      required this.name,
      required this.specialist,
      required this.patients,
      required this.experience,
      required this.rating,
      required this.hospital,
      required this.image});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailDoctorScreen(
                  name: name,
                  image: image,
                  specialist: specialist,
                  patients: patients,
                  experience: experience,
                  hospital: hospital,
                  about: about,
                  rating: rating,
                )));
      },
      child: Card(
        elevation: 8,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              CircleAvatar(
                radius: 29.1,
                backgroundImage: AssetImage(image),
              ),
              Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                specialist,
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.grey,
                    fontSize: 10),
              ),
            ],
          ),
          // decoration: BoxDecoration(
          //   //   gradient: LinearGradient(
          //   // colors: [
          //   //   color.withOpacity(0.7),
          //   //   color,
          //   // ],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // )),
        ),
      ),
    );
  }
}
