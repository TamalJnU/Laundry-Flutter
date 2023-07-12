import 'package:flutter/material.dart';
import 'package:laundryapp/pages/signup.dart';
import 'package:laundryapp/pages/userlist.dart';

import '../models/postModel.dart';
import '../services/service.dart';

class ViewForm extends StatelessWidget {
  const ViewForm({super.key, this.posts});

  final PostModel? posts;

  Widget getPost(context) {
    return Padding(
      padding: const EdgeInsets.all(19.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: 1.0),
            Text(
              "Id : " + posts!.id.toString(),
              style: TextStyle(fontSize: 15, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            Text(
              posts!.department.toString(),
              style: TextStyle(fontSize: 10, fontFamily: "bolt-semibold"),
              textAlign: TextAlign.left,
            ),
            SizedBox(width: 1.0), // give it width

            TextButton(
              onPressed: () async {
                (await UserService().deletePosts(posts!.id));
                print("Delete Call!");
                Navigator.pushNamedAndRemoveUntil(context, "/userList", (route) => false);
              },
              child: Icon(Icons.delete)),
            TextButton(
              onPressed: () {
                print("Update Call!");
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => Signup(postmodel: posts,),
                  ),
                  (route) => false,
                );
              },
              child: Icon(Icons.update)
            ),
          ],
          // Text(_postsModel![index].body.toString()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // (userModel != null) ? userModel!.name : posts!.title.toString(),
          // product!.name.toString(),
          posts!.name.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                // Navigator.pushNamedAndRemoveUntil(
                //     context, "/home", (route) => false);

                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => UserList(),
                  ),
                  (route) => false,
                );
              },
              icon: Icon(Icons.list_alt))
        ],
      ),
      body: getPost(context),
    );
  }
}