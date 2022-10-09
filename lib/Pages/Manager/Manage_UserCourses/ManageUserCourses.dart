// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unnecessary_string_interpolations, sized_box_for_whitespace, unnecessary_null_comparison, body_might_complete_normally_nullable, avoid_print
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/UserCourses.dart';
import 'package:tests_system/Pages/Manager/ManagePage.dart';

import 'ViewUserCourse.dart';

class ManageUserCourses extends StatelessWidget {
  int x = 0;
  int y = 0;
  var formKey = GlobalKey<FormState>();
  var userIdc = TextEditingController();
  var courseIdc = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context, listen: false).loadUserCourses();
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return ManagePage();
              }));
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Manage UserCourses"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 141, 199, 194),
        foregroundColor: Colors.black,
        onPressed: () {
          userIdc.text = "";
          courseIdc.text = "";
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 44, 66, 65),
                  title: Text("Add New User Course",
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: userIdc,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "User ID",
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
                                if (value!.isEmpty || value == null) {
                                  return "User ID required";
                                }
                              },
                            ),
                            SizedBox(height: 15),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              controller: courseIdc,
                              decoration: InputDecoration(
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
                                labelText: "Course ID",
                                prefixIcon: Icon(Icons.auto_stories),
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
                                  return "Course ID required";
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
                                        UserCourses.AddUserCourses(
                                            userIdc.text, courseIdc.text);
                                        Provider.of<SMProvider>(context,
                                                listen: false)
                                            .loadUserCourses();
                                        showDialog(
                                            context: context,
                                            builder: (_) {
                                              return AlertDialog(
                                                backgroundColor: Color.fromARGB(
                                                    255, 33, 47, 49),
                                                title: Text(
                                                    "Adding in progress...",
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                actions: [],
                                              );
                                            });
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.of(context).pop();
                                        });
                                        Provider.of<SMProvider>(context,
                                                listen: false)
                                            .loadUserCourses();
                                        Future.delayed(Duration(seconds: 1),
                                            () {
                                          Navigator.of(context).pop();
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
                  ],
                );
              });

          // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
          //   return AddUserCourse();
          // }));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(
                  "Number Of Users Courses: ${Provider.of<SMProvider>(context).lstUserCourses.length}",
                  style: TextStyle(
                      color: Colors.white,
                      //backgroundColor: Color.fromARGB(255, 233, 233, 233),
                      fontSize: 20)),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(
                        label: Text(
                      "ID",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "Student ID",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 62, 255, 245)),
                    )),
                    DataColumn(
                        label: Text(
                      "Course ID",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 62, 255, 245)),
                    )),
                    DataColumn(
                        label: Text(
                      "Average",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 62, 255, 245)),
                    )),
                    DataColumn(
                        label: Text(
                      "show/upd/del",
                      style: TextStyle(
                          fontSize: 19,
                          color: Color.fromARGB(255, 62, 255, 245)),
                    )),
                  ],
                  rows: [
                    ...Provider.of<SMProvider>(context)
                        .lstUserCourses
                        .map((uc) {
                      // if (y == 0) {
                      //   Provider.of<SMProvider>(context, listen: false).getNameUser(uc.userId);
                      //   Provider.of<SMProvider>(context, listen: false).getNameCourse(uc.courseId);
                      //   print(uc.userId);
                      //   print(uc.courseId);
                      //   y++;
                      // }
                      return DataRow(cells: [
                        DataCell(Text("${uc.id}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Text("${uc.userId}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Text("${uc.courseId}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Text("${uc.average}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  // showDialog(
                                  //     context: context,
                                  //     builder: (_) {
                                  //       return AlertDialog(
                                  //         backgroundColor:
                                  //             Color.fromARGB(255, 44, 66, 65),
                                  //         title: Text(
                                  //           "Data of User Courses",
                                  //           style: TextStyle(
                                  //               fontSize: 30,
                                  //               color: Colors.white),
                                  //         ),
                                  //         actions: [
                                  //           Container(
                                  //             width: double.infinity,
                                  //             child: Column(
                                  //               crossAxisAlignment:
                                  //                   CrossAxisAlignment.start,
                                  //               children: [
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "ID: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text: "${uc.id}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "User ID: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text: "${uc.userId}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text:
                                  //                           "Full Name User: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text:
                                  //                           "${Provider.of<SMProvider>(context).name}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "Course ID: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text: "${uc.courseId}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "Course Name: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text:
                                  //                           "${Provider.of<SMProvider>(context).courseName}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "True Answers: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text: "${uc.countTrue}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "False Answers: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text:
                                  //                           "${uc.countFalse}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //                 RichText(
                                  //                     text: TextSpan(children: [
                                  //                   TextSpan(
                                  //                       text: "Average: ",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                   TextSpan(
                                  //                       text: "${uc.average}",
                                  //                       style: TextStyle(
                                  //                           color:
                                  //                               Color.fromARGB(
                                  //                                   255,
                                  //                                   240,
                                  //                                   240,
                                  //                                   240),
                                  //                           fontSize: 20)),
                                  //                 ])),
                                  //                 SizedBox(height: 20),
                                  //               ],
                                  //             ),
                                  //           ),
                                  //           SizedBox(height: 10),
                                  //           Row(
                                  //             mainAxisAlignment:
                                  //                 MainAxisAlignment.end,
                                  //             children: [
                                  //               ElevatedButton(
                                  //                   onPressed: () {
                                  //                     Navigator.of(context)
                                  //                         .pop();
                                  //                   },
                                  //                   child: Text("OK")),
                                  //             ],
                                  //           )
                                  //         ],
                                  //       );
                                  //     });

                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return ViewUserCourse(
                                        uc.id, uc.userId, uc.courseId,uc.countTrue,uc.countFalse,uc.average);
                                  }));
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.green),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 44, 66, 65),
                                          title: Text("Add New User Course",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  20, 10, 20, 20),
                                              child: Form(
                                                key: formKey,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      controller: userIdc,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle: TextStyle(
                                                          color: Colors.yellow,
                                                        ),
                                                        labelText: "User ID",
                                                        prefixIcon:
                                                            Icon(Icons.person),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    143,
                                                                    231,
                                                                    146),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Colors.yellow,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value!.isEmpty ||
                                                            value == null) {
                                                          return "User ID required";
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(height: 15),
                                                    TextFormField(
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      controller: courseIdc,
                                                      decoration:
                                                          InputDecoration(
                                                        labelStyle: TextStyle(
                                                          color: Colors.yellow,
                                                        ),
                                                        labelText: "Course ID",
                                                        prefixIcon: Icon(
                                                            Icons.auto_stories),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    143,
                                                                    231,
                                                                    146),
                                                            width: 1,
                                                          ),
                                                        ),
                                                        enabledBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide:
                                                              BorderSide(
                                                            color:
                                                                Colors.yellow,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value!.isEmpty ||
                                                            value == null) {
                                                          return "Course ID required";
                                                        }
                                                      },
                                                    ),
                                                    SizedBox(height: 15),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        ElevatedButton(
                                                            onPressed: () {
                                                              if (formKey
                                                                  .currentState!
                                                                  .validate()) {
                                                                UserCourses
                                                                    .UpdateUserCourses(
                                                                        uc.id,
                                                                        userIdc
                                                                            .text,
                                                                        courseIdc
                                                                            .text);
                                                                Provider.of<SMProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .loadUserCourses();
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (_) {
                                                                      return AlertDialog(
                                                                        backgroundColor: Color.fromARGB(
                                                                            255,
                                                                            33,
                                                                            47,
                                                                            49),
                                                                        title: Text(
                                                                            "update in progress...",
                                                                            style:
                                                                                TextStyle(color: Colors.white)),
                                                                        actions: [],
                                                                      );
                                                                    });
                                                                Future.delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                                Provider.of<SMProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .loadUserCourses();
                                                                Future.delayed(
                                                                    Duration(
                                                                        seconds:
                                                                            1),
                                                                    () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .pop();
                                                                });
                                                              }
                                                            },
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.add),
                                                                Text("Update")
                                                              ],
                                                            )),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      });
                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (_) {
                                  //   return UpdateUserCourses(
                                  //       uc.id, uc.userId, uc.courseId);
                                  // }));
                                },
                                icon: Icon(Icons.edit),
                                color: Color.fromARGB(255, 218, 200, 39)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 33, 47, 49),
                                          title: Text("Are you sure to Delete",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      UserCourses
                                                          .removeUserCourses(uc
                                                              .id); //Course.removeCourse(uc.id);
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeUserCourses(
                                                              uc);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Yes")),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("No")),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.delete),
                                color: Colors.red)
                          ],
                        )),
                      ]);
                    })
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
