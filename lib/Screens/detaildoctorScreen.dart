import 'package:flutter/material.dart';

class DetailDoctorScreen extends StatelessWidget {
  final String image;
  final String name;
  final String specialist;
  final double patients;
  final int experience;
  final String hospital;
  final String about;
  final double rating;

  DetailDoctorScreen(
      {required this.name,
      required this.image,
      required this.specialist,
      required this.patients,
      required this.experience,
      required this.hospital,
      required this.about,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 415,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(0),
                    // alignment: Alignment.bottomCenter,
                    color: Color.fromARGB(255, 253, 253, 253),
                    width: double.infinity,
                    height: 400,
                    child: Image.asset(
                      image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25, left: 5),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.only(right: 8),
                      alignment: Alignment.bottomRight,
                      height: 415,
                      width: double.infinity - 40,
                      child: Container(
                        height: 30,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 247, 189, 30),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$rating ',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                children: [
                  Text(
                    specialist,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' |',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    ' $hospital',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(12),
              child: Text(
                about,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 18,
                  color: Color.fromARGB(255, 105, 104, 104),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Experinece',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$experience Years',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '|',
                    style: TextStyle(color: Colors.grey, fontSize: 50),
                  ),
                  Column(
                    children: [
                      Text(
                        'Patients',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '$patients K',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.video_call,color: Colors.white,),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Make a appointment',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
