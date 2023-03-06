import 'package:flutter/material.dart';

import '../Provider/doctorprovider.dart';
import 'detaildoctorScreen.dart';
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  final List<Doctor> doctor;

  // final docotr = Provider.of<Doctors>(context);
  CustomSearchDelegate(this.doctor, this.searchTerms);

  final List<String> searchTerms;

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<Doctor> matchQuery = [];
    for (var doctorname in searchTerms) {
      if (doctorname.toLowerCase().contains(query.toLowerCase())) {
        doctor.forEach((element) {
          if (element.name == doctorname) {
            matchQuery.add(element);
          }
        });
        // matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          leading: CircleAvatar(
            child: Image.asset(
              result.imageurl,
            ),
          ),
          title: Text(result.name),
          subtitle: Text(result.specialist),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<Doctor> matchQuery = [];
    for (var doctorname in searchTerms) {
      if (doctorname.toLowerCase().contains(query.toLowerCase())) {
        // matchQuery.add(fruit);
        doctor.forEach((element) {
          if (element.name == doctorname) {
            matchQuery.add(element);
          }
        });
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => DetailDoctorScreen(
                        name: result.name,
                        image: result.imageurl,
                        specialist: result.specialist,
                        patients: result.patients,
                        experience: result.experience,
                        hospital: result.hospital,
                        about: result.about,
                        rating: result.rating,
                      )),
            );
          },
          leading: CircleAvatar(
            radius: 30,
            child: Image.asset(
              result.imageurl,
              fit: BoxFit.cover,
            ),
          ),
          subtitle: Text(result.specialist),
          title: Text(result.name),
        );
      },
    );
  }
}
