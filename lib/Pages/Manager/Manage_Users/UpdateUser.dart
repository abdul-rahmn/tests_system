// ignore_for_file: prefer_const_constructors, unnecessary_import, file_names, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_typing_uninitialized_variables, use_key_in_widget_constructors, unused_element, avoid_print, no_logic_in_create_state, non_constant_identifier_names, unused_local_variable, unnecessary_brace_in_string_interps, unnecessary_null_comparison, body_might_complete_normally_nullable, prefer_initializing_formals
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/User.dart';

import 'ManageUsers.dart';

class UpdateUser extends StatelessWidget {
  var id;
  var fullName;
  var userName;
  var password;
  var state;
  UpdateUser(id, fullName, userName, password, state) {
    this.id = id;
    fnc.text = fullName;
    unc.text = userName;
    pwc.text = password;
    pw2c.text = password;
    stc.text = state;
  }

  var formKey = GlobalKey<FormState>();
  var fnc = TextEditingController();
  var unc = TextEditingController();
  var pwc = TextEditingController();
  var pw2c = TextEditingController();
  var stc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return ManageUsers();
              }));
            },
            icon: Icon(Icons.logout)),
        title: Text("Update User", style: TextStyle(fontSize: 25)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: fnc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 143, 231, 146),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 1,
                      ),
                    ),
                    labelText: "fullName",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "fullName required";
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: unc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 143, 231, 146),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 1,
                      ),
                    ),
                    labelText: "userName",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "userName required";
                    } else {
                      var state =
                          RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{5,}$")
                              .hasMatch(value.toString());
                      if (!state) {
                        return "Password must be at least 5 characters, at least one letter and one number";
                      }
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: pwc,
                  obscureText:
                      Provider.of<SMProvider>(context).stateShowUpdateUser,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 143, 231, 146),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 1,
                        ),
                      ),
                      labelText: "password",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          Provider.of<SMProvider>(context, listen: false)
                              .changStateshowUpdate();
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "password required";
                    } else {
                      var state =
                          RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                              .hasMatch(value.toString());
                      if (!state) {
                        return "Password must be Minimum 8 characters, at least one letter and one number";
                      }
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: pw2c,
                  obscureText:
                      Provider.of<SMProvider>(context).stateShowUpdateUser,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 143, 231, 146),
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 1,
                        ),
                      ),
                      labelText: "Confirm password",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          Provider.of<SMProvider>(context, listen: false)
                              .changStateshowUpdate();
                        },
                      ) //internal in right fied
                      ),
                  validator: (value) {
                    if (pwc.text != value) {
                      return "Password does not match";
                    }
                    if (value!.isEmpty || value == null || value == "") {
                      return "Confirm Password required";
                    } else {
                      var state =
                          RegExp(r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$")
                              .hasMatch(value.toString());
                      if (!state) {
                        return "Password must be Minimum 8 characters, at least one letter and one number";
                      }
                    }
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: stc,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.yellow,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Color.fromARGB(255, 143, 231, 146),
                        width: 1,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.yellow,
                        width: 1,
                      ),
                    ),
                    labelText: "state(admin/user)",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value == null ||
                        value == "" ||
                        (value != "admin" && value != "user")) {
                      return "state required";
                    }
                  },
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            User.UpdateUser(
                                id, fnc.text, unc.text, pwc.text, stc.text);
                                Provider.of<SMProvider>(context,listen: false).loadUsers();
                                showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  backgroundColor: Color.fromARGB(255, 33, 47, 49),
                                  title: Text("Update in progress...",style: TextStyle(color: Colors.white)),
                                  actions: [],
                                );
                              });                            
                            Future.delayed(Duration(seconds: 1), () {
                            Provider.of<SMProvider>(context, listen: false)
                                .loadUsers();
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                              return ManageUsers();
                            }));
                          });
                          }
                        },
                        child: Row(
                          children: [Icon(Icons.add), Text("Update")],
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
