// ignore_for_file: unused_import, file_names, unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_typing_uninitialized_variables, avoid_init_to_null, unnecessary_this
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/Course.dart';
import 'package:tests_system/Classes/Question.dart';
import 'package:tests_system/Classes/ResultData.dart';
import 'package:tests_system/Classes/User.dart';
import 'package:tests_system/Classes/UserAnswers.dart';
import 'package:tests_system/Classes/UserCourses.dart';

class SMProvider with ChangeNotifier {
  var id = 0;
  var fullName = "";
  var userName = "";
  var password = "";
  var state = "";

  void changeUser(id, fn, un, pw, st) {
    this.id = id;
    this.fullName = fn;
    this.userName = un;
    this.password = pw;
    this.state = st;
    print(id);
    print(fullName);
    print(userName);
    print(password);
    print(state);
    notifyListeners();
  }

  var stateShowUpdateUser = true;
  var stateShowAddUser = true;
  var stateShowLogin = true;
  var stateShowCreate = true;

  void changStateshowUpdate() {
    stateShowUpdateUser = !stateShowUpdateUser;
    notifyListeners();
  }

  void changStateshowAdd() {
    stateShowAddUser = !stateShowAddUser;
    notifyListeners();
  }

  void changStateshowLogin() {
    stateShowLogin = !stateShowLogin;
    notifyListeners();
  }

  void changStateshowCreate() {
    stateShowCreate = !stateShowCreate;
    notifyListeners();
  }

  List<Course> lstCourses = [];
  void loadCourses() async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getCourses"));
    //print(request.body.toString());
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstCourses = lstd.map((c) => Course.fromJson(c)).toList();
    notifyListeners();
  }

  void removeCourse(crs) {
    lstCourses.remove(crs);
    notifyListeners();
  }

  List<Question> lstQuestions = [];
  void loadQuestions() async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getQuestions"));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstQuestions = lstd.map((q) => Question.fromJson(q)).toList();
    notifyListeners();
  }

  void removeQuestion(qus) {
    lstQuestions.remove(qus);
    notifyListeners();
  }

  List<User> lstUsers = [];
  void loadUsers() async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getUsers"));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstUsers = lstd.map((u) => User.fromJson(u)).toList();
    notifyListeners();
  }

  void removeUser(us) {
    lstUsers.remove(us);
    notifyListeners();
  }

  List<UserAnswer> lstUserAnswers = [];
  void loadUserAnswer() async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getUserAnswers"));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstUserAnswers = lstd.map((q) => UserAnswer.fromJson(q)).toList();
    notifyListeners();
  }

  void removeUserAnswer(us) {
    lstUserAnswers.remove(us);
    notifyListeners();
  }

  List<UserCourses> lstUserCourses = [];
  void loadUserCourses() async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getUserCourses"));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstUserCourses = lstd.map((uc) => UserCourses.fromJson(uc)).toList();
    notifyListeners();
  }

  void removeUserCourses(uc) {
    lstUserCourses.remove(uc);
    notifyListeners();
  }

  List<ResultData> lstResuData = [];
  void loadResulData(uid, cid) async {
    var request = await http.get(Uri.http("127.0.0.1:8000", "/getDataResult",
        {"userId": "$uid", "courseId": "$cid"}));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstResuData = lstd.map((q) => ResultData.fromJson(q)).toList();
    notifyListeners();
  }

// Countdown(
//       seconds: 5,
//       build: (BuildContext context, double time){
//         return Text(time.toString());
//       },
//       interval: Duration(milliseconds: 100),
//       onFinished: () {
//         print('Timer is done!');
//         Navigator.of(context).pop();
//       },
//     )

//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//

  List<Course> lstUserCoursesById = [];
  void loadUserCoursesById() async {
    var request = await http.get(Uri.http(
        "127.0.0.1:8000", "/getUserCoursesById", {"userId": "${this.id}"}));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstUserCoursesById = lstd.map((uc) => Course.fromJson(uc)).toList();
    notifyListeners();
  }

  List<Question> lstStudentQustions = [];
  getStudentQuestions(courseId) async {
    var request = await http.get(Uri.http(
        "127.0.0.1:8000", "/getStudentQuestions", {"courseId": "$courseId"}));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    lstStudentQustions = lstd.map((s) => Question.fromJson(s)).toList();
    notifyListeners();
  }

  void removeStudentQuestions(qid) {
    lstStudentQustions.remove(qid);
    notifyListeners();
  }

  var name = "";
  var courseName = "";

  void getNameUser(id) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/getNameUser", {"id": "${id}"}),
    );
    //print(request.body.toString());
    name = request.body.toString();
    notifyListeners();
  }

  void getNameCourse(id) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/getNameCourse", {"id": "${id}"}),
    );
    //print(request.body.toString());
    courseName = request.body.toString();
    notifyListeners();
  }

  Future<String> checkCompleteCourse(courseId) async {
    print(this.id);
    print(courseId);
    var request = await http.get(Uri.http("127.0.0.1:8000",
        "/checkCompleteCourse", {"uid": "${this.id}", "cid": "$courseId"}));
    //print(request.body.toString());
    return request.body.toString();
  }

