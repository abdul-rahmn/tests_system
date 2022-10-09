// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable, unused_element, depend_on_referenced_packages, unnecessary_string_interpolations, avoid_print, body_might_complete_normally_nullable, unnecessary_null_comparison, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/UserAnswers.dart';

import 'ManageUserAnswers.dart';

class AddUserAnswer extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var uac = TextEditingController();
  var uidc = TextEditingController();
  var qidc = TextEditingController();
  var cidc = TextEditingController();
  var stac = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return ManageUserAnswers();
                }));
              },
              icon: Icon(Icons.logout)),
          title: Text("Add A New UserAnswer", style: TextStyle(fontSize: 25)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: uac,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    labelText: "userAnswer",
                    prefixIcon: Icon(Icons.person),
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value == null ||
                        value == "" ||
                        value == "") {
                      return "userAnswer required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: uidc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    labelText: "userId",
                    prefixIcon: Icon(Icons.person),
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "userId required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: qidc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    labelText: "questionId",
                    prefixIcon: Icon(Icons.person),
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "questionId required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: cidc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    labelText: "courseId",
                    prefixIcon: Icon(Icons.person),
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "courseId required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: stac,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    labelText: "stateAnswer",
                    prefixIcon: Icon(Icons.person),
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
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "stateAnswer required";
                    }
                  },
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            UserAnswer.AddUserAnswer(uac.text, uidc.text,
                                qidc.text, cidc.text, stac.text);
                            Provider.of<SMProvider>(context, listen: false)
                                .loadUserAnswer();
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(255, 33, 47, 49),
                                    title: Text("Adding in progress...",
                                        style: TextStyle(color: Colors.white)),
                                    actions: [],
                                  );
                                });
                            Future.delayed(Duration(seconds: 1), () {
                              Provider.of<SMProvider>(context, listen: false)
                                  .loadUserAnswer();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) {
                                return ManageUserAnswers();
                              }));
                            });
                          }
                        },
                        child: Row(
                          children: [Icon(Icons.add), Text("Add")],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
