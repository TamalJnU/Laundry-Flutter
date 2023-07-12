import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/postModel.dart';
import '../services/service.dart';

class Signup extends StatefulWidget {
  // const Signup({super.key, required this.title});
  // final String title;
  //const Signup({super.key});

  final PostModel? postmodel;
  Signup({this.postmodel});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup Form"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, "/home", (route) => false);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: widget.postmodel == null ? SignupForm() : SignupForm(postmodel2: widget.postmodel,),
      ),
    );
  }
}

class SignupForm extends StatefulWidget {
  //const SignupForm({super.key});

  final PostModel? postmodel2;
  SignupForm({this.postmodel2});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _passKey = GlobalKey<FormFieldState>();

  // String _name = '';
  // String _email = '';
  // int _age = -1;
  // String _maritalStatus = 'single';
  // int _selectGender = 0;
  // String _password = '';
  // bool _termsChecked = true;
  // int _id = 0;

  String _name = '';
  String _email = '';
  String _departmentId = '';
  int _selectDepartment = 0;
  int _selectGender = 0;
  String _password = '';
  bool _termsChecked = true;
  int _id = 0;
  

  void _createUser() async {

  }

  List<DropdownMenuItem<int>> genderList = [];

  void loadGenderList() {
    genderList = [];
    genderList.add(
      DropdownMenuItem(
        child: Text("Male"),
        value: 0,
      ),
    );
    genderList.add(
      DropdownMenuItem(
        child: Text("Female"),
        value: 1,
      ),
    );
    genderList.add(
      DropdownMenuItem(
        child: Text("Others"),
        value: 2,
      ),
    );
  }

  List<DropdownMenuItem<int>> departmentList = [];

  void loadDepartmentList() {
    departmentList = [];
    departmentList.add(
      DropdownMenuItem(
        child: Text("Regular"),
        value: 0,
      ),
    );
    departmentList.add(
      DropdownMenuItem(
        child: Text("Urgent"),
        value: 1,
      ),
    );
    departmentList.add(
      DropdownMenuItem(
        child: Text("Emergency"),
        value: 2,
      ),
    );
  }

  @override
  void initState() {
    //super.initState();
    if(widget.postmodel2 != null){
    _name = widget.postmodel2!.name.toString();
    _email = widget.postmodel2!.email.toString();
    _departmentId = widget.postmodel2!.departmentId.toString();
    _selectDepartment = widget.postmodel2!.department!;
    _selectGender = widget.postmodel2!.gender!;
    _password = widget.postmodel2!.password.toString();
    _id = widget.postmodel2!.id!;
    }
  }

  @override
  Widget build(BuildContext context) {
    loadGenderList();
    loadDepartmentList();
    return Form(
      child: ListView(
        children: getFormWidget(),
      ),
    );
  }

  List<Widget> getFormWidget() {
    List<Widget> formWidget = [];

    formWidget.add(
      TextFormField(
        initialValue: _name,
        decoration: InputDecoration(
          labelText: 'Enter Name',
          hintText: 'Name',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter a name!';
          } else {
            return null;
          }
        },
        onChanged: (text) {  
          _name = text;  
        },
        // onSaved: (value) {
        //   setState(() {
        //     _name = value.toString();
        //   });
        // },
      ),
    );

    validateEmail(String? value) {
      if (value!.isEmpty) {
        return 'Please enter email';
      }
      Pattern pattern =
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
      RegExp regex = RegExp(pattern.toString());
      if (!regex.hasMatch(value.toString())) {
        return 'Enter valid email';
      } else {
        return null;
      }
    }

    formWidget.add(
      TextFormField(
        initialValue: _email,
        decoration: InputDecoration(
          labelText: 'Enter Email',
          hintText: 'Email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: validateEmail,
        onChanged: (text) {  
          _email = text;  
        },
      ),
    );

    formWidget.add(
      TextFormField(
        initialValue: _departmentId,
        decoration: InputDecoration(
          labelText: 'Enter Address',
          hintText: 'Your Address',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your Address!';
          } else {
            return null;
          }
        },
        onChanged: (text) {  
          //_departmentId = int.parse(text.toString()); 
          _departmentId = text; 
        },
      ),
    );


    formWidget.add(
      DropdownButton(
        hint: Text('Select Order Type'),
        items: departmentList,
        value: _selectDepartment,
        onChanged: (value) {
          setState(() {
            _selectDepartment = int.parse(value.toString());
          });
        },
        isExpanded: true,
      ),
    );


    formWidget.add(
      DropdownButton(
        hint: Text('Select Gender'),
        items: genderList,
        value: _selectGender,
        onChanged: (value) {
          setState(() {
            _selectGender = int.parse(value.toString());
          });
        },
        isExpanded: true,
      ),
    );

