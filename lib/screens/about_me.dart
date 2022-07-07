import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        Container(
          height: size.height * .25,
          decoration: BoxDecoration(
            color: Color(0xFF89dad0),
          ),
        ),
        SafeArea(
            child: Column(
          children: [
            Text("Bonjour !",
                style: TextStyle(
                  fontSize: size.height * .075,
                  fontWeight: FontWeight.w200,
                )),
            Container(
              padding: EdgeInsets.all(8),
              child: Image.asset(
                "assets/images/pic.png",
                height: size.height * .2,
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 22, vertical: 2),
                child: Text(
                    "I'm Riddhima, pursuing majors in Biological Sciences and Electronics and Communication Engineering. I am a geek, starting to fall in love with App development. WELCOME TO MY FIRST FLUTTER APP.",
                    style: TextStyle(
                      fontSize: size.height * .025,
                      fontWeight: FontWeight.normal,
                    ),
                    textAlign: TextAlign.center)),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22, vertical: 2),
              child: Text(
                  "Currently I'm also trying my hands on Machine learning .I enjoy working in teams and learning new skills.",
                  style: TextStyle(
                    fontSize: size.height * .025,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25, vertical: 2),
              child: Text(
                  "Some of my other hobbies include swimming,reading books,coding and gardening.",
                  style: TextStyle(
                    fontSize: size.height * .025,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center),
            )
          ],
        )),
      ]),
    );
  }
}
