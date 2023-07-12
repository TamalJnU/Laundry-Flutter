import 'package:flutter/material.dart';
import 'package:laundryapp/pages/view.dart';

import '../models/postModel.dart';
import '../services/service.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late List<PostModel>? _userModel = [];

  void _getData() async {
    _userModel = (await UserService().getPosts())!;
    print("----------------");
        print(_userModel);

    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getData();
  }

  Widget _getPostList(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Users'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, "/signup", (route) => false);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)
          )
        ],
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: const Text('No Data'),
            )
          : Center(
              child: ListView.builder(
                itemCount: _userModel!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text(_userModel![index].name.toString()),
                    subtitle: Text(_userModel![index].email.toString()),
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) =>
                              ViewForm(posts: _userModel![index]),
                          ),
                          (route) => false,
                        );
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                    isThreeLine: true,
                  );
                },
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getPostList(context);
  }
}
