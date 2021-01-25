import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:msg_clone/services/auth.dart';
import 'package:msg_clone/views/signin.dart';
import 'package:msg_clone/widget/aboutPage.dart';
import 'package:msg_clone/widget/bezierContainer.dart';
import 'package:msg_clone/widget/infoPage.dart';
import 'package:msg_clone/widget/widgetsCollention.dart';

Widget settingPage(context, myName, muUrl, myEmail) {
  return Scaffold(
    backgroundColor: HexColor("#D4DBF5"),
    body: Stack(
      children: [
        // Positioned(
        //     top: MediaQuery.of(context).size.height * .15,
        //     right: -MediaQuery.of(context).size.width * .4,
        //     child: BezierContainer()),
        Positioned(
            bottom: MediaQuery.of(context).size.height * .0,
            right: -MediaQuery.of(context).size.width * .4,
            child: BezierContainerDrawerPage1()),
        Positioned(
            bottom: MediaQuery.of(context).size.height * .5,
            left: -MediaQuery.of(context).size.width * .4,
            child: BezierContainerDrawerPage2()),
        Positioned(
          left: MediaQuery.of(context).size.width * .05,
          top: MediaQuery.of(context).size.height * .06,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(width: 10),
              AppNameTitle(context, 30.0, Color(0xffe46b10), Colors.black),
            ],
          ),
        ),

        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 130),
              ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  muUrl,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  Column(
                    children: [
                      RichTextFor(context, myName, 36.0, FontWeight.bold),
                      RichTextFor(context, myEmail, 20.0, FontWeight.normal),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: Icon(Icons.help),
                label: Text("Help"),
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: HexColor("#0C4879"),
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.developer_mode),
                label: Text("Developer Info"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoAboutAppPage()));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.info),
                label: Text("About"),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AboutPage());
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              ElevatedButton.icon(
                icon: Icon(Icons.logout),
                label: Text("LOG OUT"),
                onPressed: () {
                  AuthMethods().signOut().then((s) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 40,
                height: 40,
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
            ],
          ),
        ),
      ],
    ),
    // color: Colors.amber,
  );
}
