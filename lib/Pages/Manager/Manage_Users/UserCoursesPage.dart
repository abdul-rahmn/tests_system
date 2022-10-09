// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, file_names, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, no_logic_in_create_state, prefer_initializing_formals, unused_element, avoid_print, unused_local_variable, unused_import, sized_box_for_whitespace
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Classes/SMProvider.dart';
import '../../../Classes/UserCourses.dart';

class UserCoursesPage extends StatelessWidget {
  var userId;
  UserCoursesPage(this.userId);
  var i = 0;
  var lstCourse = [];
  @override
  Widget build(BuildContext context) {
    var lstWidg = [Container()];
    if (i == 0) {
      Provider.of<SMProvider>(context).loadCourses();
      i++;
    }
    lstCourse = Provider.of<SMProvider>(context, listen: false).lstCourses;
    List<Widget> lstCourses() {
      List<Widget> lstWidg = [];
      var lstuc = Provider.of<SMProvider>(context).lstUserCourses;
      for (var ii in lstCourse) {
        var flage = true;
        for (var i in lstuc) {
          if (ii.id == i.courseId && userId == i.userId) {
            flage = false;
            break;
          }
        }
        if (flage) {
          lstWidg.add(
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                    width: 2, color: Color.fromARGB(255, 245, 228, 77)),
              ),
              child: ElevatedButton(
                onPressed: () {
                  UserCourses.AddUserCourses(
                      userId.toString(), ii.id.toString());
                  Provider.of<SMProvider>(context, listen: false)
                      .loadUserCourses();
                  showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          backgroundColor: Color.fromARGB(255, 33, 47, 49),
                          title: Text("Adding in progress...",
                              style: TextStyle(color: Colors.white)),
                          actions: [],
                        );
                      });
                  Provider.of<SMProvider>(context, listen: false)
                      .loadUserCourses();
                  Future.delayed(Duration(seconds: 1), () {
                    Navigator.of(context).pop();
                  });
                  // Future.delayed(Duration(seconds: 1),
                  //     () {
                  //   Navigator.of(context).pop();
                  // });
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 35, 102, 91),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.corporate_fare_sharp, color: Colors.black),
                    SizedBox(width: 15),
                    Text(
                      "${ii.courseName}",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          );
          lstWidg.add(SizedBox(
            height: 30,
          ));
        }
      }

      if (lstWidg.isEmpty) {
        var lstWidg1 = [
          Container(
              width: double.infinity,
              child: Column(children: [
                Text("No New Courses have been added",
                    style: TextStyle(
                        color: Colors.white,
                        backgroundColor: Color.fromARGB(255, 95, 95, 95),
                        fontSize: 18,
                        fontWeight: FontWeight.bold))
              ]))
        ];
        return lstWidg1;
      }
      return lstWidg;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Courses',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        color: Color.fromARGB(255, 33, 47, 49),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 52, 105, 102),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  border: Border.all(
                      width: 0.5, color: Color.fromARGB(255, 245, 228, 77)),
                ),
                width: double.infinity,
                //color: Color.fromARGB(192, 69, 134, 160),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Welcome ${Provider.of<SMProvider>(context, listen: false).fullName}",
                        style: TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 168, 255, 221))),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(children: lstCourses()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
