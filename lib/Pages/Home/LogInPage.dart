// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, use_key_in_widget_constructors, file_names, body_might_complete_normally_nullable, unnecessary_null_comparison, avoid_print, unused_import, unused_element, unnecessary_new, must_be_immutable
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/User.dart';
import '../Manager/ManagePage.dart';
import '../Student/studentCourses.dart';
import 'CreateAccount.dart';

class LogInPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var un = TextEditingController();
  var pw = TextEditingController();

  check(un, pw, lst) {
    User output = new User();
    for (var i in lst) {
      if (i.userName == un && i.password == pw) {
        output = i;
        break;
      }
    }
    return output;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 47, 49),
      // appBar: AppBar(
      //   leading: Text(""),
      //   title: Text(
      //     'System Tests',
      //     style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold),
      //   ),
      //   centerTitle: true,
      //   foregroundColor: Color.fromRGBO(0, 0, 0, 1),
      //   iconTheme: IconThemeData(color: Colors.yellow),
      // ),
      body: Container(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 20),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 90),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 52, 105, 102),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      width: 2, color: Color.fromARGB(255, 245, 228, 77)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log In",
                        style: TextStyle(
                            fontSize: 30,color: Colors.white)),
                  ],
                ),
              ),
              Icon(Icons.school,
                  size: 170, color: Color.fromARGB(255, 233, 215, 54)),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: un,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 143, 231, 146),
                              width: 2,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: BorderSide(
                              color: Colors.yellow,
                              width: 2,
                            ),
                          ),
                          labelText: "userName",
                          labelStyle: TextStyle(
                            color: Colors.yellow,
                          ),
                          suffixIcon: Icon(Icons.person, color: Colors.yellow),
                        ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "userName required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: pw,
                        obscureText:
                            Provider.of<SMProvider>(context).stateShowLogin,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 143, 231, 146),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Colors.yellow,
                                width: 2,
                              ),
                            ),
                            labelText: "Password",
                            labelStyle: TextStyle(
                              color: Colors.yellow,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(Icons.remove_red_eye,
                                  color: Colors.yellow),
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .changStateshowLogin();
                              },
                            ) //internal in right fied
                            ),
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Password required";
                          }
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        // style: ElevatedButton.styleFrom(
                        //   primary: Color.fromARGB(255, 52, 97, 94),
                        // ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            var user = check(
                                un.text,
                                pw.text,
                                Provider.of<SMProvider>(context, listen: false)
                                    .lstUsers);
                            if (user.state == "admin") {
                              Provider.of<SMProvider>(context, listen: false)
                                  .changeUser(user.id, user.fullName,
                                      user.userName, user.password, user.state);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ManagePage(
                                    id: user.id,
                                    fullName: user.fullName,
                                    userName: user.userName,
                                    password: user.password,
                                    state: user.state);
                              }));
                            } else if (user.state == "user") {
                              Provider.of<SMProvider>(context, listen: false)
                                  .changeUser(user.id, user.fullName,
                                      user.userName, user.password, user.state);
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return StudentCourses();
                              }));
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (_) {
                                    return AlertDialog(
                                      backgroundColor:
                                          Color.fromARGB(255, 68, 105, 104),
                                      title: Text("This account does not exist",
                                          style:
                                              TextStyle(color: Colors.white)),
                                      actions: [
                                        Center(
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("OK")),
                                        ),
                                      ],
                                    );
                                  });
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 52, 105, 102),
                        ),
                        child: Container(
                          width: 100,
                          height: 40,
                          child: Row(
                            children: [
                              Icon(Icons.login),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Log In",
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return CreateAccount();
                          }));
                        },
                        child: Text(
                          "Create new Account",
                          style: TextStyle(fontSize: 15, color: Colors.blue),
                        ),
                      ),
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
