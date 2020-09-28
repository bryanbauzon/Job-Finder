import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/screens/home.dart';
import 'package:job_ui/app/screens/profile.dart';
import 'package:page_transition/page_transition.dart';
import 'package:job_ui/app/util/utils.dart';

class Widgets {
  Widgets();
  Widget appBar(BuildContext context, String screen, int prevScreen,
          String company, String recipientImg) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(
                      (Utils().stringEqual(screen, "message") ||
                              Utils().stringEqual(screen, "job") ||
                              Utils().stringEqual(screen, "chat") ||
                              Utils().stringEqual(screen, "profile"))
                          ? Icons.arrow_back
                          : Icons.short_text,
                      color: Common().appColor,
                    ),
                    onPressed: () {
                      if (Utils().stringEqual(screen, "message") ||
                          Utils().stringEqual(screen, "profile")) {
                             
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Home(
                                  title: Common().appName,
                                  initialIndex: prevScreen,
                                ),
                                type: PageTransitionType.fade));
                      } else if (Utils().stringEqual(screen, "chat")) {
                        Navigator.pop(context);
                      } else if (Utils().stringEqual(screen, "job")) {
                      
                        Navigator.push(
                            context,
                            PageTransition(
                                child: Home(
                                  title: Common().appName,
                                  initialIndex: 0,
                                ),
                                type: PageTransitionType.fade));
                      }
                    },
                  ),
                  Text(
                      (Utils().stringEqual(screen, "home"))
                          ? Common().appName
                          : (Utils().stringEqual(screen, "message"))
                              ? Common().messages
                              : (Utils().stringEqual(screen, "job"))
                                  ? company
                                  : (Utils().stringEqual(screen, "chat"))
                                      ? company
                                      : (Utils().stringEqual(screen, "explore"))?"Explore":
                                      (Utils().stringEqual(screen, "bookmark"))?"Bookmarks":
                                      (Utils().stringEqual(screen, "settings") )?"Settings":(Utils().stringEqual(screen, "profile"))?"Profile":screen,
                      style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Common().matteBlack)),
                  (!Utils().stringEqual(screen, "message"))
                      ? (Utils().stringEqual(screen, "chat"))
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Hero(
                                tag: company,
                                child: Image.asset(
                                  recipientImg,
                                  height: 40,
                                  width: 40,
                                ),
                              ))
                          : (Utils().stringEqual(screen, "job"))
                              ? Container(
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      color: Common().appColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Transform.rotate(
                                    angle: 5.8,
                                    child: Icon(
                                      Icons.send,
                                      color: Common().white,
                                    ),
                                  ))
                              : InkWell(
                                  onTap: () {
                                    if (!Utils()
                                        .stringEqual(screen, "profile")) {
                                      Navigator.push(
                                          context,
                                          PageTransition(
                                              child: Profile(
                                                prevScreen: prevScreen,
                                              ),
                                              type: PageTransitionType.fade));
                                    }
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: Image.asset(
                                      Common().image,
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                )
                      : Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Common().appColor,
                              borderRadius: BorderRadius.circular(50)),
                          child: Hero(
                            tag: "messages",
                            child: Icon(
                              Icons.message,
                              color: Common().white,
                            ),
                          )),
                ],
              ),
            )),
      );
}
