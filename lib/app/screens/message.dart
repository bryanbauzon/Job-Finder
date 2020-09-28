import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/common/widgets.dart';
import 'package:job_ui/app/screens/chat.dart';
import 'package:page_transition/page_transition.dart';

class Message extends StatefulWidget {
  final String tag;
  final Widget child;
  final int prevScreen;

  Message(
      {Key key,
      @required this.tag,
      @required this.child,
      @required this.prevScreen});
  @override
  _MessageState createState() => _MessageState();
}

class _MessageState extends State<Message> {
  Widget message(String sender, String message, String imagePath, String time,
          bool isActive) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: Chat(
                    recipient: sender,
                    lastChat: message,
                    recipientImg: imagePath,
                    isActive: isActive,
                  ),
                  type: PageTransitionType.fade));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Hero(
                              tag: sender,
                              child: Image.asset(
                                imagePath,
                                height: 50,
                                width: 50,
                              ),
                            )),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 250,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(sender,
                                      style: GoogleFonts.lato(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Common().matteBlack)),
                                )),
                            Container(
                                width: 250,
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(message,
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: Common().matteBlack)),
                                )),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(
                              color: !isActive ? Colors.grey : Colors.green,
                              borderRadius: BorderRadius.circular(50)),
                        ),
                        Text(time,
                            style: GoogleFonts.lato(
                                fontSize: 14, color: Common().gray))
                      ],
                    )
                  ],
                ),
              )),
        ),
      );
  Widget messageList() => Expanded(
        child: ListView(
          children: [
            message("Bill Gates", "How are you?", Common().bill, "", true),
            message("Lincoln Velazquez", "Kamusta?", Common().cong, "", false),
            message(
                "Mark Zuckerberg", "Good to see you.", Common().mark, "", true),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Widgets()
                  .appBar(context, "message", widget.prevScreen, null, null),
              messageList()
            ],
          ),
        )),
        onWillPop: () async => false);
  }
}
