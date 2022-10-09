// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, prefer_initializing_formals, no_logic_in_create_state, unnecessary_brace_in_string_interps, prefer_const_constructors, avoid_print, unused_local_variable, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, prefer_is_empty
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/UserAnswers.dart';
import 'package:timer_count_down/timer_count_down.dart';

class QuestionsPage extends StatelessWidget {
  var courseId;
  QuestionsPage(courseId) {
    this.courseId = courseId;
  }
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x==0) {
      print(Provider.of<SMProvider>(context,listen: false).lstuseransw.length);
      //Provider.of<SMProvider>(context,listen: false).clearAnswers();
      x++;
    }
    //Provider.of<SMProvider>(context,listen: false).getStudentQuestions(courseId);
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 39, 58, 57),
        appBar: AppBar(
          leading: Text(""),
          title: Text(
            'Good Luck ${Provider.of<SMProvider>(context, listen: false).fullName}',
            style: TextStyle(
              color: Colors.yellow,
            ),
          ),
          centerTitle: true,
          foregroundColor: Colors.black,
          iconTheme: IconThemeData(color: Colors.yellow),
        ),
        body: Countdown(
          seconds: (10 * 60) - 1,
          interval: Duration(milliseconds: 1000),
          onFinished: () {
            print('Timer is done!');
            var lstQues = Provider.of<SMProvider>(context, listen: false)
                .lstStudentQustions;
            if (lstQues.length != 0) {
              Provider.of<SMProvider>(context, listen: false).addLstAnswers(
                  Provider.of<SMProvider>(context, listen: false).lstuseransw,
                  lstQues);
              var id = Provider.of<SMProvider>(context, listen: false).id;
              Future.delayed(Duration(seconds: 5), () {
                UserAnswer.updateUserCourseResult(id, courseId);
              });
            }
            Navigator.of(context).pop();
          },
          build: (BuildContext context, double time) {
            return Container(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              //height: double.infinity,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Time: ",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            border: Border.all(
                                width: 2,
                                color: Color.fromARGB(255, 199, 185, 58)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                (num.parse(((time / 60) + 1).toString())
                                        .toInt())
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                        Text(" minuts",
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: Provider.of<SMProvider>(context)
                          .getQuestionsWidgets(courseId),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        var lstQues =
                            Provider.of<SMProvider>(context, listen: false)
                                .lstStudentQustions;
                        if (lstQues.length != 0) {
                          Provider.of<SMProvider>(context, listen: false)
                              .addLstAnswers(
                                  Provider.of<SMProvider>(context,
                                          listen: false)
                                      .lstuseransw,
                                  lstQues);
                          var id =
                              Provider.of<SMProvider>(context, listen: false)
                                  .id;
                          Future.delayed(Duration(seconds: 2), () {
                            UserAnswer.updateUserCourseResult(id, courseId);
                          });
                        }
                        Provider.of<SMProvider>(context, listen: false)
                            .clearAnswers;
                        showDialog(
                            context: context,
                            builder: (_) {
                              return AlertDialog(
                                backgroundColor:
                                    Color.fromARGB(255, 33, 47, 49),
                                title: Text("Loading...",
                                    style: TextStyle(color: Colors.white)),
                                actions: [],
                              );
                            });
                        Future.delayed(Duration(seconds: 2), () {
                          Navigator.of(context).pop();
                        });
                        Future.delayed(Duration(seconds: 1), () {
                          Navigator.of(context).pop();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 82, 182, 112),
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.corporate_fare_sharp, color: Colors.black),
                          SizedBox(width: 15),
                          Text(
                            "Finish",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    // Column(children: Provider.of<SMProvider>(context, listen: false)
                    //     .getResultsWidgets(id, courseId))
                  ],
                ),
              ),
            );
          },
        ));
  }
}
