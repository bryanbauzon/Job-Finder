import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:job_ui/app/common/common.dart';
import 'package:job_ui/app/screens/job.dart';
import 'package:page_transition/page_transition.dart';

class Work extends StatefulWidget {
  @override
  _WorkState createState() => _WorkState();
}

class _WorkState extends State<Work> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
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
                    hintText: Common().searchJob,
                    hintStyle: GoogleFonts.lato(color: Common().appColor),
                    suffixIcon: Icon(
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
                          BorderSide(width: 0.5, color: Common().appColor),
                    ),
                   
                  ),
                )),
            IconButton(
              icon: Icon(Icons.tune, color: Common().appColor),
              onPressed: () {},
            )
          ],
        ),
      );
  Widget greetings() => Padding(
      padding: const EdgeInsets.only(left: 20, bottom: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Column(
                children: [
                  Container(
                    width: 170,
                    child: Text(Common().greetings,
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Common().matteBlack)),
                  ),
                  Container(
                    width: 170,
                    child: Text(Common().findPerfectJob,
                        style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Common().appColor)),
                  )
                ],
              )),
        ],
      ));
  Widget category(int index, String title) => Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            _currentIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: 70,
          decoration: BoxDecoration(
              color:
                  (_currentIndex != index) ? Common().white : Common().appColor,
              border: Border.all(color: Common().appColor, width: 0.5),
              borderRadius: BorderRadius.circular(30)),
          child: Center(
            child: Text(title,
                style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: (_currentIndex != index)
                        ? Common().appColor
                        : Common().white)),
          ),
        ),
      ));
  Widget jobCategories(BuildContext context) => Padding(
      padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(Common().jobCategories,
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Common().appColor)),
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom:10),
            child: Container(
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                category(0, Common().all),
                category(1, Common().design),
                category(2, Common().software),
                category(3, Common().business),
                category(4, Common().realState),
              ],
            ),
          ),
          ),
        ],
      ));
  Widget job(BuildContext context, String position, String tag, String company,
          String location, String image) =>
      InkWell(
        onTap: () {
          Navigator.push(
              context,
              PageTransition(
                  child: Job(
                    position: position,
                    company: company,
                    location: location,
                    isBookmark: false,
                  ),
                  type: PageTransitionType.fade));
        },
        child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Card(
              shadowColor: Common().appColor,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 140,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Hero(
                      tag: tag,
                      child: Image.asset(
                        image,
                        width: 120,
                      ),
                    ),
                    Spacer(),
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
                            width: 190,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                )
                              ],
                            ))
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            )),
      );
  Widget recommendedJob(
          String position, String company, String location, String image) =>
      Padding(
          padding: const EdgeInsets.only(left: 5),
          child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: Job(
                          position: position,
                          company: company,
                          location: location,
                          isBookmark: false,
                        ),
                        type: PageTransitionType.fade));
              },
              child: Card(
                shadowColor: Common().appColor,
                child: Container(
                  width: 280,
                  height: 260,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Hero(
                          tag: company,
                          child: Image.asset(
                            image,
                            height: 120,
                          ),
                        ),
                      ),
                      Text(
                        position,
                        style: GoogleFonts.lato(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                            color: Common().appColor),
                      ),
                      Text(
                        company,
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Common().appColor),
                      ),
                      Text(
                        location,
                        style: GoogleFonts.lato(
                            fontSize: 18, color: Common().appColor),
                      ),
                      Divider(),
                      Container(
                        width: 250,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time,
                                    color: Common().appColor),
                                Text("20 minutes ago",
                                    style: GoogleFonts.lato(
                                        fontSize: 16, color: Common().appColor))
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
                                        fontSize: 16, color: Common().appColor))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )));
  Widget recommendedJobList() => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                    width: 150,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Text(Common().recommendedJobs,
                          style: GoogleFonts.lato(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Common().appColor)),
                    ))),
          ),
          Container(
              height: 260,
              //  decoration: BoxDecoration(color: Common().appColor),
              child: Padding(
                padding: const EdgeInsets.only(left: 5, right: 5),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    recommendedJob(
                      "Flutter Developer",
                      "IT Company",
                      "Singapore",
                      Common().ipsum2,
                    ),
                    recommendedJob(
                      "Full-stack Developer",
                      "IT Company",
                      "Ortigas Center, Pasig",
                      Common().ipsum3,
                    ),
                    recommendedJob("React Developer", "IT Company",
                        "Quezon City, PH", Common().ipsum),
                    recommendedJob("Business Analyst", "IT Company",
                        "Quezon City, PH", Common().ipsum2),
                    recommendedJob(
                        "SQL Developer",
                        "Simplexinternet Philippines, Inc.",
                        "National Capital Region",
                        Common().ipsum3),
                    recommendedJob(
                        "QA Tester",
                        "IT Company",
                        "National Capital Region",
                        Common().ipsum2),
                    recommendedJob("AppHosting Azure", "IT Company",
                        "National Capital Region", Common().ipsum2)
                  ],
                ),
              )),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        greetings(),
        searchAndControler(context),
          jobCategories(context),
        Expanded(
            child: Container(
                child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            addSemanticIndexes: true,
            shrinkWrap: true,
            children: [
              recommendedJobList(),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                        width: 150,
                        child: Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(Common().recentJobs,
                              style: GoogleFonts.lato(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Common().appColor)),
                        ))),
              ),
              job(context, "Mobile Developer", "0", "IT Company", "Quezon City, PH",
                  Common().ipsum),
              job(context, "Real Time Analyst", "1", "IT Company",
                  "Quezon City, PH", Common().ipsum3),
              job(
                  context,
                  "Java EE Developer",
                  "2",
                  "IT Company",
                  "Quezon City, PH",
                  Common().ipsum2),
              job(context, "UI/UX Developer", "3", "IT Company", "Quezon City, PH",
                  Common().ipsum),
              job(context, "AWS Administrator", "4", "IT Company",
                  "National Capital Region", Common().ipsum3),
                  job(context, "Administrator", "5", "IT Company",
                  "National Capital Region", Common().ipsum), 
                     job(context, "Real Time Analyst", "6", "IT Company",
                  "Quezon City, PH", Common().ipsum3),
                       job(context, "Real Time Analyst", "7", "IT Company",
                  "Quezon City, PH", Common().ipsum2),
            ],
          ),
        )))
      ],
    );
  }
}
