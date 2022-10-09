// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names, avoid_print, unused_local_variable, prefer_typing_uninitialized_variables, unnecessary_brace_in_string_interps
import 'package:http/http.dart' as http;

class UserAnswer {
  int? id;
  String? userAnswer;
  int? userId;
  int? questionId;
  int? courseId;
  String? stateAnswer;

  UserAnswer(
      {this.id,
      this.userAnswer,
      this.userId,
      this.questionId,
      this.courseId,
      this.stateAnswer});

  UserAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userAnswer = json['userAnswer'];
    userId = json['userId'];
    questionId = json['questionId'];
    courseId = json['courseId'];
    stateAnswer = json['stateAnswer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userAnswer'] = this.userAnswer;
    data['userId'] = this.userId;
    data['questionId'] = this.questionId;
    data['courseId'] = this.courseId;
    data['stateAnswer'] = this.stateAnswer;
    return data;
  }

  ///////////////////////////////
  ///////////////////////////////

  static void AddUserAnswer(uac, uidc, qidc, cidc, stac) async {
    var ua = uac;
    var uid = uidc;
    var qid = qidc;
    var cid = cidc;
    var sta = stac;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addUserAnswer",
          {"ua": ua, "uid": uid, "qid": qid, "cid": cid, "sa": sta}),
    );
    print(request.body.toString());
  }

  static void UpdateUserAnswer(id, usc, uidc, qidc, cidc, stac) async {
    var ua = usc;
    var uid = uidc;
    var qid = qidc;
    var cid = cidc;
    var sta = stac;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateUserAnswer", {
        "id": "$id",
        "ua": ua,
        "uid": "$uid",
        "qid": "$qid",
        "cid": "$cid",
        "sa": sta
      }),
    );
    print(request.body.toString());
  }

  static void removeUserAnswer(id) async {
    var request = await http.post(
      Uri.http("127.0.0.1:8000", "/deleteUserAnswer", {
        "id": "$id",
      }),
    );
  }

  ///////////////////////////////////////////////

  static void updateUserCourseResult(uid, cid) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateUserCourseResult",
          {"uid": "$uid", "cid": "$cid"}),
    );
    print(request.body.toString());
  }
}
