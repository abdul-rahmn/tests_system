// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable, prefer_typing_uninitialized_variables, no_logic_in_create_state, unnecessary_brace_in_string_interps, avoid_unnecessary_containers
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Classes/SMProvider.dart';

class ViewUserCourse extends StatelessWidget {
  var id;
  var userId;
  var courseId;
  var countTrue;
  var countFalse;
  var average;
  ViewUserCourse(this.id, this.userId, this.courseId, this.countTrue,
      this.countFalse, this.average);
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context).getNameUser(userId);
      Provider.of<SMProvider>(context).getNameCourse(courseId);
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(title: Text("View UserCourses"), centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID: ${id}",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("User ID: $userId", style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text(
                        "Full Name User: ${Provider.of<SMProvider>(context, listen: false).name}",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("Course ID: $courseId",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text(
                        "Course Name: ${Provider.of<SMProvider>(context, listen: false).courseName}",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("True Answers: $countTrue",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("False Answers: $countFalse",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    SizedBox(height: 20),
                    Text("Average: $average",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
