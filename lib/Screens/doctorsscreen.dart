import 'package:docbook/Provider/doctorprovider.dart';
import 'package:docbook/Widgets/doctoritem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DoctorsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctor = Provider.of<Doctors>(context).doctors;
    return Scaffold(
      //backgroundColor: Colors.,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text('Doctor\'s Available',
        // style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      body: Container(
        margin: EdgeInsets.zero,
        child: GridView(
          children: doctor
              .map((doc) => DoctorItem(
                    about: doc.about,
                    name: doc.name,
                    specialist: doc.specialist,
                    patients: doc.patients,
                    experience: doc.experience,
                    rating: doc.rating,
                    hospital: doc.hospital,
                    image: doc.imageurl,
                  ))
              .toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          ),
        ),
      ),
    );
  }
}
