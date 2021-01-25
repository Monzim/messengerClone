import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:msg_clone/widget/bezierContainer.dart';

class InfoAboutAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#D4DBF5"),
      body: Stack(
        children: [
          Positioned(
              bottom: MediaQuery.of(context).size.height * .0,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainerDrawerPage3()),
          Positioned(
              bottom: MediaQuery.of(context).size.height * .5,
              left: -MediaQuery.of(context).size.width * .4,
              child: BezierContainerDrawerPage4()),
          Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
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
                            style: TextStyle(
                                color: Color(0xffe46b10), fontSize: 30),
                          ),
                        ]),
                  ),
                  SizedBox(height: 15),
                  // Text(
                  //   "",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  // ),
                  RichTextFor(context, "Thank you for using \nmy App 😃", 20.0,
                      FontWeight.w500),
                  SizedBox(height: 15),

                  Container(
                      width: 200.0,
                      height: 200.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/1349722974677467139/Sm4DrmsI_400x400.jpg")))),
                  SizedBox(height: 20),
                  RichTextFor(
                      context, "Azraf Al Monzim", 35.0, FontWeight.w800),
                  SizedBox(height: 15),
                  Container(
                    height: 40,
                    width: 210,
                    child: RaisedButton(
                      color: Colors.blueGrey[400],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/github-sign.png",
                            height: 50,
                          ),
                          SizedBox(width: 5),
                          SelectableText('github.com/monzim'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 200,
                    child: RaisedButton(
                      color: Colors.pink[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/instagram.png",
                            height: 50,
                          ),
                          SizedBox(width: 5),
                          SelectableText('azraf_al_monzim'),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),
                  Container(
                    height: 40,
                    width: 200,
                    child: RaisedButton(
                      color: Colors.lightBlue[800],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22.0),
                      ),
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/images/facebook.png",
                            height: 50,
                          ),
                          SizedBox(width: 5),
                          SelectableText('azrafal.monzim'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
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
          ),
        ],
      ),
    );
  }
}

RichTextFor(context, textName, fontsize, fontWeight) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      text: textName,
      style: GoogleFonts.portLligatSans(
        textStyle: Theme.of(context).textTheme.display1,
        fontSize: fontsize,
        fontWeight: fontWeight,
        color: Colors.black,
      ),
    ),
  );
}

AppNameTitle(context, mainFontsize) {
  return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'M',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: mainFontsize,
            fontWeight: FontWeight.w700,
            color: Color(0xffe46b10),
          ),
          children: [
            TextSpan(
              text: 'Ch',
              style: TextStyle(color: Colors.black, fontSize: mainFontsize - 5),
            ),
            TextSpan(
              text: 'ats',
              style: TextStyle(
                  color: Color(0xffe46b10), fontSize: mainFontsize - 5),
            ),
          ]));
}
