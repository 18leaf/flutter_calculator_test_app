import 'package:flutter/material.dart';
import 'package:test_app/pages/first_page.dart';
import 'package:test_app/pages/calculator.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ["Mitch", "Sharon", "Vince"];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Scaffold() = White Blank App
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
      routes: {
        '/firstpage': (context) => FirstPage(),
        '/calculator': (context) => Calculator(),
      }
      // home: Scaffold(
      //   body: Center(
      //     child: GestureDetector(
      //       onTap: userTapped,
      //       child: Container(
      //         height: 200,
      //         width: 200,
      //         color:  Colors.deepPurple[200],
      //         child: Center(child: Text("Tap ME")),
      //       ),
      //     ),
      //   ),
      //   // body: Stack(
      //   //   alignment: Alignment.bottomRight,
      //   //   children: [
      //   //     Container(
      //   //       height: 300,
      //   //       width: 300,
      //   //       color: Colors.deepPurple,
      //   //     ),
      //   //     Container(
      //   //       height: 200,
      //   //       width: 200,
      //   //       color: Colors.deepPurple[400],
      //   //     ),
      //   //     Container(
      //   //       height: 100,
      //   //       width: 100,
      //   //       color: Colors.deepPurple[200],
      //   //     ),
      //   //   ],
      //   // )
      //   // body: GridView.builder(
      //   //   itemCount: 64,
      //   //   gridDelegate:
      //   //   SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      //   //   itemBuilder: (context, index) => Container(
      //   //     color: Colors.deepPurple,
      //   //     margin: EdgeInsets.all(2),
      //   //   ),
      //   // ),
      // ),
    );
  }
}

