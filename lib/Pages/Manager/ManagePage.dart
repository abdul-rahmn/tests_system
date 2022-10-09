// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, must_be_immutable, prefer_initializing_formals, no_logic_in_create_state, unnecessary_this, sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Pages/Manager/Manage_UserCourses/ManageUserCourses.dart';
import '../../Classes/SMProvider.dart';
import '../Home/LogInPage.dart';
import 'Manage_Courses/ManageCourses.dart';
import 'Manage_UserAnswers/ManageUserAnswers.dart';
import 'Manage_Users/ManageUsers.dart';

class ManagePage extends StatelessWidget {
  var id;
  var fullName;
  var userName;
  var password;
  var state;
  var courseId;
  ManagePage({id, fullName, userName, password, state, courseId}) {
    this.id = id;
    this.fullName = fullName;
    this.userName = userName;
    this.password = password;
    this.state = state;
    this.courseId = courseId;
  }

  var un = TextEditingController();
  var pw = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(""),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Logout", style: TextStyle(fontSize: 16)),
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
          'Admin',
          style: TextStyle(
            fontSize: 30,
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        //elevation: 10,
        //shadowColor: Colors.green,
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.yellow),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
        color: Color.fromARGB(255, 33, 47, 49),
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40),
              Container(
                height: 60,
                width: double.infinity,
                color: Color.fromARGB(255, 196, 181, 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.manage_accounts_outlined,
                        size: 35, color: Color.fromARGB(255, 0, 0, 0)),
                    SizedBox(width: 10),
                    Text("Welcome To Administration Page",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color.fromARGB(255, 0, 0, 0),
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(5,5,5,130),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 199, 185, 58)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 199, 185, 58)),
                            ),
                            height: 125,
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .loadCourses();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return ManageCourses();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 56, 107, 104),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //Container(height: 40,width: 50,child: Image.asset("images/tt.webp"),),
                                  Icon(Icons.auto_stories,
                                      color: Colors.black, size: 45),
                                  Text(
                                    "Courses",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 255, 231, 19),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 125,
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 199, 185, 58))),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .loadUsers();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return ManageUsers();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 56, 107, 104),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.groups_rounded,
                                      color: Color.fromARGB(255, 191, 228, 105),
                                      size: 45),
                                  Text(
                                    "Users",
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color.fromARGB(255, 255, 231, 19),
                                      //fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         border: Border.all(
                        //           width: 1.5,
                        //           color: Color.fromARGB(255, 199, 185, 58))),
                        //     height: 125,
                        //     child: ElevatedButton(
                        //       onPressed: () {
                        //         Provider.of<SMProvider>(context, listen: false)
                        //             .loadQuestions();
                        //         Navigator.of(context)
                        //             .push(MaterialPageRoute(builder: (_) {
                        //           return ManageQuestions();
                        //         }));
                        //       },
                        //       style: ElevatedButton.styleFrom(
                        //         primary: Color.fromARGB(255, 56, 107, 104),
                        //         padding: EdgeInsets.symmetric(
                        //             horizontal: 50, vertical: 20),
                        //       ),
                        //       child: Column(
                        //         mainAxisAlignment: MainAxisAlignment.center,
                        //         children: [
                        //           Icon(Icons.quiz_outlined,
                        //               color: Color.fromARGB(255, 205, 219, 219),
                        //               size: 45),
                        //           Text(
                        //             "Questions",
                        //             style: TextStyle(
                        //               fontSize: 20,
                        //               color: Color.fromARGB(255, 255, 231, 19),
                        //             ),
                        //           )
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 199, 185, 58))),
                            height: 125,
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<SMProvider>(context, listen: false)
                                    .loadUserAnswer();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return ManageUserAnswers();
                                }));
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Color.fromARGB(255, 56, 107, 104),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 20),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.close,
                                          color: Colors.red, size: 40),
                                      Icon(Icons.done,
                                          color: Colors.green, size: 43)
                                    ],
                                  ),
                                  Text(
                                    "Users",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 255, 231, 19),
                                      //fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "Answers",
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Color.fromARGB(255, 255, 231, 19),
                                      //fontWeight: FontWeight.bold
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                            child: Container(
                          width: double.infinity,
                          height: 125,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1.5,
                                  color: Color.fromARGB(255, 199, 185, 58)),),
                          child: ElevatedButton(
                            onPressed: () {
                              Provider.of<SMProvider>(context, listen: false)
                                  .loadUserCourses();
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ManageUserCourses();
                              }));
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 56, 107, 104),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.list_alt_outlined,
                                    color: Colors.black, size: 45),
                                Text(
                                  "Users",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 231, 19),
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "Courses",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 255, 231, 19),
                                    //fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                      ],
                    ),
                    // SizedBox(height: 20),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Expanded(child: Container(), flex: 1),
                    //     Expanded(
                    //       flex: 2,
                    //       child: Container(
                    //         width: double.infinity,
                    //         height: 125,
                    //         decoration: BoxDecoration(
                    //             border: Border.all(
                    //               width: 1.5,
                    //               color: Color.fromARGB(255, 199, 185, 58))),
                    //         child: ElevatedButton(
                    //           onPressed: () {
                    //             Provider.of<SMProvider>(context, listen: false)
                    //                 .loadUsers();
                    //             Navigator.of(context)
                    //                 .push(MaterialPageRoute(builder: (_) {
                    //               return ManageUsers();
                    //             }));
                    //           },
                    //           style: ElevatedButton.styleFrom(
                    //             primary: Color.fromARGB(255, 56, 107, 104),
                    //             padding: EdgeInsets.symmetric(
                    //                 horizontal: 50, vertical: 20),
                    //           ),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               Icon(Icons.groups_rounded,
                    //                   color: Color.fromARGB(255, 191, 228, 105),
                    //                   size: 45),
                    //               Text(
                    //                 "Users",
                    //                 style: TextStyle(
                    //                   fontSize: 20,
                    //                   color: Color.fromARGB(255, 255, 231, 19),
                    //                   //fontWeight: FontWeight.bold
                    //                 ),
                    //               )
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(child: Container(), flex: 1),
                    //   ],
                    // ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
