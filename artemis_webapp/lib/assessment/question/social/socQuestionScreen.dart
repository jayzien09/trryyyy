import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/assessment/assessmentScreen.dart';
import 'package:artemis_webapp/assessment/question/questions.dart';
import 'package:artemis_webapp/assessment/question/social/socHeader.dart';
import 'package:artemis_webapp/assessment/scores.dart';
import 'package:artemis_webapp/assessment/success%20page/socSuccess.dart';
import 'package:artemis_webapp/auth_methods/authMethods.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/dashboard/dashboardDetails.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/navigation/assessment/navBarAssessment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class SocialAssess extends StatefulWidget {
  const SocialAssess({super.key});

  @override
  State<SocialAssess> createState() => _SocialAssessState();
}

class _SocialAssessState extends State<SocialAssess> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  late PageController _controller;
  bool btnPressed = false;
  bool answered = false;
  int questionNumber = 1;
  //double score = 0;
  String btnText = "Next Question";
  //date now
  DateTime timeNow = DateTime.now();
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  void updateScore() async {
    await AuthMethods().updateSocScore(
      esgScore: esgAssessScore,
      socScore: socAssessScore,
      lastAssessDateSoc: formattedDate,
      isAssessedSoc: true,
      descriptiveScore: descriptiveScore,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    print('Formatted Date: $timeNow');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      drawer: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: const [
            SizedBox(
              width: 260,
              child: NavBarAssessment(),
            ),
          ],
        ),
      ),
      appBar: !Responsive.isDesktop(context)
          ? AppBar(
              elevation: 0,
              backgroundColor: AppColors.white,
              leading: IconButton(
                  onPressed: () {
                    _drawerKey.currentState!.openDrawer();
                  },
                  icon: const Icon(Icons.menu, color: AppColors.black)),
              actions: const [
                AppBarActionItems(),
              ],
            )
          : const PreferredSize(
              preferredSize: Size.zero,
              child: SizedBox(),
            ),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
              const Flexible(
                flex: 2,
                child: NavBarAssessment(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SocialHeader(),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.fade,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            child: const AssessmentScreen()));
                                    setState(() {
                                      socAssessScore = 0;

                                      value = 0;
                                    });
                                  },
                                  child: Row(
                                    children: const [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        size: 15,
                                        color: AppColors.black,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text(
                                'Your Assessment',
                                style: AppTextStyles.tabs
                                    .copyWith(color: AppColors.black),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '$questionNumber of ${questionsSoc.length}',
                                style: AppTextStyles.tabs,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          StepProgressIndicator(
                            size: 5,
                            padding: 5,
                            totalSteps: questionsSoc.length,
                            currentStep: questionNumber,
                            selectedColor: AppColors.blueAccent,
                            unselectedColor: AppColors.greyAccent,
                            roundedEdges: Radius.circular(30),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text('Assess the social management of the company',
                              style: AppTextStyles.tabs),
                          SizedBox(
                            height: 80,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: PageView.builder(
                              controller: _controller,
                              onPageChanged: (page) {
                                if (page == questionsSoc.length - 1) {
                                  setState(() {
                                    btnText = "Submit";
                                  });
                                } else {
                                  setState(() {
                                    btnText = "Next Question";
                                  });
                                }
                                setState(() {
                                  answered = false;
                                });
                              },
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 200.0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Category: ${questionsSoc[index].category}",
                                            style: AppTextStyles.subHeadings
                                                .copyWith(
                                              color: AppColors.blueAccent,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(questionsSoc[index].question,
                                              style: AppTextStyles.headings),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: questionsSoc[index].options,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: EdgeInsets.only(bottom: 10),
                                          height: 50,
                                          width: 250,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                onPressed: () {
                                                  _controller.previousPage(
                                                      duration: Duration(
                                                          milliseconds: 250),
                                                      curve: Curves.easeInExpo);

                                                  setState(() {
                                                    btnPressed = false;
                                                    if (questionNumber > 1) {
                                                      questionNumber--;
                                                      socAssessScore =
                                                          socAssessScore -
                                                              value;

                                                      print(
                                                          "SOC SCORE: $socAssessScore");
                                                    }
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.arrow_back_ios,
                                                  color: AppColors.grey,
                                                  size: 15,
                                                ),
                                              ),
                                              Text("Previous Question",
                                                  style: AppTextStyles.tabs),
                                            ],
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              socAssessScore =
                                                  socAssessScore + value;

                                              print(
                                                  "SUM SOC SCORE: $socAssessScore");
                                            });
                                            if (_controller.page?.toInt() ==
                                                questionsSoc.length - 1) {
                                              setState(() {
                                                socAssessScore =
                                                    socAssessScore /
                                                        questionsSoc.length;
                                                socScore = socAssessScore;
                                                esgAssessScore = (envScore +
                                                        socScore +
                                                        govScore) /
                                                    3;
                                                if (esgAssessScore >= 0 &&
                                                    esgAssessScore <= 25) {
                                                  descriptiveScore = "Poor";
                                                } else if (esgAssessScore >
                                                        25 &&
                                                    esgAssessScore <= 50) {
                                                  descriptiveScore =
                                                      "Satisfactory";
                                                } else if (esgAssessScore >
                                                        50 &&
                                                    esgAssessScore <= 75) {
                                                  descriptiveScore = "Good";
                                                } else if (esgAssessScore >
                                                    75) {
                                                  descriptiveScore =
                                                      "Excellent";
                                                }
                                              });
                                              print("ENV SCORE: $envScore");
                                              print("SOC SCORE: $socScore");
                                              print("GOV SCORE: $govScore");
                                              print(
                                                  "ESG SCORE: $esgAssessScore");
                                              updateScore();
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      SocialSuccess(),
                                                ),
                                              );
                                            } else {
                                              _controller.nextPage(
                                                  duration: Duration(
                                                      milliseconds: 250),
                                                  curve: Curves.easeInExpo);

                                              setState(() {
                                                btnPressed = false;
                                                questionNumber++;
                                              });
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            primary: AppColors.blueAccent,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 10),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              children: [
                                                Text(btnText,
                                                    style: AppTextStyles.tabs
                                                        .copyWith(
                                                            color: AppColors
                                                                .white)),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: AppColors.white,
                                                  size: 15,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
                              itemCount: questionsSoc.length,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (Responsive.isDesktop(context))
              Expanded(
                flex: 4,
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(8, 114, 114, 114),
                          blurRadius: 25,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        children: const [
                          AppBarActionItems(),
                          SizedBox(height: 15),
                          //CalendarSection(),
                          DashboardDetails()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
