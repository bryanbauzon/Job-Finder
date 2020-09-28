import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/common/widgets.dart';

class Profile extends StatefulWidget {
  final int prevScreen;

  Profile({
    Key key,
    @required this.prevScreen,
  });

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget textWidget(String text1, String text2) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(text1,
                    style: GoogleFonts.lato(color: Common().appColor,
                      fontWeight: FontWeight.w600
                    )),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(text2,
                    style: GoogleFonts.lato(
                        color: Common().appColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300)),
              ),
            ],
          ),
        ),
      ));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Widgets()
                  .appBar(context, "profile", widget.prevScreen, null, null),
              Expanded(
                child: Container(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: ListView(children: [
                    textWidget("Name", "Max Bryan C. Bauzon"),
                    textWidget(
                        "Education", "PHINMA- University of Pangasinan - BSIT"),
                    textWidget("Experience", "Junior Developer"),
                    textWidget("Skills",
                        "Lorem Ipsum, Lorem Ipsum, Lorem Ipsum, Lorem Ipsum"),
                    textWidget("Address", "Manila, PH"),
                    textWidget("Github", "https://github.com/bryanbauzon"),
                    textWidget("About",
                        """Experience Junior Java Developer with demonstration history of working in information technology and services industry. Skilled in Batch processing, Javascript and Front-end Development, Flutter and Object Oriented Programming(OOP). Strong engineering professional with a Bachelor's degree focused in Computer programming from University of Pangasinan."""),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Common().appColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text("Edit",
                                  style:
                                      GoogleFonts.lato(color: Common().white))),
                        ),
                      ),
                    )
                  ]),
                )),
              ),
            ],
          ),
        )),
        onWillPop: () async => false);
  }
}
