//import 'package:splashscreen/splashscreen.dart';
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, must_be_immutable

import 'package:provider/provider.dart';
import 'package:tests_system/Classes/SMProvider.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:flutter/material.dart';
import 'Pages/Home/LogInPage.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) {
      return SMProvider();
    },
    builder: (context, child) => MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 66, 134, 129),
          // secondary: Color.fromARGB(255, 76, 168, 175),
        ),
        // textTheme: const TextTheme(
        //     bodyText2: TextStyle(color: Color.fromARGB(255, 39, 167, 176))),
      ),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  var i=0;
  @override
  Widget build(BuildContext context) {
    if (i==0) {
      Provider.of<SMProvider>(context).loadCourses();
      Provider.of<SMProvider>(context).loadQuestions();
      Provider.of<SMProvider>(context).loadUsers();
      Provider.of<SMProvider>(context).loadUserAnswer();
      Provider.of<SMProvider>(context).loadUserCourses();
      
      i++;
    }
    return Scaffold(      
      body: SplashScreenView(
        navigateRoute: LogInPage(),
        duration: 3500,
        imageSize: 250,
        imageSrc: "images/test.png",
        text: "Welcome To Tests System ",
        textType: TextType.ScaleAnimatedText,
        textStyle: TextStyle(
            color: Color.fromARGB(255, 68, 187, 177),
            shadows: [
              Shadow(
                offset: Offset(0.0, 3.0), //position of shadow
                blurRadius: 6.0, //blur intensity of shadow
                color: Color.fromARGB(255, 0, 0, 0)
                    .withOpacity(0.5), //color of shadow with opacity
              ),
              //add more shadow with different position offset here
            ],
            fontSize: 30.0,
            fontWeight: FontWeight.bold),
        //backgroundColor: Color.fromARGB(255, 202, 255, 248),
        backgroundColor: Color.fromARGB(255, 50, 78, 77),
      ),
    );
  }
}


// SplashScreen(
//           seconds: 1,
//           navigateAfterSeconds: new HomePage(),
//           title: new Text(
//             'Welcome In System Tests',
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
//           ),
//           //imageBackground: AssetImage("images/yyy.webp"),
//           image: Image.asset("images/test.png"),
//           backgroundColor: Color.fromARGB(52, 129, 138, 143),
//           loaderColor: Colors.blueGrey,
//         ),



