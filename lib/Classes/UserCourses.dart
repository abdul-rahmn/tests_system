// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, file_names, non_constant_identifier_names, avoid_print, unused_local_variable, unnecessary_brace_in_string_interps, unnecessary_string_interpolations
import 'package:http/http.dart' as http;

class UserCourses {
  int? id;
  int? userId;
  int? courseId;
  dynamic countTrue;
  dynamic countFalse;
  dynamic average;

  UserCourses(
      {this.id,
      this.userId,
      this.courseId,
      this.countTrue,
      this.countFalse,
      this.average});

  UserCourses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    courseId = json['courseId'];
    countTrue = json['countTrue'];
    countFalse = json['countFalse'];
    average = json['average'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userId'] = this.userId;
    data['courseId'] = this.courseId;
    data['countTrue'] = this.countTrue;
    data['countFalse'] = this.countFalse;
    data['average'] = this.average;
    return data;
  }

  ///////////////////////////////
  ///////////////////////////////

  static void AddUserCourses(uid, cid) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addUserCourses", {"uid": uid, "cid": cid}),
    );
    print(request.body.toString());
  }

  static void removeUserCourses(id) async {
    var request = await http.post(
      Uri.http("127.0.0.1:8000", "/deleteUserCourses", {
        "id": "$id",
      }),
    );
    print(request.body.toString());
  }

  static void UpdateUserCourses(id, uid, cid) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateUserCourses",
          {"id": "${id}", "uid": "${uid}", "cid": "${cid}"}),
    );
    print(request.body.toString());
  }
}
