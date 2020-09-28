import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/screens/job.dart';
import 'package:page_transition/page_transition.dart';

class Bookmarks extends StatefulWidget {
  @override
  _BookmarksState createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    Widget bookmarked(String position, String company, String location) =>
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    child: Job(
                      position: position,
                      company: company,
                      location: location,
                      isBookmark: true,
                    ),
                    type: PageTransitionType.fade));
          },
          child: Card(
            shadowColor: Common().appColor,
            child: Container(
                height: 180,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    children: [
                      Image.asset(
                        Common().ipsum3,
                        width: 120,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 190,
                            child: Text(position,
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    color: Common().appColor)),
                          ),
                          Container(
                            width: 190,
                            child: Text(company,
                                style: GoogleFonts.lato(
                                    fontSize: 18, color: Common().matteBlack)),
                          ),
                          Container(
                            width: 190,
                            child: Text(location,
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Common().matteBlack)),
                          ),
                          Divider(),
                          Container(
                              width: 220,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.access_time,
                                          color: Common().appColor),
                                      Text("20 minutes ago",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              color: Common().appColor))
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.work,
                                        color: Common().appColor,
                                      ),
                                      Text("Full-time",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              color: Common().appColor))
                                    ],
                                  ),
                                  Icon(Icons.bookmark, color: Common().appColor)
                                ],
                              ))
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        );
    return Container(
        child: ListView(
      children: [
        bookmarked("Flutter Developer", "IT Company", "Singapore"),
        bookmarked("Backend Developer", "IT Company", "Quezon City, PH")
      ],
    ));
  }
}
