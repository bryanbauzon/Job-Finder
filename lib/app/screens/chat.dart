import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/common/widgets.dart';
import 'package:job_ui/app/util/utils.dart';

class Chat extends StatefulWidget {
  final String recipient;
  final String lastChat;
  final String recipientImg;
  final bool isActive;
  Chat(
      {Key key,
      @required this.recipient,
      @required this.lastChat,
      @required this.recipientImg,
      @required this.isActive});
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  String r = "";

  @override
  void initState() {
    super.initState();

    if (Utils().stringEqual(widget.recipient, "Lincoln Velazquez")) {
      r = "Cong";
    } else if (Utils().stringEqual(widget.recipient, "Mark Zuckerberg")) {
      r = "Mark";
    } else if (Utils().stringEqual(widget.recipient, "Bill Gates")) {
      r = "Bill";
    }
  }

  Widget chats(bool isRecipient, String message, String time) => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                isRecipient
                    ? Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              widget.recipientImg,
                              height: 30,
                              width: 30,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 90,
                                child: Bubble(
                                  color: Common().appColor,
                                  margin: BubbleEdges.only(top: 10),
                                  elevation: 2,
                                  alignment: isRecipient
                                      ? Alignment.topLeft
                                      : Alignment.topRight,
                                  nip: isRecipient
                                      ? BubbleNip.leftTop
                                      : BubbleNip.rightTop,
                                  child: Text(message,
                                      style: GoogleFonts.lato(
                                          color: Common().white)),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(time,
                                    style: GoogleFonts.lato(
                                        color: Common().appColor,
                                        fontSize: 12)),
                              )
                            ],
                          )
                        ],
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width - 90,
                        child: Bubble(
                          margin: BubbleEdges.only(top: 10),
                          elevation: 2,
                          alignment: isRecipient
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          nip: isRecipient
                              ? BubbleNip.leftTop
                              : BubbleNip.rightTop,
                          child: Text(message,
                              style:
                                  GoogleFonts.lato(color: Common().appColor)),
                        ),
                      )
              ],
            )),
      );
  Widget status(bool isActive) => Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Container(
              height: 10,
              width: 10,
              decoration: BoxDecoration(
                  color: isActive ? Colors.green : Colors.grey,
                  borderRadius: BorderRadius.circular(50)),
            ),
            SizedBox(
              width: 10,
            ),
            Text(isActive ? "Active now" : "Active 1 minute ago")
          ],
        ),
      );
  Widget divider() => Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Divider(),
      );
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            body: SafeArea(
          child: Column(
            children: [
              Widgets().appBar(
                  context, "chat", 0, widget.recipient, widget.recipientImg),
              Expanded(
                  child: Container(
                child: ListView(
                  children: [
                    status(widget.isActive),
                    divider(),
                    chats(true, "Hello Max!", "9:30 am"),
                    chats(false, "Hey " + r + "!", "10:00 am"),
                    // chats(false, "How are you?", "10:12 am"),
                    chats(true, widget.lastChat, "10:13 am"),
                  ],
                ),
              )),
              Container(
                height: 70,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 290,
                        child: TextField(
                          cursorColor: Common().appColor,
                          keyboardType: TextInputType.multiline,
                          style: GoogleFonts.lato(),
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.attach_file,
                                color: Common().appColor,
                              ),
                              onPressed: () {},
                            ),
                            hintText: Common().sendMessage,
                            hintStyle: TextStyle(color: Common().appColor),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 0.1, color: Common().appColor),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: Common().appColor),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {},
                          child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Common().appColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: Transform.rotate(
                                angle: 5.8,
                                child: Icon(
                                  Icons.send,
                                  color: Common().white,
                                ),
                              )))
                    ],
                  ),
                ),
              )
            ],
          ),
        )),
        onWillPop: () async => false);
  }
}