    // formWidget.add(
    //   Column(
    //     children: <Widget>[
    //       RadioListTile<String>(
    //         title: Text('Single'),
    //         value: 'single',
    //         groupValue: _maritalStatus,
    //         onChanged: (value) {
    //           setState(() {
    //             _maritalStatus = value.toString();
    //           });
    //         },
    //       ),
    //       RadioListTile<String>(
    //         title: Text('Married'),
    //         value: 'married',
    //         groupValue: _maritalStatus,
    //         onChanged: (value) {
    //           setState(() {
    //             _maritalStatus = value.toString();
    //           });
    //         },
    //       ),
    //     ],
    //   ),
    // );

    formWidget.add(
      TextFormField(
        initialValue: _password,
        key: _passKey,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          labelText: 'Enter Password',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter password';
          } else if (value.length < 8) {
            return 'Password should be at least 8 characters';
          } else {
            return null;
          }
        },
      ),
    );

    formWidget.add(
      TextFormField(
        initialValue: _password,
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Confirm Password',
          labelText: 'Enter Confirm Password',
        ),
        validator: (confirmPassword) {
          if (confirmPassword != null && confirmPassword.isEmpty) {
            return 'Please enter confirm password';
          }
          var password = _passKey.currentState?.value;
          if (confirmPassword != null &&
              confirmPassword.compareTo(password) != 0) {
            return 'Password mismatch';
          } else {
            return null;
          }
        },
        onChanged: (text) {  
          _password = text;  
        },
      ),
    );

    formWidget.add(
      CheckboxListTile(
        value: _termsChecked,
        onChanged: (value) {
          setState(() {
            _termsChecked = value.toString().toLowerCase() == 'true';
          });
        },
        subtitle: !_termsChecked
            ? Text(
                'Required',
                style: TextStyle(color: Colors.red, fontSize: 12.0),
              )
            : null,
        title: const Text(
          'I agree to the terms and condition',
        ),
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );

    Future<void> onPressedSubmit() async {
      // if (_formKey.currentState!.validate() && _termsChecked) {
      //   _formKey.currentState?.save();

      // Product product = new Product();

      // product.name = _name;
      // product.email = _email;
      // product.price = _age.toString();
      // product.quantity = _password;

      // (await ProductApiService().createProduct(product));
      // print("Delete Call!");

      print("Name " + _name);
      print("Email " + _email);
      print("Department Id " + _departmentId);
      switch (_selectDepartment) {
        case 0:
          print("Regular");
          break;
        case 1:
          print("Urgent");
          break;
        case 3:
          print("Emergency");
          break;
      }
      switch (_selectGender) {
        case 0:
          print("Gender Male");
          break;
        case 1:
          print("Gender Female");
          break;
        case 3:
          print("Gender Others");
          break;
      }
      print("Password " + _password);
      print("Termschecked " + _termsChecked.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Form Submitted')));


      PostModel pm = new PostModel();
      pm.name = _name;
      pm.email = _email;
      pm.departmentId = _departmentId;
      pm.department = _selectDepartment;
      pm.gender = _selectGender;
      pm.password = _password;
      if(widget.postmodel2 != null){
        pm.id = _id;
      }


print("--------Update----------");
print(pm.toString());
print(pm.toJson());

      
      (await UserService().createPost(pm));


      // final String url = 'http://192.168.20.38:8080/api/posts';
      // var reqBody = {
      //   "title" : _name,
      //   "body" : _email,
      // };

      // var response = await http.post(Uri.parse(url),
      //   headers: {"Content-Type": "application/json"},
      //   body: jsonEncode(reqBody)
      // );

      // var jsonResponse = jsonDecode(response.body);
      // if(jsonResponse['status']) {
      //   print('Data Submitted');
      // } else {
      //   print('Something went wrong');
      // }


      // Navigator.pushAndRemoveUntil<dynamic>(
      //   context,
      //   MaterialPageRoute<dynamic>(
      //     builder: (BuildContext context) => Home(),
      //   ),
      //   (route) => false,
      // );
      // }
    }

    formWidget.add(ElevatedButton(
      onPressed: () {
        onPressedSubmit();
        Navigator.pushNamedAndRemoveUntil(context, "/userList", (route) => false);
      }, 
      child: widget.postmodel2!=null? Text('Update'): Text('Sign Up'),
      ),
    );

    formWidget.add(ElevatedButton(
      child: const Text('Login'), onPressed: (){

        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);

      //   Navigator.pushAndRemoveUntil<dynamic>(context,
      //   MaterialPageRoute<dynamic>(
      //     builder: (BuildContext context) =>Home(),
      //   ),
      //       (route) =>false,
      // );
      }
    ),
    );

    return formWidget;
  }
}