//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//
//********************************************************** *//

//---------------------Questuin Widgets---------------------------//

  var lstGroupValues = [];
  var lstuseransw = [];
  void clearAnswers() {
    lstGroupValues.clear();
    lstuseransw.clear();
    lstuseransw = [];
    notifyListeners();
  }

  var lstWidg = [Container()];
  List<Widget> getQuestionsWidgets(courseId) {
    getStudentQuestions(courseId);
    int ind = -1;
    String groupValue = "";
    String answer = " ";
    List<Widget> lstWidg = [];

    for (var i in lstStudentQustions) {
      ind++;
      var index = ind;
      if (lstuseransw.length == index) {
        lstuseransw.add(answer);
      }
      lstGroupValues.add(groupValue);

      lstWidg.add(SizedBox(height: 30));
      lstWidg.add(Container(
        width: double.infinity,
        child: Text(
          "${index + 1}- ${i.question}",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ));
      lstWidg.add(SizedBox(height: 10));
      lstWidg.add(Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: Colors.yellow),
        ),
        child: Column(
          children: [
            RadioListTile(
                title:
                    Text("${i.answer1}", style: TextStyle(fontSize: 18,color: Colors.white)),
                value: "${i.answer1}",
                groupValue: lstGroupValues[index],
                onChanged: (v1) {
                  lstGroupValues[index] = v1.toString();
                  lstuseransw[index] = v1.toString();
                  // print(index);
                  // print(i.answer1);
                  print(lstuseransw);
                  //print(lstuseransw.length);
                }),
            SizedBox(height: 20),
            RadioListTile(
                title:
                    Text("${i.answer2}", style: TextStyle(fontSize: 18,color: Colors.white)),
                value: "${i.answer2}",
                groupValue: lstGroupValues[index],
                onChanged: (v1) {
                  lstGroupValues[index] = v1.toString();
                  lstuseransw[index] = v1.toString();
                  // print(index);
                  // print(i.answer2);
                  print(lstuseransw);
                }),
            SizedBox(height: 20),
            RadioListTile(
                title:
                    Text("${i.answer3}", style: TextStyle(fontSize: 18,color: Colors.white)),
                value: "${i.answer3}",
                groupValue: lstGroupValues[index],
                onChanged: (v1) {
                  lstGroupValues[index] = v1.toString();
                  lstuseransw[index] = v1.toString();
                  // print(index);
                  // print(i.answer3);
                  print(lstuseransw);
                }),
            SizedBox(height: 20),
            RadioListTile(
                title:
                    Text("${i.answer4}", style: TextStyle(fontSize: 18,color: Colors.white)),
                value: "${i.answer4}",
                groupValue: lstGroupValues[index],
                onChanged: (v1) {
                  lstGroupValues[index] = v1.toString();
                  lstuseransw[index] = v1.toString();
                  // print(index);
                  // print(i.answer4);
                  print(lstuseransw);
                }),
            SizedBox(height: 20),
          ],
        ),
      ));
      lstWidg.add(Container(
        height: 40,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color.fromARGB(255, 18, 39, 19),
              width: 1.0,
            ),
          ),
        ),
      ));
    }

    if (lstWidg.isEmpty) {
      var lstWidg1 = [
        Container(
            width: double.infinity,
            child: Column(children: [
              SizedBox(height: 50),
              Text("No questions have been added in this course",
                  style: TextStyle(
                      color: Color.fromARGB(255, 233, 233, 233),
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 50)
            ]))
      ];
      return lstWidg1;
    } else {}
    return lstWidg;
  }






  ////////////////////////////////////////

  void addLstAnswers(lstAnswers, lstQuestion) {
    for (var i = 0; i < lstQuestion.length; i++) {
      var userAnswer = lstAnswers[i];
      var userId = "${this.id}";
      var questionId = "${lstQuestion[i].id}";
      var courseId = "${lstQuestion[i].courseId}";
      var stateAnswer = "${lstAnswers[i] == lstQuestion[i].trueAnswer}";
      // Future.delayed(Duration(seconds: 5), () {

      // });
      UserAnswer.AddUserAnswer(
          userAnswer, userId, questionId, courseId, stateAnswer);
    }
  }

  List<UserCourses> userCourse = [];
  Future<String> getuserCourse(uid, cid) async {
    var request = await http.get(Uri.http(
        "127.0.0.1:8000", "/getUserCourse", {"uid": "$uid", "cid": "$cid"}));
    List<dynamic> lstd = jsonDecode(request.body.toString());
    userCourse = lstd.map((uc) => UserCourses.fromJson(uc)).toList();
    notifyListeners();
    return "";
  }
}
