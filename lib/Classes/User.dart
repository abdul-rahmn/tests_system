// ignore_for_file: file_names, unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names, avoid_print, unnecessary_brace_in_string_interps, unused_local_variable
import 'package:http/http.dart' as http;

class User {
  int? id;
  String? fullName;
  String? userName;
  String? password;
  String? state;

  User({
    this.id,
    this.fullName,
    this.userName,
    this.password,
    this.state,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    userName = json['userName'];
    password = json['password'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['password'] = this.password;
    data['state'] = this.state;
    return data;
  }

  ///////////////////////////////
  ///////////////////////////////

  static void AddUser(fnc, unc, pwc, stc) async {
    var fn = fnc;
    var un = unc;
    var pw = pwc;
    var st = stc;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/addUser",
          {"fn": fn, "un": un, "pw": pw, "st": st}),
    );
    print(request.body.toString());
  }

  static void UpdateUser(id, fnc, unc, pwc, stc) async {
    var fn = fnc;
    var un = unc;
    var pw = pwc;
    var st = stc;
    var request = await http.get(
      Uri.http("127.0.0.1:8000", "/updateUser", {
        "id": "${id}",
        "fn": fn,
        "un": un,
        "pw": pw,
        "st": st,
      }),
    );
    print(request.body.toString());
  }

  static void removeUser(id) async {
    var request = await http.post(
      Uri.http("127.0.0.1:8000", "/deleteUser", {
        "id": "$id",
      }),
    );
  }
}
