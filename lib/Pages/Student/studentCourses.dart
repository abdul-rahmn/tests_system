// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, file_names, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, no_logic_in_create_state, prefer_initializing_formals, unused_element, avoid_print, unused_local_variable, unused_import, sized_box_for_whitespace, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Pages/Student/ViewResult.dart';
import '../Home/LogInPage.dart';
import 'QuestionsPage.dart';

class StudentCourses extends StatelessWidget {
  var i = 0;
  var lstUserCoursesById = [];
  @override
  Widget build(BuildContext context) {
    var lstWidg = [Container()];
    if (i == 0) {
      Provider.of<SMProvider>(context).loadUserCoursesById();
      i++;
    }
    lstUserCoursesById =
        Provider.of<SMProvider>(context, listen: false).lstUserCoursesById;
    List<Widget> studentCourses() {
      List<Widget> lstWidg = [];
      for (var i in lstUserCoursesById) {
        lstWidg.add(
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(
                  width: 2, color: Color.fromARGB(255, 245, 228, 77)),
            ),
            child: ElevatedButton(
              onPressed: () {
                Provider.of<SMProvider>(context, listen: false).clearAnswers();
                Provider.of<SMProvider>(context, listen: false)
                    .checkCompleteCourse(i.id)
                    .then((value) {
                  if (value == "false") {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return QuestionsPage(i.id);
                    }));
                  } else {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                      return ViewResult(i.id);
                    }));
                  }
                });
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
                    "${i.courseName}",
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
      if (lstWidg.isEmpty) {
        var lstWidg1 = [
          Container(
              width: double.infinity,
              child: Column(children: [
                Text(
                    "No Courses have been added in your account,the manager must add you",
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
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 33, 47, 49),
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                    child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 80, 100, 95),
                  radius: 300,
                  child: Container(
                    height: 50,
                    child: Text(
                      "${Provider.of<SMProvider>(context).fullName[0].toUpperCase()}${Provider.of<SMProvider>(context).fullName[1]}",
                      style: TextStyle(color: Colors.yellow, fontSize: 52),
                    ),
                  ),
                )),
                DrawerHeader(
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.settings,
                                color: Colors.white),
                            SizedBox(width: 20),
                            Text("Settings",
                                style: TextStyle(color: Colors.white)),
                            // SizedBox(width: 60),
                            // Container(
                            //   padding: const EdgeInsets.all(2.0),
                            //   decoration: BoxDecoration(
                            //     color: Colors.blue,
                            //     //border: Border.all(width: 5, color: Colors.red),
                            //     borderRadius:
                            //         BorderRadius.all(Radius.circular(50)),
                            //   ),
                            //   child: const Text(
                            //     "5 new",
                            //     style: TextStyle(
                            //         fontSize: 15.0, color: Colors.white),
                            //   ),
                            // )
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.message_outlined, color: Colors.white),
                            SizedBox(width: 20),
                            Text("Message us", style: TextStyle(color: Colors.white))
                          ],
                        ),
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.app_shortcut_outlined, color: Colors.white),
                            SizedBox(width: 20),
                            Text("Apps",
                                style: TextStyle(color: Colors.white))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.help_outline_outlined, color: Colors.white),
                          SizedBox(width: 20),
                          Text("help",
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.error_outline, color: Colors.white),
                          SizedBox(width: 20),
                          Text("About us", style: TextStyle(color: Colors.white))
                        ],
                      ),
                      SizedBox(height: 150),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("V  0.0.1", style: TextStyle(color: Colors.white))
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logout"),
            ],
          ),
          IconButton(
              onPressed: () {
                Provider.of<SMProvider>(context, listen: false)
                    .changeUser(0, "", "", "", "");
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (_) {
                  return LogInPage();
                }));
              },
              icon: Icon(Icons.logout_sharp)),
        ],
        title: Text(
          'Student Page',
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
                  child: Column(children: studentCourses()),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
