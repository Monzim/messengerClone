import 'package:flutter/material.dart';
import 'package:msg_clone/services/auth.dart';
import 'package:msg_clone/views/signin.dart';
import 'package:msg_clone/widget/bezierContainer.dart';
import 'package:msg_clone/widget/infoPage.dart';

Widget settingPage(context, myName, muUrl, myEmail) {
  return Scaffold(
    backgroundColor: Colors.white,
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
          child: Container(
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
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              ClipRRect(
                borderRadius: BorderRadius.circular(200),
                child: Image.network(
                  muUrl,
                  width: 60,
                  height: 60,
                ),
              ),
              Text(
                myName,
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              Text(
                myEmail,
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 200,
                child: RaisedButton(
                  color: Colors.pink[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoAboutAppPage()));
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.developer_mode,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Developer Info',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              Container(
                height: 40,
                width: 200,
                child: RaisedButton(
                  color: Colors.pink[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  onPressed: () {
                    AuthMethods().signOut().then((s) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    });
                  },
                  child: Row(
                    children: [
                      SizedBox(width: 35),
                      Text(
                        'LOG OUT',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(width: 5),
                      Icon(
                        Icons.logout,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 40,
                width: 120,
                child: RaisedButton(
                  color: Colors.pink[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.info,
                        size: 30,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'About',
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
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
