import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/common/widgets.dart';
import 'package:job_ui/app/screens/home.dart';
import 'package:page_transition/page_transition.dart';

class Job extends StatefulWidget {
  final String position;
  final String company;
  final String location;
  final bool isBookmark;

  Job(
      {Key key,
      @required this.position,
      @required this.company,
      @required this.location,
      @required this.isBookmark});
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  bool isApply = false;
  bool isFavorite = false;
  bool isBookmarked = false;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmark;
  }

  void fnApply() {
    if (isApply) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.push(
            context,
            PageTransition(
                child: Home(
                  title: Common().appName,
                  initialIndex: 0,
                ),
                type: PageTransitionType.fade));
      });
    }
  }

  Widget textWidget(String text1, String text2) => Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Text(text1,
                    style: GoogleFonts.lato(color: Common().appColor, fontWeight: FontWeight.w600)),
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
  Widget socials(String social) => Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Container(
          decoration: BoxDecoration(
              color: Common().appColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
            child: Text(social, style: GoogleFonts.lato(color: Common().white)),
          ),
        ),
      );
  @override
  Widget build(BuildContext context) {
    fnApply();
    return WillPopScope(
        child: Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Widgets().appBar(context, "job", 0, widget.company, null),
              Stack(
                children: [
                  Container(
                    height: 130,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(Common().jobbg),
                            fit: BoxFit.fitWidth)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 10, left: 20),
                child: Container(
                    height: 45,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.share, color: Common().appColor),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (_) => Container(
                                      height: 80,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          socials("Facebook"),
                                          socials("Gmail")
                                        ],
                                      ),
                                    ));
                          },
                        ),
                        IconButton(
                          icon: Icon(
                              (!isBookmarked)
                                  ? Icons.bookmark_border
                                  : Icons.bookmark,
                              color: Common().appColor),
                          onPressed: () {
                            setState(() {
                              isBookmarked = !(isBookmarked);
                            });
                          },
                        ),
                        Pulse(
                          child: IconButton(
                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              setState(() {
                                isFavorite = !(isFavorite);
                              });
                            },
                          ),
                        ),
                      ],
                    )),
              ),
               Divider(),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 10, 0),
                  child: Container(
                    child: Column(
                      children: [
                        textWidget("Position: ", widget.position),
                        textWidget("Salary: ", "PHP 22-40K"),
                        textWidget("Company: ", widget.company),
                        textWidget("Location: ", widget.location),
                        SizedBox(
                          height: 10,
                        ),
                        textWidget("Description: ", Common().description),
                       
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () {
                              if (!isApply) {
                                setState(() {
                                  isApply = true;
                                });
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Common().appColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: !isApply
                                    ? Text("Apply Now",
                                        style: GoogleFonts.lato(
                                            color: Common().white))
                                    : Container(
                                        height: 15,
                                        width: 15,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          valueColor:
                                              new AlwaysStoppedAnimation<Color>(
                                                  Common().white),
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )),
            ],
          ),
        )),
        onWillPop: () async => false);
  }
}
