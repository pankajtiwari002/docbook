import 'package:docbook/Screens/doctorsscreen.dart';
import 'package:docbook/Screens/home.dart';
import 'package:docbook/Screens/profilescreen.dart';
import 'package:docbook/Screens/settingsscreen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String,Object>> _pages;
  int _selectedPageIndex = 0;
  void _selctedPage(int index){
    _selectedPageIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    _pages = [
    {'pages': Home(),'title': 'Categories'},
    {'pages': DoctorsScreen(),'title': 'Categories'},
    {'pages': SettingsScreen(),'title': 'Categories'},
    {'pages': Profile(),'title': 'Categories'}
  ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // ignore: sort_child_properties_last
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.pink,
        //   title: Text(_pages[_selectedPageIndex]['title'] as String)
        // ),
        // drawer: MainDrawer(),
        body: _pages[_selectedPageIndex]['pages'] as Widget,
        bottomNavigationBar: GNav(
        tabMargin: EdgeInsets.all(4),
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        padding: EdgeInsets.all(16),
        tabBackgroundColor: Color.fromARGB(255, 22, 18, 241),
        backgroundColor: Colors.white,
        onTabChange: _selctedPage,
        gap: 8,
        tabs: const [
          GButton(
            icon: Icons.home,
            // iconColor: Colors.white,
            iconActiveColor: Colors.white,
            text: 'Home',
            textColor: Colors.white,
          ),
          GButton(
            icon: Icons.people,
            // iconColor: Colors.white,
            iconActiveColor: Colors.white,
            text: 'Doctor',
            textColor: Colors.white,
          ),
          GButton(
            icon: Icons.timelapse,
            // iconColor: Colors.white,
            iconActiveColor: Colors.white,
            text: 'RunTime',
            textColor: Colors.white,
          ),
          GButton(
            icon: Icons.person,
            // iconColor: Colors.white,
            iconActiveColor: Colors.white,
            text: 'Profile',
            textColor: Colors.white,
          ),
        ],
      ),

      ),
      length: 4,
    );

  }
}