import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/common/widgets.dart';
import 'package:job_ui/app/screens/explore.dart';
import 'package:job_ui/app/screens/bookmarks.dart';
import 'package:job_ui/app/screens/message.dart';
import 'package:job_ui/app/screens/settings.dart';
import 'package:job_ui/app/screens/work.dart';
import 'package:job_ui/app/util/utils.dart';
import 'package:page_transition/page_transition.dart';

class Home extends StatefulWidget {
  final String title;
  final int initialIndex;

  Home({Key key, @required this.title, @required this.initialIndex});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _bottomIndex = 0;
  String currentScreen = "";
  bool isPrevbookmark = false;

  List<Widget> _currentWidget = [Work(), Explore(), Bookmarks(), Settings()];

  @override
  void initState() {
    super.initState();
    _bottomIndex = widget.initialIndex;
    if (Utils().intEqual(widget.initialIndex, 0)) {
      currentScreen = "home";
    } else if (Utils().intEqual(widget.initialIndex, 1)) {
      currentScreen = "explore";
    } else if (Utils().intEqual(widget.initialIndex, 2)) {
      currentScreen = "bookmark";
    } else if (Utils().intEqual(widget.initialIndex, 3)) {
      currentScreen = "settings";
    }
  }

  void _onTapIcon(int index) {
    setState(() {
      _bottomIndex = index;
    });
  }

  Widget searchAndControler(BuildContext context) => Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 90,
                child: TextField(
                  cursorColor: Common().appColor,
                  style: GoogleFonts.lato(),
                  decoration: InputDecoration(
                    labelText: Common().searchJob,
                    labelStyle: TextStyle(color: Common().appColor),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Common().appColor,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(width: 0.1, color: Common().appColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide:
                          BorderSide(width: 1, color: Common().appColor),
                    ),
                  ),
                )),
            IconButton(
              icon: Icon(Icons.tune, color: Common().matteBlack),
              onPressed: () {},
            )
          ],
        ),
      );
  Widget bottomNav(IconData icon, int index, String screen) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 3,
          width: 25,
          decoration: BoxDecoration(
              color:
                  (index == _bottomIndex) ? Common().appColor : Common().white,
              borderRadius: BorderRadius.circular(30)),
        ),
        (index == 4)
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          child: Message(
                              tag: "messages",
                              child: messageWidget(),
                              prevScreen: _bottomIndex),
                          type: PageTransitionType.fade));
                },
                child: Badge(
                    animationType: BadgeAnimationType.scale,
                    badgeContent: Text("3",
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            color: Common().white)),
                    child: Hero(
                        tag: "messages",
                        child: Icon(
                          Icons.message,
                          color: Color(0XFF7a7a7a),
                        ))),
              )
            : IconButton(
                icon: Icon(icon, color:(index == _bottomIndex)? Common().appColor:Color(0XFF7a7a7a)),
                onPressed: () {
                  setState(() {
                    currentScreen = screen;
                  });

                  _onTapIcon(index);
                },
              )
      ],
    );
  }

  Widget messageWidget() => Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          color: Common().appColor, borderRadius: BorderRadius.circular(50)),
      child: Hero(
          tag: "messages",
          child: Icon(
            Icons.message,
            color: Common().white,
          )));
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                Widgets()
                    .appBar(context, currentScreen, _bottomIndex, null, null),
                Expanded(
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: _currentWidget.elementAt(_bottomIndex),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Container(
              height: 70,
              decoration: BoxDecoration(color: Common().white),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bottomNav((_bottomIndex == 0) ? Icons.work : Icons.home, 0,
                        "home"),
                    bottomNav(Icons.explore, 1, "explore"),
                    bottomNav(
                        (_bottomIndex == 2)
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        2,
                        "bookmark"),
                    bottomNav(Icons.message, 4, "message"),
                    bottomNav(Icons.settings, 3, "settings"),
                  ],
                ),
              )),
        ),
        onWillPop: () async => false);
  }
}
