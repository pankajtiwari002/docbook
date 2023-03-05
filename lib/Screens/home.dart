import 'package:docbook/Provider/doctor.dart';
import 'package:docbook/Widgets/Availabledoctorpage.dart';
import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../Widgets/category.dart';
import '../Widgets/pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  // int numberOfPages = 3;
  int currentPage = 0;
  // final images = [
  //   'assets/images/d1.png',
  //   'assets/images/d2.png',
  //   'assets/images/d3.png',
  // ];
  // final name = [
  //   'Dr. Pankaj Tiwari',
  //   'Dr. Santosh Devi',
  //   'Dr. Jayshree Dadhich'
  // ];

  final specialist = ['cardiologist', 'ophthalmologist', 'neurologist'];
  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctor = Provider.of<Doctors>(context).doctors;
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home'),
      // ),
      backgroundColor: Colors.blue[50],
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Text(
                        'Find Your',
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Text(
                        '   Specialist',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 160,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.chat)),
                ],
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: PageView.builder(
                  itemCount: doctor.length,
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    return Pages(doctor[index].imageurl, doctor[index].name,
                        doctor[index].specialist);
                  },
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                ),
              ),
              Container(
                height: 140,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ))
                      ],
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Category('Neurologist', 'assets/images/f1.jpeg'),
                          const SizedBox(width: 10),
                          Category('Ophthanologist', 'assets/images/f2.png'),
                          const SizedBox(
                            width: 10,
                          ),
                          Category('Cardiologist', 'assets/images/f3.jpeg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Available Doctors',
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              'See All',
                              style: TextStyle(
                                color: Colors.grey[600],
                              ),
                            ))
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 200,
                      child: PageView.builder(
                        itemCount: doctor.length,
                        controller: controller,
                        itemBuilder: (BuildContext context, int index) {
                          return AvailableDoctorPage(
                            name: doctor[index].name,
                            image: doctor[index].imageurl,
                            patients: doctor[index].patients,
                            specialist: doctor[index].specialist,
                            experience: doctor[index].experience,
                            hospital: doctor[index].hospital,
                            about: doctor[index].about,
                            rating: doctor[index].rating,
                          );
                        },
                        onPageChanged: (value) {
                          setState(() {
                            currentPage = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: const GNav(
      //   tabMargin: EdgeInsets.all(4),
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   padding: EdgeInsets.all(16),
      //   tabBackgroundColor: Color.fromARGB(255, 22, 18, 241),
      //   backgroundColor: Colors.white,
      //   gap: 8,
      //   tabs: [
      //     GButton(
      //       icon: Icons.home,
      //       // iconColor: Colors.white,
      //       iconActiveColor: Colors.white,
      //       text: 'Home',
      //       textColor: Colors.white,
      //     ),
      //     GButton(
      //       icon: Icons.people,
      //       // iconColor: Colors.white,
      //       iconActiveColor: Colors.white,
      //       text: 'Doctor',
      //       textColor: Colors.white,
      //     ),
      //     GButton(
      //       icon: Icons.settings,
      //       // iconColor: Colors.white,
      //       iconActiveColor: Colors.white,
      //       text: 'Settings',
      //       textColor: Colors.white,
      //     ),
      //     GButton(
      //       icon: Icons.person,
      //       // iconColor: Colors.white,
      //       iconActiveColor: Colors.white,
      //       text: 'Profile',
      //       textColor: Colors.white,
      //     ),
      //   ],
      // ),
    );
  }
}
