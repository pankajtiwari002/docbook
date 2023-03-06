import 'package:docbook/Provider/doctorprovider.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class Exercise{
  final String title;
  final String imageurl;
  final String content;

  Exercise({
    required this.title,
    required this.content,
    required this.imageurl
  });
}

class Category {
  final String category;
  final String description;
  final String imageurl;
  final List<Doctor> suggestedDoctor;
  final List<Exercise> exercise;

  Category({
    required this.category,
    required this.description,
    required this.imageurl,
    required this.suggestedDoctor,
    required this.exercise
  });
}

class Categories with ChangeNotifier {
  // final List<Doctor> doctor = Provider.of<Doctors>(context).doctors;
  final List<Category> categories = [
    Category(
      category: 'Cardiologist',
      description: 'The rapid increase in the use of mobile phones (MPs) in recent years has raised the problem of health risk connected with high-frequency electromagnetic fields. There are reports of headache, dizziness, numbness in the thigh, and heaviness in the chest among MP users. This paper deals with the neurological effect of electromagnetic fields radiated from MPs, by studies on heart rate variability (HRV) of 14 male volunteers. As heart rate is modulated by the autonomic nervous system, study of HRV can be used for assessing the neurological effect. The parameters used in this study for quantifying the effect on HRV are scaling exponent and sample entropy. The result indicates an increase in both the parameters when MP is kept close to the chest and a decrease when kept close to the head. MP has caused changes in HRV indices and the change varied with its position, but the changes cannot be considered significant as the p values are high.',
      imageurl: 'assets/images/f3.jpeg',
      suggestedDoctor: [
        Doctor(
            id: 1,
            name: 'Dr. Pankaj Tiwari',
            imageurl: 'assets/images/d1.png',
            patients: 3.02,
            experience: 10,
            specialist: 'Cardiologist',
            hospital: 'BLk Super Speciality Hospital',
            rating: 4.5,
            about:
                'Dr. Pankaj Tiwari is a renowned Cardiologist with extensive experience in the diagnosis and treatment of cardiovascular disease. He is highly regarded for his expertise in interventional cardiology and including angioplasty.'),
      ],
      exercise: []
    ),
    Category(
      category: 'Neurologist',
      description: 'While mobile phones offer many benefits, there are also concerns about the impact they may have on our brains. Here are some ways in which mobile phones can affect our brains:\nIncreased radiation exposure: Mobile phones emit electromagnetic radiation, which has been linked to various health concerns, including cancer, although there is no conclusive evidence to support this claim.\nDisrupted sleep patterns: Exposure to the blue light emitted by mobile phone screens can suppress the production of melatonin, a hormone that regulates sleep. This can lead to disrupted sleep patterns and other sleep-related issues.\nReduced attention span: Constant notifications, alerts, and messages can be distracting and disrupt our ability to concentrate, leading to a reduced attention span.',
      imageurl: 'assets/images/f1.jpeg',
      suggestedDoctor: [
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
    ],
    exercise: [
      Exercise(
        title: 'Bhramari Pranayama (Bee Breathing)',
         content: 'Releases negative emotions like anger, agitation, frustration, and anxiety.\nImproves concentration and memory.\nBuilds confidence.',
          imageurl: 'assets/images/e1.webp'
        ),
      Exercise(
        title: 'Paschimottanasana (Seated Forward Bend)',
         content: 'Stretches the spine and helps relieve stress.\nRelaxes the mind by removing negative emotions like irritability and anger.',
          imageurl: 'assets/images/e2.jpg'
        ),
    ]
    ),
    Category(
      category: 'Ophthalmologist',
      description: 'Staring at your smartphone for prolonged hours can lead to various issues such as tired, itchy, and dry eyes, or even blurred vision and headaches. Since eye damage caused by cellphone use is often long term, it is best to tackle this issue by preventing it rather than looking for a cure later on.',
      imageurl: 'assets/images/f2.png',
      suggestedDoctor: [
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
    ],
    exercise: []
    ),
  ];

  List<Category> get getcategories{
    return [...categories];
  }
}
