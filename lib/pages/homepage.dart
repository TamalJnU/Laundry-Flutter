import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/helper.dart';

class Homepage extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Homepage> {
  // Track active index
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Constants.scaffoldBackgroundColor,
        buttonBackgroundColor: Constants.primaryColor,
        items: [
          IconButton(
            onPressed: () {
              nextScreen(context, "/dashboard");
            },
            icon: Icon(Icons.dashboard),
            iconSize: 30.0,
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
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
      ),
      //backgroundColor: Constants.primaryColor,
      appBar: AppBar(
          actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (route) => false);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)
          )
        ],
          // actions: [
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamedAndRemoveUntil(context, "/page1", (route) => false);
          //     }, 
          //     icon: Icon(Icons.account_balance_sharp),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamedAndRemoveUntil(context, "/page2", (route) => false);
          //     }, 
          //     icon: Icon(Icons.add_home_work_sharp),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamedAndRemoveUntil(context, "/page3", (route) => false);
          //     }, 
          //     icon: Icon(Icons.add_reaction_outlined),
          //   ),
          //   IconButton(
          //     onPressed: () {
          //       Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
          //     }, 
          //     icon: Icon(Icons.account_circle),
          //   ),
          // ],
          title: InkWell(
            child: Text("Laundree"),
            onTap: () {
              //Navigator.pushNamed(context, '/home');
              Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
            },
          ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blueGrey),
              accountName: Text(
                "Tamal Biswas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "tamal@gmail.com",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Home"),
              onTap: () {
                nextScreen(context, "/homepage");;
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                nextScreen(context, "/dashboard");
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_outlined),
              title: const Text("Your Account"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const AboutListTile(
              icon: Icon(Icons.app_registration_rounded),
              child: Text("About Us"),
              applicationIcon: Icon(Icons.local_play),
              applicationName: 'My First Flutter Application',
              applicationVersion: '1.0.1',
              applicationLegalese: '© 2023 bit',
              aboutBoxChildren: [
                //Content goes here...
              ],
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Logout"),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.email),
        onPressed: () {
          //MySnackBar("Floating Action Button", context);
        },
      ),
      body: ListView(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [

          //       ],
          //     ),
          //   ),
          // ),

          Container(
            height: 200,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img-1.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img-2.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img-3.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img-4.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/img-5.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/t-shirt.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: double.infinity,
                    width: 100,
                  ),
                ],
              ),
            ),
          ),

          // Container(
          //   color: Colors.amberAccent,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.blueGrey,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.greenAccent,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.indigoAccent,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.lightGreenAccent,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.pinkAccent,
          //   height: 250,
          //   width: 250,
          // ),
          // Container(
          //   color: Colors.purpleAccent,
          //   height: 250,
          //   width: 250,
          // ),
          Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/suit.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("First Grid Clicked!!!", context);
                  }, 
                  child: const Text("Suits")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/blazer.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Second Grid Clicked!!!", context);
                  }, 
                  child: const Text("Blazers")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/shoe.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Third Grid Clicked!!!", context);
                  }, 
                  child: const Text("Shoes")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/pant.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Fourth Grid Clicked!!!", context);
                  }, 
                  child: const Text("Pants")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/shirt.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Fifth Grid Clicked!!!", context);
                  }, 
                  child: const Text("Shirts")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/shock.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Sixth Grid Clicked!!!", context);
                  }, 
                  child: const Text("Shocks")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/sofa.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Sixth Grid Clicked!!!", context);
                  }, 
                  child: const Text("Sofa")),
                ),
              ),
              Container(
                height: 250,
                width: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/other.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: ElevatedButton(onPressed: (){
                    //displayToastMessage("Sixth Grid Clicked!!!", context);
                  }, 
                  child: const Text("Others")),
                ),
              ),
        ],
      ),

      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     children: [
      //       IconButton(
      //         onPressed: (){
      //           Navigator.pushNamedAndRemoveUntil(context, '/page1', (route) => false);
      //         }, 
      //         icon: Icon(Icons.access_alarm)
      //       ),
      //       IconButton(
      //         onPressed: (){
      //           Navigator.pushNamedAndRemoveUntil(context, '/page2', (route) => false);
      //         }, 
      //         icon: Icon(Icons.pages)
      //       ),
      //       IconButton(
      //         onPressed: (){
      //           Navigator.pushNamedAndRemoveUntil(context, '/page3', (route) => false);
      //         }, 
      //         icon: Icon(Icons.people)
      //       ),
      //       IconButton(
      //         onPressed: (){
      //           Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      //         }, 
      //         icon: Icon(Icons.home)
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

}
