// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, unused_local_variable, unused_element, depend_on_referenced_packages, unnecessary_string_interpolations, avoid_print, body_might_complete_normally_nullable, unnecessary_null_comparison, use_key_in_widget_constructors, must_be_immutable
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/User.dart';
import 'package:tests_system/Pages/Manager/Manage_Users/ManageUsers.dart';

class AddUser extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var fnc = TextEditingController();
  var unc = TextEditingController();
  var pwc = TextEditingController();
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
          title: Text("Add A New User", style: TextStyle(fontSize: 25)),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Form(
            key: formKey,
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 15),
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
                    labelText: "Full Name",
                    prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "Full Name required";
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
                    labelText: "User Name",
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "User Name required";
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
                      Provider.of<SMProvider>(context).stateShowAddUser,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.yellow,
                          width: 1,
                        ),
                      ),
                      labelText: "Password",
                      prefixIcon: IconButton(
                        icon: Icon(Icons.remove_red_eye),
                        onPressed: () {
                          Provider.of<SMProvider>(context, listen: false)
                              .changStateshowAdd();
                        },
                      )),
                  validator: (value) {
                    if (value!.isEmpty || value == null || value == "") {
                      return "Password required";
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
                  obscureText:
                      Provider.of<SMProvider>(context).stateShowAddUser,
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        color: Colors.yellow,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.green,
                          width: 2,
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
                              .changStateshowAdd();
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
                    labelText: "state(admin/user)",
                    prefixIcon: Icon(Icons.person),
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
                          User.AddUser(fnc.text, unc.text, pwc.text, stc.text);
                          Provider.of<SMProvider>(context, listen: false)
                                .loadUsers();
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  backgroundColor: Color.fromARGB(255, 33, 47, 49),
                                  title: Text("Adding in progress...",style: TextStyle(color: Colors.white)),
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
                        children: [
                          Icon(Icons.library_add_check_sharp),
                          Text("Add")
                        ],
                      ),
                    ),
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
