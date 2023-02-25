// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'video_app.dart';
import 'my_drawer_header.dart';
import 'contacts.dart';
import 'dashboard.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    var container;
    if (currentPage == DrawerSections.dashboard) {
      container = dashboardPage();
    } else if (currentPage == DrawerSections.contacts) {
      container = contactPage();
    } else if (currentPage == DrawerSections.videos) {
      container =VideoList();
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        elevation: 30,
        //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: const Text(
          'My App',
          style: TextStyle(fontSize: 23),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.search_off_outlined))
        ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                MyHeaderDrawer(),
                MyDrawerList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MyDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        children: [
          menuItem(1, 'Dashboard', Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          menuItem(2, 'Contacts', Icons.people_alt_outlined,
              currentPage == DrawerSections.contacts ? true : false),
          menuItem(3, 'Video', Icons.video_library,
              currentPage == DrawerSections.videos ? true : false),
          menuItem(4, 'Setting', Icons.settings_outlined,
              currentPage == DrawerSections.setting ? true : false),
         
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.contacts;
            } else if (id == 3) {
              currentPage = DrawerSections.videos;
            } else if (id == 4) {
              currentPage = DrawerSections.setting;
            } 
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 25,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  contacts,
  videos,
  setting,
  // ignore: constant_identifier_names
  
}
 
