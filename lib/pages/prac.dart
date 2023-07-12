import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper.dart';

class Prac extends StatelessWidget {
  const Prac({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Prac"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (route) => false);
              },
              icon: Icon(Icons.arrow_back_ios_sharp)
            )
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          Icon(
            Icons.dashboard,
            size: 30.0,
            color: activeIndex == 0 ? Colors.white : Color(0xFFC8C9CB),
          ),
          IconButton(
            onPressed: () {
              nextScreen(context, "/homepage");
            },
            icon: Icon(Icons.home),
            iconSize: 30.0,
          ),
          Icon(
            Icons.add,
            size: 30.0,
            color: activeIndex == 2 ? Colors.white : Color(0xFFC8C9CB),
          ),
          // Icon(
          //   Icons.favorite,
          //   size: 30.0,
          //   color: activeIndex == 3 ? Colors.white : Color(0xFFC8C9CB),
          // ),
          IconButton(
            onPressed: () {
              nextScreen(context, "/prac");
            },
            icon: Icon(Icons.favorite),
            iconSize: 30.0,
          ),
          Icon(
            Icons.settings,
            size: 30.0,
            color: activeIndex == 4 ? Colors.white : Color(0xFFC8C9CB),
          ),
        ],
        // onTap: (index) {
        //   setState(() {
        //     activeIndex = index;
        //   });
        // },
      ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              Container(
        color: Colors.blueGrey,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: const Image(
        //   image: AssetImage("images/image-5.jpg"),
        // ),
      ),
      Container(
        color: Colors.lightGreen,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: const Image(
        //   image: AssetImage("images/image-4.jpg"),
        // ),
      ),
      Container(
        color: Colors.purple,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: const Image(
        //   image: AssetImage("images/image-3.jpg"),
        // ),
      ),
      Container(
        color: Colors.blueAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: const Image(
        //   image: AssetImage("images/image-2.jpg"),
        // ),
      ),
      Container(
        color: Colors.orangeAccent,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // child: const Image(
        //   image: AssetImage("images/image-1.jpg"),
        // ),
      ),
            ],
          ),
        ),
      ),
    );
  }
}