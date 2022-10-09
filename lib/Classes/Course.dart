// ignore_for_file: file_names, prefer_collection_literals, unnecessary_new, unnecessary_this, non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable
import 'package:http/http.dart' as http;

class Course {
  int? id;
  String? courseName;

  Course({this.id, this.courseName});

  Course.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseName = json['courseName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['courseName'] = this.courseName;
    return data;
  }

  ///////////////////////////////
  ///////////////////////////////
  static void AddCourse(cn) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addCourse", {"cn": cn}),
    );
    print(request.body.toString());
  }

  static void UpdateCourse(id, cn) async {
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateCourse", {"id": "${id}", "cn": cn}),
    );
    print(request.body.toString());
  }

  static void removeCourse(id) async {
    var request = await http.post(
      Uri.http("127.0.0.1:8000", "/deleteCourse", {
        "id": "$id",
      }),
    );
    print(request.body.toString());
  }
}
