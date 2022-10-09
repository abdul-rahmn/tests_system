// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, unused_element, unused_local_variable, avoid_unnecessary_containers, avoid_print, depend_on_referenced_packages, must_be_immutable, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';

class ViewResult extends StatelessWidget {
  var courseId;
  ViewResult(this.courseId);
  int x = 0;
  var avg;
  var countT;
  var countF;
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      var userId = Provider.of<SMProvider>(context, listen: false).id;
      Provider.of<SMProvider>(context, listen: false)
          .loadResulData(userId, courseId);
      Provider.of<SMProvider>(context, listen: false)
          .getuserCourse(userId, courseId)
          .then((value) {
        for (var i
            in Provider.of<SMProvider>(context, listen: false).userCourse) {
          avg = i.average;
          countT = i.countTrue;
          countF = i.countFalse;
          break;
        }
      });
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 40, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text(
          "Result",
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "True",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " Answers: ${countT}",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ])),
                  SizedBox(height: 5),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "False",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    TextSpan(
                        text: " Answers: ${countF}",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ])),
                  SizedBox(height: 5),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Your",
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                    TextSpan(
                        text: " Average: ${avg} / 100",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 226, 209, 51))),
                  ])),
                ],
              ),
              SizedBox(height: 5),
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      " Question",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    ),
                  ),
                  DataColumn(label: Text("    ")),
                  DataColumn(
                      label: Text(
                    "True/False",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(255, 62, 255, 245),
                    ),
                  )),
                ],
                rows: [
                  ...Provider.of<SMProvider>(context).lstResuData.map((rd) {
                    dynamic colorState;
                    dynamic iconState;
                    counter++;
                    if (rd.stateAnswer == "false") {
                      colorState = Colors.red;
                      iconState = Icons.sentiment_dissatisfied;
                    } else {
                      colorState = Color.fromARGB(255, 88, 226, 92);
                      iconState = Icons.sentiment_satisfied_sharp;
                    }
                    return DataRow(cells: [
                      DataCell(ElevatedButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (_) {
                                  return AlertDialog(
                                    backgroundColor:
                                        Color.fromARGB(255, 40, 66, 65),
                                    title: Text(
                                      "Data of Question",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    actions: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: "Questuin ID: ",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "${rd.id}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ]))),
                                          SizedBox(height: 10),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: "Question: ",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "${rd.question}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ]))),
                                          SizedBox(height: 10),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: "Your Answer: ",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "${rd.userAnswer}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ]))),
                                          SizedBox(height: 10),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: "True Answer: ",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "${rd.trueAnswer}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ]))),
                                          SizedBox(height: 10),
                                          Container(
                                              child: RichText(
                                                  text: TextSpan(children: [
                                            TextSpan(
                                                text: "State Answer: ",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                            TextSpan(
                                                text: "${rd.stateAnswer}",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white)),
                                          ]))),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("OK")),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  );
                                });
                          },
                          child: Text("ََQuestion $counter"))),
                      DataCell(Text("")),
                      DataCell(Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${rd.stateAnswer}",
                            style: TextStyle(
                                color: colorState, fontWeight: FontWeight.bold),
                          ),
                          Icon(iconState, color: colorState),
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
    );
  }
}
