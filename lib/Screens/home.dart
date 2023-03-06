import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:docbook/Provider/categoryprovider.dart' as cat;
import 'package:docbook/Provider/doctorprovider.dart';
import 'package:docbook/Screens/detaildoctorScreen.dart';
import 'package:docbook/Screens/customsearchdelegate.dart';
import 'package:docbook/Widgets/Availabledoctorpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../constants.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import '../Widgets/categorywidget.dart';
import '../Widgets/pages.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController controller = PageController();
  late int count;
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

  // final specialist = ['cardiologist', 'ophthalmologist', 'neurologist'];
  List<String> searchTerms = [];

  var themeSwitcher = ThemeSwitcher(builder: (context) {
      return AnimatedCrossFade(
        duration: Duration(milliseconds: 200),
        crossFadeState: Theme.of(context).brightness == Brightness.dark
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        firstChild: GestureDetector(
          onTap: () =>
              ThemeSwitcher.of(context).changeTheme(theme: kLightTheme),
          child: Icon(
            LineAwesomeIcons.sun,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        secondChild: GestureDetector(
          onTap: () => ThemeSwitcher.of(context).changeTheme(theme: kDarkTheme),
          child: Icon(
            LineAwesomeIcons.moon,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
      );
    });

  void make(List<Doctor> doctor) {
    doctor.forEach((element) {
      searchTerms.add(element.name);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Doctor> doctor = Provider.of<Doctors>(context).doctors;
    final List<cat.Category> categories =
        Provider.of<cat.Categories>(context).getcategories;
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
              SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    IconButton(
                      onPressed: () {
                        if (count == 0) {
                          make(doctor);
                          count = 1;
                        }
                        // make(doctor);
                        showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(doctor, searchTerms));
                        // searchTerms.clear();
                      },
                      icon: Icon(Icons.search),
                    ),
                    // IconButton(
                    //   onPressed: () {
              
                    //   },
                    //   icon: Icon(Icons.chat),
                    // ),
                    // themeSwitcher,
                  ],
                ),
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
                height: 160,
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
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: categories.map((category) {
                          return CategoryWidget(
                              category: category.category,
                              description: category.description,
                              imageurl: category.imageurl,
                              suggestedDoctor: category.suggestedDoctor,
                              exercise: category.exercise);
                        }).toList(),
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
