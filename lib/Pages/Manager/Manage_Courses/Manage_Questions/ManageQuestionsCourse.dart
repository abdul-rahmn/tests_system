// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, unused_element, unused_local_variable, avoid_unnecessary_containers, avoid_print, depend_on_referenced_packages, must_be_immutable, sort_child_properties_last, prefer_typing_uninitialized_variables, unnecessary_this
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/Question.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Pages/Manager/Manage_Courses/ManageCourses.dart';
import 'AddQuestionCourse.dart';
import 'UpdateQuestionCourse.dart';

class ManageQuestionsCourse extends StatelessWidget {
  var courseId;
  ManageQuestionsCourse(this.courseId);
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context, listen: false).getStudentQuestions(this.courseId);
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return ManageCourses();
              }));
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Manage Questions"),
        centerTitle: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 141, 199, 194),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddQuestionCourse(this.courseId);
          }));
        },
        child: Icon(Icons.addchart_sharp),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(
                  "Number Of Questions: ${Provider.of<SMProvider>(context).lstStudentQustions.length}",
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
                          " Question",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 62, 255, 245),
                          ),
                        ),
                        numeric: true),
                    //DataColumn(label: Text("question",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("answer 1",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("answer 2",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("answer 3",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("answer 4",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("true Answer",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(
                        label: Text(
                      "course Id",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "show/upd/del",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                  ],
                  rows: [
                    ...Provider.of<SMProvider>(context).lstStudentQustions.map((q) {
                      return DataRow(cells: [
                        DataCell(Text("ََQuestion ID:${q.id}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        // DataCell(Text("${q.question}")),
                        // DataCell(Text("${q.answer1}")),
                        // DataCell(Text("${q.answer2}")),
                        // DataCell(Text("${q.answer3}")),
                        // DataCell(Text("${q.answer4}")),
                        // DataCell(Text("${q.trueAnswer}")),
                        DataCell(Text("${q.courseId}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return SingleChildScrollView(
                                          child: AlertDialog(
                                            backgroundColor: Color.fromARGB(255, 44, 66, 65),
                                            title: Text(
                                              "Data of Question",
                                              style: TextStyle(
                                                fontSize: 30,
                                                  color: Colors.white),
                                            ),
                                            actions: [
                                              Container(
                                                width: double.infinity,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      TextSpan(
                                                          text: "id: ",
                                                          style: TextStyle(
                                                              fontSize: 20,
                                                              color: Color.fromARGB(255, 240, 240, 240))),
                                                      TextSpan(
                                                          text: "${q.id}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color.fromARGB(255, 240, 240, 240),
                                                              fontSize: 20)),
                                                    ])),
                                                    SizedBox(height: 20),
                                                    Text("- ${q.question}",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20)),
                                                    SizedBox(height: 20),
                                                    Text(" A- ${q.answer1}",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20)),
                                                    SizedBox(height: 20),
                                                    Text(" B- ${q.answer2}",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20)),
                                                    SizedBox(height: 20),
                                                    Text(" C- ${q.answer3}",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20)),
                                                    SizedBox(height: 20),
                                                    Text(" D- ${q.answer4}",
                                                        style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20)),
                                                    SizedBox(height: 20),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      TextSpan(
                                                          text: "trueAnswer: ",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20,
                                                          )),
                                                      TextSpan(
                                                          text:
                                                              "${q.trueAnswer}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color.fromARGB(255, 240, 240, 240),
                                                              fontSize: 20)),
                                                    ])),
                                                    SizedBox(height: 20),
                                                    RichText(
                                                        text:
                                                            TextSpan(children: [
                                                      TextSpan(
                                                          text: "courseId: ",
                                                          style: TextStyle(
                                                            color: Color.fromARGB(255, 240, 240, 240),
                                                            fontSize: 20,
                                                          )),
                                                      TextSpan(
                                                          text: "${q.courseId}",
                                                          style: TextStyle(
                                                              color:
                                                                  Color.fromARGB(255, 240, 240, 240),
                                                              fontSize: 20)),
                                                    ])),
                                                    // Text("courseId: ${q.courseId}",
                                                    //     style: TextStyle(
                                                    //         fontSize: 20)),
                                                    SizedBox(height: 20),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("OK"),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Color.fromARGB(
                                                          255, 52, 97, 94),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.green),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return UpdateQuestionCourse(
                                        q.id,
                                        q.question,
                                        q.answer1,
                                        q.answer2,
                                        q.answer3,
                                        q.answer4,
                                        q.trueAnswer,
                                        q.courseId);
                                  }));
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
                                          title: Text("Are you sure to Delete",style:TextStyle(color: Colors.white)),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Question.removeQuestion(
                                                          q.id);
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeStudentQuestions(q);
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
