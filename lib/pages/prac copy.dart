import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class OrderList extends StatelessWidget {
  const OrderList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("User's Order"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, "/dashboard", (route) => false);
              },
              icon: Icon(Icons.arrow_back_ios_sharp)
            )
          ],
        ),
        
        body: ListView(
            children: const [
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: June 11, 2023\n Order Delivered: June 12, 2023"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: February 14, 2023\n Order Delivered: February 16, 2023"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: December 11, 2022\n Order Delivered: December 21, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: November 23, 2022\n Order Delivered: November 24, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
                            ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: November 17, 2022\n Order Delivered: November 23, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: October 27, 2022\n Order Delivered: October 30, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: July 11, 2022\n Order Delivered: July 15, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: April 21, 2022\n Order Delivered: April 22, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
                            ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: March 29, 2022\n Order Delivered: April 4, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: March 1, 2022\n Order Delivered: March 3, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: January 11, 2022\n Order Delivered: January 15, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
              ListTile(
                title: Text("Tamal Biswas"),
                subtitle: Text("Order Placed: January 20, 2022\n Order Delivered: January 25, 2022"),
                leading: CircleAvatar(
                  child: Icon(Icons.book_online),
                ),
                trailing: Icon(Icons.account_circle),
              ),
            ],
          ),
      ),
    );
  }
}