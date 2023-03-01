import 'dart:ffi';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String specialist;
  final double patients;
  final int experience;
  final String imageurl;

  Doctor({
    required this.name,
    required this.imageurl,
    required this.patients,
    required this.experience,
    required this.specialist,
  });
}

class Doctors with ChangeNotifier {
  final List<Doctor> doctor = [
    Doctor(
      name: 'Dr. Pankaj Tiwari',
      imageurl: 'assets/images/d1.png',
      patients: 3.02,
      experience: 10,
      specialist: 'Cardiologist',
    ),
    Doctor(
      name: 'Dr. Santosh Devi',
      imageurl: 'assets/images/d2.png',
      patients: 4.16,
      experience: 12,
      specialist: 'Ophthalmologist',
    ),
    Doctor(
      name: 'Dr. Jayshree Dadhich',
      imageurl: 'assets/images/d3.png',
      patients: 2.82,
      experience: 8,
      specialist: 'neurologist',
    ),
  ];

  List<Doctor> get doctors{
    return [...doctor];
  }
}
