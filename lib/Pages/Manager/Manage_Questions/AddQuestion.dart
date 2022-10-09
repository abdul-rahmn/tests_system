// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable, unused_element, depend_on_referenced_packages, unnecessary_string_interpolations, avoid_print, body_might_complete_normally_nullable, unnecessary_null_comparison, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/Question.dart';
import '../../../Classes/SMProvider.dart';
import 'ManageQuestions.dart';

class AddQuestion extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var qnc = TextEditingController();
  var ans1c = TextEditingController();
  var ans2c = TextEditingController();
  var ans3c = TextEditingController();
  var ans4c = TextEditingController();
  var tac = TextEditingController();
  var cidc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.logout)),
          title: Text(
            "Add A New Question",
            style: TextStyle(fontSize: 25),
          ),
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
                  controller: qnc,
                  decoration: InputDecoration(
                    labelText: "Question",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "Question required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: ans1c,
                  decoration: InputDecoration(
                    labelText: "Answer 1",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "Answer 1 required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: ans2c,
                  decoration: InputDecoration(
                    labelText: "Answer 2",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "Answer 2 required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: ans3c,
                  decoration: InputDecoration(
                    labelText: "Answer 3",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "Answer 3 required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: ans4c,
                  decoration: InputDecoration(
                    labelText: "Answer 4",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "Answer 4 required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: tac,
                  decoration: InputDecoration(
                    labelText: "True Answer",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "True Answer required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: cidc,
                  decoration: InputDecoration(
                    labelText: "CourseId",
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    prefixIcon: Icon(Icons.quiz_outlined),
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
                    if (value!.isEmpty || value == null) {
                      return "CourseId required";
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
                            Question.AddQuestion(
                                qnc.text,
                                ans1c.text,
                                ans2c.text,
                                ans3c.text,
                                ans4c.text,
                                tac.text,
                                cidc.text);
                            Provider.of<SMProvider>(context, listen: false)
                                .loadQuestions();
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
                                  .loadQuestions();
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) {
                                return ManageQuestions();
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
