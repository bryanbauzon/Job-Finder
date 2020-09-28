import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';

class Explore extends StatefulWidget {
  @override
  _ExploreState createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Widget textWidget(String text1, String text2, bool isHeader) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 10),
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(text1,
                    style: GoogleFonts.lato(
                        color: Common().appColor,
                        fontSize: isHeader ? 18 : 14,
                        fontWeight: FontWeight.w600)),
              ),
              !isHeader
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(text2,
                          style: GoogleFonts.lato(
                              color: Common().appColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w300)),
                    )
                  : Container(),
            ],
          ),
        ),
      ));
  Widget dividerWidget() => Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Divider(),
      );
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return Card(
                shadowColor: Common().appColor,
                child: Container(
                  height: 240,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textWidget("Flutter UI Challenge", "", true),
                      dividerWidget(),
                      textWidget("Theme:", "Job UI", false),
                      textWidget(
                          "Description:",
                          " #UIChallenge is a mini prototyping challenge made for the community. The main goal of this challenge is to create a working prototype, a minimum of 1 screen, on any platform that Flutter supports.",
                          false),
                      dividerWidget(),
                    ],
                  ),
                ),
              );
            }));
  }
}
