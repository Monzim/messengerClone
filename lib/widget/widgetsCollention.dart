import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:msg_clone/services/auth.dart';
import 'package:msg_clone/widget/bezierContainer.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Widget _entryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              obscureText: isPassword,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true))
        ],
      ),
    );
  }

  Widget _createAccountLabel() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Read Privacy Policy  ',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
              // width: 8,
              ),
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      _buildAboutDialog(context));
            },
            child: Text(
              'here',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
    );
  }

// title here
  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'M',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 35,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Ch',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'ats',
              style: TextStyle(color: Color(0xffe46b10), fontSize: 30),
            ),
          ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: HexColor("#F2F2F2"),
        body: Container(
          height: height,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .2,
                  child: BezierContainerFour()),
              Positioned(
                  top: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainer()),
              Positioned(
                  bottom: -height * .15,
                  right: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainerThree()),
              Positioned(
                  bottom: -height * .15,
                  left: -MediaQuery.of(context).size.width * .4,
                  child: BezierContainerTwo()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: height * .38),
                      _title(),
                      // SizedBox(height: 150),
                      SizedBox(height: 23),
                      // _googleButton(),
                      // SizedBox(height: height * .1),

                      SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          AuthMethods().signInWithGoogle(context);
                        },
                      ),
                      // SizedBox(height: height * .2),
                      _createAccountLabel(),
                      // popUPmenuD(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Widget _buildAboutDialog(BuildContext context) {
  return new AlertDialog(
    title: const Text('Privacy Policy'),
    content: new Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        _buildAboutText(),
      ],
    ),
    actions: <Widget>[
      new FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Okay, got it!'),
      ),
    ],
  );
}

Widget _buildAboutText() {
  TapGestureRecognizer _flutterTapRecognizer;
  TapGestureRecognizer _githubTapRecognizer;
  const TextStyle linkStyle = const TextStyle(
    color: Colors.blue,
  );
  return Expanded(
    child: SingleChildScrollView(
      physics: ClampingScrollPhysics(),
      child: new RichText(
        text: new TextSpan(
          text:
              'Monzim built the MChats app as a Free app. This SERVICE is provided by Monzim at no cost and is intended for use as is. This page is used to inform visitors regarding my policies with the collection, use, and disclosure of Personal Information if anyone decided to use my Service.',
          style: const TextStyle(color: Colors.black87),
          children: <TextSpan>[
            new TextSpan(
              text:
                  '\n\n If you choose to use my Service, then you agree to the collection and use of information in relation to this policy.',
              recognizer: _flutterTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
              text:
                  'The Personal Information that I collect is used for providing and improving the Service. I will not use or share your information with anyone except as described in this Privacy Policy.',
            ),
            new TextSpan(
              text: ' \n\nInformation Collection and Use',
              recognizer: _githubTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
                text:
                    '\nFor a better experience, while using our Service, I may require you to provide us with certain personally identifiable information, including but not limited to name, email .The information that I request will be retained on your device and is not collected by me in any way. \nThe app does use third party services that may collect information used to identify you.'),
            new TextSpan(
              text:
                  ' \n\nList of third party service providers used by the app',
              recognizer: _githubTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
                text:
                    '\n*Firebase \n*Google Analytics for Firebase \n*Google Play Services  '),
            new TextSpan(
              text: ' \n\n*Security ',
              recognizer: _githubTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
                text:
                    '\nI value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and I cannot guarantee its absolute security.'),
            new TextSpan(
              text: '\n\nChanges to This Privacy Policy ',
              recognizer: _githubTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
                text:
                    '\nI may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. I will notify you of any changes by posting the new Privacy Policy on this page.\nThis policy is effective as of 2021-01-24 '),
            new TextSpan(
              text: '\n\nContact Us',
              recognizer: _githubTapRecognizer,
              style: linkStyle,
            ),
            const TextSpan(
                text:
                    '\nIf you have any questions or suggestions about my Privacy Policy, do not hesitate to contact me at \nmonzim.linux@gmail.com.'),
          ],
        ),
      ),
    ),
  );
}
