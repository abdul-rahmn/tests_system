// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, sized_box_for_whitespace, unused_element, unused_local_variable, avoid_unnecessary_containers, avoid_print, depend_on_referenced_packages, must_be_immutable, unnecessary_this, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:tests_system/Classes/User.dart';
import 'package:tests_system/Pages/Manager/ManagePage.dart';
import 'package:tests_system/Pages/Manager/Manage_Users/UserCoursesPage.dart';
import 'package:tests_system/Pages/Manager/Manage_Users/AddUser.dart';
import 'UpdateUser.dart';

class ManageUsers extends StatelessWidget {
  int x = 0;
  @override
  Widget build(BuildContext context) {
    if (x == 0) {
      Provider.of<SMProvider>(context, listen: false).loadUsers();
      x++;
    }
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 44, 66, 65),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (_) {
                return ManagePage();
              }));
            },
            icon: Icon(Icons.arrow_back_outlined)),
        title: Text("Manage Users"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 141, 199, 194),
        foregroundColor: Colors.black,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddUser();
          }));
        },
        child: Icon(Icons.person_add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 20),
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 5),
              Text(
                  "Number Of Users: ${Provider.of<SMProvider>(context).lstUsers.length}",
                  style: TextStyle(
                      color: Colors.white,
                      //backgroundColor: Color.fromARGB(255, 233, 233, 233),
                      fontSize: 20)),
              SizedBox(height: 5),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    // DataColumn(
                    //     label: Text(
                    //   "ID",
                    //   style: TextStyle(
                    //     fontSize: 19,
                    //     color: Color.fromARGB(255, 62, 255, 245),
                    //   ),
                    // )),
                    DataColumn(
                        label: Text(
                      "FullName",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "Courses",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    // DataColumn(label: Text("userName",style: TextStyle(fontWeight: FontWeight.bold),)),
                    // DataColumn(label: Text("password",style: TextStyle(fontWeight: FontWeight.bold),)),
                    DataColumn(
                        label: Text(
                      "state",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                    DataColumn(
                        label: Text(
                      "show/upd/del",
                      style: TextStyle(
                        fontSize: 19,
                        color: Color.fromARGB(255, 62, 255, 245),
                      ),
                    )),
                  ],
                  rows: [
                    ...Provider.of<SMProvider>(context).lstUsers.map((u) {
                      dynamic stateColor;
                      if (u.state == "admin") {
                        stateColor = Colors.yellow;
                      } else {
                        stateColor = Colors.white;
                      }
                      return DataRow(cells: [
                        // DataCell(Text("${u.id}",
                        //     style: TextStyle(
                        //       fontSize: 16,
                        //       color: Colors.white,
                        //     ))),
                        DataCell(Text("${u.fullName}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ))),
                        DataCell(
                          ElevatedButton(
                            onPressed: () {
                              if (u.state == "user") {
                                // Future.delayed(Duration(seconds: 2), () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (_) {
                                  return UserCoursesPage(
                                    u.id,
                                  );
                                }));
                                // });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Color.fromARGB(255, 33, 47, 49),
                                        title: Text(
                                            "It isn't possible to add items to the ِAdmin",
                                            style:
                                                TextStyle(color: Colors.white)),
                                        actions: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("OK")),
                                            ],
                                          ),
                                        ],
                                      );
                                    });
                              }
                            },
                            // style: ElevatedButton.styleFrom(
                            //   primary: Color.fromARGB(255, 56, 107, 104),
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 50, vertical: 20),
                            // ),
                            child: Text(
                              "Courses",
                              style: TextStyle(
                                //fontSize: 20,
                                color: Color.fromARGB(255, 255, 231, 19),
                                //fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        // DataCell(Text("${u.userName}")),
                        // DataCell(Text("${u.password}")),
                        DataCell(Text("${u.state}",
                            style: TextStyle(
                              fontSize: 16,
                              color: stateColor,
                            ))),
                        DataCell(Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 44, 66, 65),
                                          title: Text(
                                            "Data of Users",
                                            style: TextStyle(
                                                fontSize: 30,
                                                color: Colors.white),
                                          ),
                                          actions: [
                                            Container(
                                              width: double.infinity,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "ID: ",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240),
                                                            fontSize: 20)),
                                                    TextSpan(
                                                      text: "${u.id}",
                                                      style: TextStyle(
                                                          color: Color.fromARGB(
                                                              255,
                                                              240,
                                                              240,
                                                              240),
                                                          fontSize: 20),
                                                    )
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Full Name: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text: "${u.fullName}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240)))
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "User Name: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text: "${u.userName}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240)))
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "Password: ",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240))),
                                                    TextSpan(
                                                        text: "${u.password}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240)))
                                                  ])),
                                                  SizedBox(height: 20),
                                                  RichText(
                                                      text: TextSpan(children: [
                                                    TextSpan(
                                                        text: "State: ",
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240),
                                                            fontSize: 20)),
                                                    TextSpan(
                                                        text: "${u.state}",
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    240,
                                                                    240,
                                                                    240)))
                                                  ])),
                                                  SizedBox(height: 20),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("OK")),
                                              ],
                                            )
                                          ],
                                        );
                                      });

                                  // Navigator.of(context)
                                  //     .push(MaterialPageRoute(builder: (_) {
                                  //   return ViewUser(u.id, u.fullName,
                                  //       u.userName, u.password, u.state);
                                  // }));
                                },
                                icon: Icon(Icons.remove_red_eye),
                                color: Colors.green),
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .push(MaterialPageRoute(builder: (_) {
                                    return UpdateUser(u.id, u.fullName,
                                        u.userName, u.password, u.state);
                                  }));
                                },
                                icon: Icon(Icons.edit),
                                color: Color.fromARGB(255, 218, 200, 39)),
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return AlertDialog(
                                          backgroundColor:
                                              Color.fromARGB(255, 33, 47, 49),
                                          title: Text("Are you sure to Delete",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                          actions: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      User.removeUser(u.id);
                                                      Provider.of<SMProvider>(
                                                              context,
                                                              listen: false)
                                                          .removeUser(u);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("Yes")),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Text("No")),
                                              ],
                                            ),
                                          ],
                                        );
                                      });
                                },
                                icon: Icon(Icons.person_remove),
                                color: Colors.red)
                          ],
                        )),
                      ]);
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
