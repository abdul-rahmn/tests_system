// ignore_for_file: use_key_in_widget_constructors, unused_local_variable, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, avoid_unnecessary_containers, unnecessary_null_comparison, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Pages/Manager/ManagePage.dart';
import 'package:tests_system/Pages/Manager/Manage_Courses/Manage_Questions/ManageQuestionsCourse.dart';
import '../../../Classes/Course.dart';
import '../../../Classes/SMProvider.dart';

class ManageCourses extends StatelessWidget {
  int x = 0;
  var formKey = GlobalKey<FormState>();
  var cnc = TextEditingController();
  var cncu = TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context, listen: false).loadCourses();
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                return ManagePage();
              }));
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Manage Courses"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 141, 199, 194),
        foregroundColor: Colors.black,
        onPressed: () {
          cnc.text = "";
          showDialog(
              context: context,
              builder: (_) {
                return AlertDialog(
                  backgroundColor: Color.fromARGB(255, 44, 66, 65),
                  title: Text("Add New Course",
                      style: TextStyle(color: Colors.white)),
                  actions: [
                    Container(
                      child: Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFormField(
                              controller: cnc,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                labelText: "Course Name",
                                labelStyle: TextStyle(
                                  color: Colors.yellow,
                                ),
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
                                  return "Course Name required";
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
                                        Course.AddCourse(cnc.text);
                                        Provider.of<SMProvider>(context,
                                                listen: false)
                                            .loadCourses();
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
                                            .loadCourses();
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
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                Text(
                    "Number Of Courses: ${Provider.of<SMProvider>(context).lstCourses.length}",
                    style: TextStyle(
                        color: Colors.white,
                        //backgroundColor: Color.fromARGB(255, 233, 233, 233),
                        fontSize: 20)),
                SizedBox(height: 5),
                DataTable(
                  columns: [
                    // DataColumn(
                    //     label: Text(
                    //   "id",
                    //   style: TextStyle(
                    //     fontSize: 18,
                    //     color: Color.fromARGB(255, 62, 255, 245),
                    //   ),
                    // )),
                    DataColumn(
                        label: Text(
                      "Course Name",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "Questions",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "upd/del",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                  ],
                  rows: [
                    ...Provider.of<SMProvider>(context).lstCourses.map((c) {
                      return DataRow(cells: [
                        // DataCell(Text("${c.id}",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.white,
                        //     ))),
                        DataCell(Text("${c.courseName}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              Provider.of<SMProvider>(context, listen: false)
                                  .loadQuestions();
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (_) {
                                return ManageQuestionsCourse(c.id);
                              }));
                            },
                            // style: ElevatedButton.styleFrom(
                            //   primary: Color.fromARGB(255, 56, 107, 104),
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 50, vertical: 20),
                            // ),
                            child: Text(
                              "Questions",
                              style: TextStyle(
                                //fontSize: 20,
                                color: Color.fromARGB(255, 255, 231, 19),
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  cncu.text = c.courseName.toString();
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 44, 66, 65),
                                          title: Text("Update Course",
                                              style:
                                                  TextStyle(color: Colors.white)),
                                          actions: [
                                            Container(
                                              child: Form(
                                                key: formKey,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    TextFormField(
                                                      controller: cncu,
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                      decoration: InputDecoration(
                                                        labelText: "Course Name",
                                                        labelStyle: TextStyle(
                                                          color: Colors.yellow,
                                                        ),
                                                        prefixIcon: Icon(
                                                            Icons.auto_stories),
                                                        focusedBorder:
                                                            OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          borderSide: BorderSide(
                                                            color: Color.fromARGB(
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
                                                          borderSide: BorderSide(
                                                            color: Colors.yellow,
                                                            width: 1,
                                                          ),
                                                        ),
                                                      ),
                                                      validator: (value) {
                                                        if (value!.isEmpty ||
                                                            value == null) {
                                                          return "Course Name required";
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
                                                                Course
                                                                    .UpdateCourse(
                                                                        c.id,
                                                                        cncu.text);
                                                                Provider.of<SMProvider>(
                                                                        context,
                                                                        listen:
                                                                            false)
                                                                    .loadCourses();
                                                                showDialog(
                                                                    context:
                                                                        context,
                                                                    builder: (_) {
                                                                      return AlertDialog(
                                                                        backgroundColor:
                                                                            Color.fromARGB(
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
                                                                    .loadCourses();
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
                                  //   return UpdateCourse(c.id, c.courseName);
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
                                              style:
                                                  TextStyle(color: Colors.white)),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Course.removeCourse(c.id);
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeCourse(c);
                                                      //print("delete Student ID: ${s.id}");
                                                      Navigator.of(context).pop();
                                                    },
                                                    child: Text("Yes")),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context).pop();
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
