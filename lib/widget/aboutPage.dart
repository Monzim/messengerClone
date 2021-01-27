import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:msg_clone/widget/bezierContainer.dart';
import 'package:msg_clone/widget/infoPage.dart';
import 'package:msg_clone/widget/widgetsCollention.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:page_transition/page_transition.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      // child: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     AppNameTitle(context, 29.0, Colors.black, Colors.black),
      //     Text("About Us", style: TextStyle(fontSize: 30)),
      //     Container(
      //       width: 50,
      //       height: 50,
      //       decoration: BoxDecoration(
      //         shape: BoxShape.circle,
      //         color: Colors.amber,
      //       ),
      //       child: IconButton(
      //         icon: Icon(Icons.arrow_back),
      //         onPressed: () {
      //           Navigator.pop(context);
      //         },
      //       ),
      //     ),
      //     GestureDetector(
      //         onTap: () {
      //           showDialog(
      //               context: context,
      //               builder: (BuildContext context) =>
      //                   buildAboutDialog(context));
      //         },
      //         child: Text(
      //           "Privacy Policy",
      //           style: TextStyle(fontSize: 20),
      //         )),
      //     GestureDetector(
      //       onTap: () {
      //         showDialog(
      //             context: context,
      //             builder: (BuildContext context) =>
      //                 buildTermsAndConditionDialog(context));
      //       },
      //       child: Text(
      //         "Terms And Condition",
      //         style: TextStyle(fontSize: 20),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 250.0,
      //       child: ColorizeAnimatedTextKit(
      //         onTap: () {
      //           print("Tap Event");
      //         },
      //         text: [
      //           "MChats",
      //           "MChats",
      //           "MChats",
      //         ],
      //         textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
      //         colors: [
      //           Colors.purple,
      //           Colors.blue,
      //           Colors.yellow,
      //           Colors.red,
      //         ],
      //         textAlign: TextAlign.start,
      //       ),
      //     ),
      //   ],
      // ),
      // ),
      body: Stack(
        children: [
          Positioned(
              top: MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer()),

          Positioned(
              bottom: MediaQuery.of(context).size.height * .0,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainerDrawerPage1()),

          Positioned(
              bottom: MediaQuery.of(context).size.height * .5,
              left: -MediaQuery.of(context).size.width * .4,
              child: BezierContainerDrawerPage2()),
          // Positioned(
          //   top: MediaQuery.of(context).size.height * .5,
          //   left: MediaQuery.of(context).size.width * .5,
          //   child: SizedBox(
          //     height: 250,
          //     child: ScaleAnimatedTextKit(
          //       text: ["Think", "Build", "Ship"],
          //       textStyle: GoogleFonts.portLligatSans(
          //         fontSize: 50,
          //         fontWeight: FontWeight.bold,
          //       ),
          //       textAlign: TextAlign.start,
          //     ),
          //   ),
          // ),
          Positioned(
            top: MediaQuery.of(context).size.height * .2,
            left: MediaQuery.of(context).size.width * .1,
            child: SizedBox(
              width: 40,
              child: ScaleAnimatedTextKit(
                text: ["Think", "Build", "Ship"],
                textStyle: GoogleFonts.portLligatSans(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                ColorizeAnimatedTextKit(
                  onTap: () {},
                  text: [
                    "MChats",
                    "MChats",
                    "MChats",
                  ],
                  textStyle: GoogleFonts.portLligatSans(
                    textStyle: Theme.of(context).textTheme.display1,
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                  colors: [
                    Colors.purple,
                    Colors.blue,
                    Colors.yellow,
                    Colors.red,
                  ],
                  textAlign: TextAlign.start,
                ),
                Text("About Us", style: TextStyle(fontSize: 30)),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.amber,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) =>
                              buildAboutDialog(context));
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(fontSize: 20),
                    )),
                GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            buildTermsAndConditionDialog(context));
                  },
                  child: Text(
                    "Terms And Condition",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                FloatingActionButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.amber,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
