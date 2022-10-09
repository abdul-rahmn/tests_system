// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, unused_element, unused_local_variable, avoid_unnecessary_containers, avoid_print, depend_on_referenced_packages, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/UserAnswers.dart';
import 'package:tests_system/Pages/Manager/ManagePage.dart';
import 'AddUserAnswer.dart';
import 'UpdateUserAnswer.dart';

class ManageUserAnswers extends StatelessWidget {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context, listen: false).loadUserAnswer();
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
        title: Text("Manage UserAnswers"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 141, 199, 194),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddUserAnswer();
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
                  "Number Of Users Answers: ${Provider.of<SMProvider>(context).lstUserAnswers.length}",
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
                          "id",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 62, 255, 245),
                          ),
                        ),
                        numeric: true),
                    // DataColumn(label: Text("userAnswer",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(
                        label: Text(
                      "userId",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "questionId",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "stateAnswer",
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
                    ...Provider.of<SMProvider>(context)
                        .lstUserAnswers
                        .map((ua) {
                      return DataRow(cells: [
                        DataCell(Text("${ua.id}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        // DataCell(Text("${ua.userAnswer}")),
                        DataCell(Text("${ua.userId}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Text("${ua.questionId}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(Text("${ua.stateAnswer}",
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
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 44, 66, 65),
                                          title: Text(
                                            "Data of User Answer",
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
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "id: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text: "${ua.id}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "User Answer: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text:
                                                            "${ua.userAnswer}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "user ID: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text: "${ua.userId}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Question ID: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text:
                                                            "${ua.questionId}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "State Answer: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text:
                                                            "${ua.stateAnswer}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                  ])),
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
                                                    child: Text("OK")),
                                              ],
                                            )
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.green),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return UpdateUserAnswer(
                                        ua.id,
                                        ua.userAnswer,
                                        ua.userId,
                                        ua.questionId,
                                        ua.courseId,
                                        ua.stateAnswer);
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
                                                      UserAnswer
                                                          .removeUserAnswer(
                                                              ua.id);
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeUserAnswer(ua);
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
