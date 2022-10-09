// ignore_for_file: file_names, prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unnecessary_null_comparison, body_might_complete_normally_nullable, sized_box_for_whitespace, unused_element, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks, avoid_print, use_key_in_widget_constructors, unused_import, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:http/http.dart' as http;

import 'LogInPage.dart';

class CreateAccount extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fnc = TextEditingController();
  var unc = TextEditingController();
  var pwc = TextEditingController();
  _AddStudent() async {
    var fn = fnc.text;
    var un = unc.text;
    var pw1 = pwc.text;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addUser",
          {"fn": fn, "un": un, "pw": pw1, "crId": "0", "st": "user"}),
    );
    print(request.body.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 50, 78, 77),
      appBar: AppBar(
        title: Text(
          'New Account',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                color: Color.fromARGB(255, 78, 158, 153),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Create a New Account",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: fnc,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 231, 146),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 1,
                            ),
                          ),
                          labelText: "Full Name",
                          labelStyle: TextStyle(
                            color: Colors.yellow,
                          ),
                          suffixIcon:
                              Icon(Icons.supervised_user_circle_outlined),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null || value == "") {
                            return "Full Name required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: unc,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 231, 146),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 1,
                            ),
                          ),
                          labelText: "User Name",
                          labelStyle: TextStyle(
                            color: Colors.yellow,
                          ),
                          suffixIcon: Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null || value == "") {
                            return "User Name required";
                          } else {
                            var state = RegExp(
                                    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$")
                                .hasMatch(value.toString());
                            if (!state) {
                              return "Password must be at least 5 characters, at least one letter and one number";
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: pwc,
                        obscureText:
                            Provider.of<SMProvider>(context).stateShowCreate,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 231, 146),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 1,
                            ),
                          ),
                            labelText: "Password",
                          labelStyle: TextStyle(
                            color: Colors.yellow,
                          ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .changStateshowCreate();
                              },
                            )),
                        validator: (value) {
                          if (value!.isEmpty || value == null || value == "") {
                            return "Password required";
                          } else {
                            var state = RegExp(
                                    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                                .hasMatch(value.toString());
                            if (!state) {
                              return "Password must be Minimum 8 characters, at least one letter and one number";
                            }
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText:
                            Provider.of<SMProvider>(context).stateShowCreate,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 231, 146),
                              width: 1,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 1,
                            ),
                          ),
                            labelText: "Confirm password",
                          labelStyle: TextStyle(
                            color: Colors.yellow,
                          ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye),
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .changStateshowCreate();
                              },
                            ) //internal in right fied
                            ),
                        validator: (value) {
                          if (pwc.text != value) {
                            return "Password does not match";
                          }
                          if (value!.isEmpty || value == null || value == "") {
                            return "Confirm Password required";
                          } else {
                            var state = RegExp(
                                    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                                .hasMatch(value.toString());
                            if (!state) {
                              return "Password must be Minimum 8 characters, at least one letter and one number";
                            }
                          }
                        },
                      ),
                      SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          //Navigator.of(context).pop();
                          if (formKey.currentState!.validate()) {
                            _AddStudent();
                            // Provider.of<SMProvider>(context, listen: false)
                            //     .loadUsers();                                
                                showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          title: Text("comlete create your account"),
                                          actions: [
                                          ],
                                        );
                                      });
                                      
                            Future.delayed(Duration(seconds: 1), () {
                              Provider.of<SMProvider>(context, listen: false)
                                .loadUsers(); 
                              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                                return LogInPage();
                              }));
                            });
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.library_add_check_sharp),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Create Account")
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
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
