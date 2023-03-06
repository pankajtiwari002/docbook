import 'dart:ffi';
// import 'dart:html';
import 'package:flutter/material.dart';

class Doctor {
  final int id;
  final String hospital;
  final String about;
  final String name;
  final String specialist;
  final double rating;
  final double patients;
  final int experience;
  final String imageurl;

  Doctor({
    required this.id,
    required this.name,
    required this.imageurl,
    required this.patients,
    required this.experience,
    required this.specialist,
    required this.hospital,
    required this.about,
    required this.rating
  });
}

class Doctors with ChangeNotifier {
  final List<Doctor> doctor = [
    Doctor(
      id: 1,
      name: 'Dr. Pankaj Tiwari',
      imageurl: 'assets/images/d1.png',
      patients: 3.02,
      experience: 10,
      specialist: 'Cardiologist',
      hospital: 'BLk Super Speciality Hospital',
      rating: 4.5,
      about: 'Dr. Pankaj Tiwari is a renowned Cardiologist with extensive experience in the diagnosis and treatment of cardiovascular disease. He is highly regarded for his expertise in interventional cardiology and including angioplasty.'
    ),
    Doctor(
      id: 2,
      name: 'Dr. Santosh Devi',
      imageurl: 'assets/images/d2.png',
      patients: 4.16,
      experience: 12,
      specialist: 'Ophthalmologist',
      hospital: 'Columbia Asia Hospital',
      rating: 5,
      about: 'Dr. Santosh Devi is a highly skilled Ophthalmologist with extensive experience in diagnosis and treating a wide range of ey condition. With a commitment to providing personalized care,she strives to help her patients achieve optimal eye health and vision. Her expertise and compassionate approach have earned her a reputation as a trusted and respected eye specialist.'
    ),
    Doctor(
      id: 3,
      name: 'Dr. Jayshree Dadhich',
      imageurl: 'assets/images/d3.png',
      patients: 2.82,
      experience: 8,
      specialist: 'neurologist',
      hospital: 'Narayana Health Hospital',
      rating: 4.8,
      about: 'Dr. Jay Shree Dadhich is a renowned Neurologist who is dedicated to providing exceptional care to her patients. With extensive knowledge and expertise in the field of neurology, she specializes in diagnosing and treating various neurological disorders. Her compassionate approach and commitment to patient-centered care have made her a trusted and respected name in her field.'
    ),
  ];

  List<Doctor> get doctors{
    return [...doctor];
  }
}
