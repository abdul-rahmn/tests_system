// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, avoid_print, non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:http/http.dart' as http;

class Question {
  int? id;
  String? question;
  String? answer1;
  String? answer2;
  String? answer3;
  String? answer4;
  String? trueAnswer;
  int? courseId;

  Question(
      {this.id,
      this.question,
      this.answer1,
      this.answer2,
      this.answer3,
      this.answer4,
      this.trueAnswer,
      this.courseId});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer1 = json['answer1'];
    answer2 = json['answer2'];
    answer3 = json['answer3'];
    answer4 = json['answer4'];
    trueAnswer = json['trueAnswer'];
    courseId = json['courseId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['answer1'] = this.answer1;
    data['answer2'] = this.answer2;
    data['answer3'] = this.answer3;
    data['answer4'] = this.answer4;
    data['trueAnswer'] = this.trueAnswer;
    data['coursIed'] = this.courseId;
    return data;
  }

  ///////////////////////////////
  ///////////////////////////////

  static void AddQuestion(qnc, ans1c, ans2c, ans3c, ans4c, tac, cidc) async {
    var qn = qnc;
    var ans1 = ans1c;
    var ans2 = ans2c;
    var ans3 = ans3c;
    var ans4 = ans4c;
    var ta = tac;
    var cid = cidc;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addQuestion", {
        "qn": qn,
        "ans1": ans1,
        "ans2": ans2,
        "ans3": ans3,
        "ans4": ans4,
        "ta": ta,
        "cid": cidc
      }),
    );
    print(request.body.toString());
  }

  static void UpdateQuestion(
      id, qnc, ans1c, ans2c, ans3c, ans4c, tac, cidc) async {
    var qn = qnc;
    var ans1 = ans1c;
    var ans2 = ans2c;
    var ans3 = ans3c;
    var ans4 = ans4c;
    var ta = tac;
    var cid = cidc;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateQuestion", {
        "id": "${id}",
        "qn": qn,
        "ans1": ans1,
        "ans2": ans2,
        "ans3": ans3,
        "ans4": ans4,
        "ta": ta,
        "cid": cid
      }),
    );
    print(request.body.toString());
  }

  static void removeQuestion(id) async {
    var request = await http.post(
      Uri.http("127.0.0.1:8000", "/deleteQuestion", {
        "id": "$id",
      }),
    );
  }
}
