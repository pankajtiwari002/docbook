import 'package:flutter/material.dart';

import '../Provider/categoryprovider.dart';
import '../Provider/doctorprovider.dart';
import '../Widgets/Availabledoctorpage.dart';

class CategoryDetailScreen extends StatefulWidget {
  final String category;
  final String description;
  final String imageurl;
  final List<Doctor> suggestedDoctor;
  final List<Exercise> exercise;

  CategoryDetailScreen({
    required this.category,
    required this.description,
    required this.imageurl,
    required this.suggestedDoctor,
    required this.exercise,
  });

  @override
  State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
}

class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
  PageController controller = PageController();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 18, 241),
        title: Text(widget.category),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'About',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                widget.description,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20,),
              Text(
                'Suggested Exercises',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                // height: 500,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: widget.exercise.map((ele) {
                    return Container(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              ele.title,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 100,
                              child: Image.asset(ele.imageurl),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(ele.content),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Suggested Doctors",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 200,
                child: PageView.builder(
                  itemCount: widget.suggestedDoctor.length,
                  controller: controller,
                  itemBuilder: (BuildContext context, int index) {
                    return AvailableDoctorPage(
                      name: widget.suggestedDoctor[index].name,
                      image: widget.suggestedDoctor[index].imageurl,
                      patients: widget.suggestedDoctor[index].patients,
                      specialist: widget.suggestedDoctor[index].specialist,
                      experience: widget.suggestedDoctor[index].experience,
                      hospital: widget.suggestedDoctor[index].hospital,
                      about: widget.suggestedDoctor[index].about,
                      rating: widget.suggestedDoctor[index].rating,
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
      ),
    );
  }
}
