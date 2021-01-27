import 'package:flutter/material.dart';
import 'package:msg_clone/widget/infoPage.dart';
import 'package:msg_clone/widget/widgetsCollention.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppNameTitle(context, 29.0, Colors.black, Colors.black),
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
            SizedBox(
              width: 250.0,
              child: ColorizeAnimatedTextKit(
                onTap: () {
                  print("Tap Event");
                },
                text: [
                  "MChats",
                  "MChats",
                  "MChats",
                ],
                textStyle: TextStyle(fontSize: 50.0, fontFamily: "Horizon"),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
