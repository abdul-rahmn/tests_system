// ignore_for_file: prefer_const_constructors, unnecessary_import, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unused_element, avoid_print, no_logic_in_create_state, non_constant_identifier_names, unused_local_variable, unnecessary_brace_in_string_interps, unnecessary_null_comparison, body_might_complete_normally_nullable, prefer_initializing_formals
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/Question.dart';

import '../../../Classes/SMProvider.dart';
import 'ManageQuestions.dart';

class UpdateQuestion extends StatelessWidget {
  var id;
  UpdateQuestion(
      id, question, answer1, answer2, answer3, answer4, trueAnswer, courseId) {
    this.id = id;
    qnc.text = question;
    ans1c.text = answer1;
    ans2c.text = answer2;
    ans3c.text = answer3;
    ans4c.text = answer4;
    tac.text = trueAnswer;
    cidc.text = courseId.toString();
  }
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
        title: Text("Update Question", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
                            Question.UpdateQuestion(
                                id,
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
                                    title: Text("Update in progress...",
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
                          children: [Icon(Icons.add), Text("Update")],
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
