import 'dart:math';

import 'package:artemis_webapp/authentication/loginScreen.dart';
import 'package:artemis_webapp/authentication/signUpScreen.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/landing/about.dart';
import 'package:artemis_webapp/landing/callToAction.dart';
import 'package:artemis_webapp/landing/esg.dart';
import 'package:artemis_webapp/landing/faqs.dart';
import 'package:artemis_webapp/landing/features.dart';
import 'package:artemis_webapp/landing/footer.dart';
import 'package:artemis_webapp/landing/header.dart';
import 'package:artemis_webapp/landing/hero.dart';
import 'package:artemis_webapp/landing/howItWorks.dart';
import 'package:artemis_webapp/landing/howVideo.dart';
import 'package:artemis_webapp/landing/significance.dart';
import 'package:artemis_webapp/landing/vidControl.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:video_player/video_player.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  final itemKey1 = GlobalKey();
  final itemKey2 = GlobalKey();
  final itemKey3 = GlobalKey();
  final itemKey4 = GlobalKey();
  final itemKey5 = GlobalKey();
  final itemKey6 = GlobalKey();

  Future scrollToItem1() async {
    final context1 = itemKey1.currentContext!;
    await Scrollable.ensureVisible(context1);
  }

  Future scrollToItem2() async {
    final context2 = itemKey2.currentContext!;
    await Scrollable.ensureVisible(context2);
  }

  Future scrollToItem3() async {
    final context3 = itemKey3.currentContext!;
    await Scrollable.ensureVisible(context3);
  }

  Future scrollToItem4() async {
    final context4 = itemKey4.currentContext!;
    await Scrollable.ensureVisible(context4);
  }

  Future scrollToItem5() async {
    final context5 = itemKey5.currentContext!;
    await Scrollable.ensureVisible(context5);
  }

  Future scrollToItem6() async {
    final context6 = itemKey6.currentContext!;
    await Scrollable.ensureVisible(context6);
  }

  late ScrollController _controller;
  double pixels = 0.0;

  late VideoPlayerController _vidController;

  @override
  void initState() {
    super.initState();

    _controller = ScrollController();
    _controller.addListener(() {
      setState(() {
        pixels = _controller.position.pixels;
        print(_controller.position.pixels);
      });
    });
    _vidController =
        VideoPlayerController.asset('assets/video/ARTEMIS-PMI-Final.mp4');
    // _vidController =
    //     VideoPlayerController.network('https://youtu.be/CSK-ksDiB8U');

    _vidController.addListener(() {
      setState(() {});
    });
    _vidController.setLooping(false);
    _vidController.initialize().then((_) => setState(() {}));
    //_vidController.play();
  }

  @override
  void dispose() {
    _vidController.dispose();
    super.dispose();
  }

  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 100.0,
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Container(
              color: Colors.transparent,
              padding:
                  const EdgeInsets.symmetric(horizontal: 150, vertical: 30),
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () {
                            scrollToItem1();
                          },
                          child: Image.asset(
                            'assets/images/Logo3.png',
                            height: 40.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = true;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = false;
                                  selected5 = false;
                                  selected6 = false;
                                });
                                scrollToItem1();
                              },
                              child: HeaderNav(
                                selected: selected1,
                                text: 'Home',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = true;
                                  selected3 = false;
                                  selected4 = false;
                                  selected5 = false;
                                  selected6 = false;
                                });
                                scrollToItem2();
                              },
                              child: HeaderNav(
                                selected: selected2,
                                text: 'Goals',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = true;
                                  selected4 = false;
                                  selected5 = false;
                                  selected6 = false;
                                });
                                scrollToItem3();
                              },
                              child: HeaderNav(
                                selected: selected3,
                                text: 'Features',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = true;
                                  selected5 = false;
                                  selected6 = false;
                                });
                                scrollToItem4();
                              },
                              child: HeaderNav(
                                selected: selected4,
                                text: 'How It Works',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = false;
                                  selected5 = true;
                                  selected6 = false;
                                });
                                scrollToItem5();
                              },
                              child: HeaderNav(
                                selected: selected5,
                                text: 'FAQS',
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected1 = false;
                                  selected2 = false;
                                  selected3 = false;
                                  selected4 = false;
                                  selected5 = false;
                                  selected6 = true;
                                });
                                scrollToItem6();
                              },
                              child: HeaderNav(
                                selected: selected6,
                                text: 'About',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 200.0,
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
                                          duration:
                                              const Duration(milliseconds: 800),
                                          child: const SignUpScreen()));
                                },
                                child: Text('Sign Up',
                                    style: AppTextStyles.tabs1)),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Container(
                            height: 20.0,
                            width: 1.0,
                            color: AppColors.greyAccentLine,
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.fade,
                                        duration:
                                            const Duration(milliseconds: 800),
                                        child: const LoginScreen()));
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 25),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Text('Log In',
                                      style: AppTextStyles.tabs1)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ) //Header(),
            ),
        body: SafeArea(
            child: SingleChildScrollView(
          controller: _controller,
          //container for whole window
          child: Container(
            height: MediaQuery.of(context).size.height * 9.15,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: [
                //Hero
                Container(key: itemKey1, child: const HeroSection()),
                //call to action
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Stack(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedPositioned(
                          duration: const Duration(milliseconds: 500),
                          top: 0,
                          left: pixels >= 600 ? 150 : 0.0,
                          child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: pixels >= 600 ? 1.0 : 0.0,
                              child: const LeftSection())),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 500),
                        right: pixels >= 600 ? 170 : 0.0,
                        top: 40.0,
                        child: AnimatedOpacity(
                            duration: const Duration(milliseconds: 500),
                            opacity: pixels >= 600 ? 1.0 : 0.0,
                            child: const RightSection()),
                      ),
                    ],
                  ),
                ),
                //significance

                //Goals
                Container(
                  key: itemKey2,
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 170),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('GOALS',
                              style: AppTextStyles.headings1
                                  .copyWith(color: AppColors.blueAccent)),
                          Text('Set your goals',
                              style: AppTextStyles.sublanding),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                style: AppTextStyles.name
                                    .copyWith(color: AppColors.grey),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(top: 50),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height:
                                MediaQuery.of(context).size.height * 0.4 + 30,
                            child: Stack(
                              children: [
                                Positioned(
                                    bottom: 150,
                                    left: 0,
                                    child: Text('What is',
                                        style: AppTextStyles.landing)),
                                Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Text('ESG?',
                                        style: AppTextStyles.landing1)),
                              ],
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ESG(),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Question',
                                                  style: AppTextStyles.title1),
                                              Text(
                                                  'Answer to the question. Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                                  style:
                                                      AppTextStyles.subtitle2),
                                            ],
                                          )),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Question',
                                                  style: AppTextStyles.title1),
                                              Text(
                                                  'Answer to the question. Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                                  style:
                                                      AppTextStyles.subtitle2),
                                            ],
                                          )),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Question',
                                                  style: AppTextStyles.title1),
                                              Text(
                                                  'Answer to the question. Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                                  style:
                                                      AppTextStyles.subtitle2),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                //goals part 2
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50.0, horizontal: 170),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Text(
                                        'Artemis.esg supports companies to attain \nsustainability while significantly helping the environment',
                                        style: AppTextStyles.headings,
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.46,
                                      child: Text(
                                        'ESG is linked to many benefits such as lower capital constraints, analyst forecast errors, lower cost of capital and many more. Those who use ESG ratings in addition\nto financial analysis can gain a more comprehensive view\nof a company’s long-term potential.',
                                        style: AppTextStyles.title
                                            .copyWith(color: AppColors.grey),
                                        textAlign: TextAlign.end,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Stack(
                                  children: [
                                    Positioned(
                                      bottom: 250,
                                      left: 0,
                                      child: Text('Why is',
                                          style: AppTextStyles.landing),
                                    ),
                                    Positioned(
                                        bottom: 80,
                                        left: 0,
                                        child: Text('ESG',
                                            style: AppTextStyles.landing1)),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      child: Text('important?',
                                          style: AppTextStyles.landing2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Significance(),
                      ],
                    )),
                //features
                Container(
                  key: itemKey3,
                  padding: const EdgeInsets.symmetric(vertical: 50.0),
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('FEATURES',
                              style: AppTextStyles.headings1
                                  .copyWith(color: AppColors.blueAccent)),
                          Text('Here are our awesome features',
                              style: AppTextStyles.sublanding),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                style: AppTextStyles.name
                                    .copyWith(color: AppColors.grey),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Stack(
                        children: [
                          AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 80.0,
                              left: pixels >= 3100 ? 170 : 0.0,
                              child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1000),
                                  opacity: pixels >= 3100 ? 1.0 : 0.0,
                                  child: const FeaturesLeft())),
                          AnimatedAlign(
                            duration: const Duration(milliseconds: 500),
                            alignment: pixels >= 3100
                                ? Alignment.center
                                : Alignment.center,
                            child: AnimatedOpacity(
                              duration: const Duration(milliseconds: 500),
                              opacity: pixels >= 3100 ? 1.0 : 0.0,
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.29,
                                  child: Image.asset(
                                      'assets/images/mockups/assessment.png')),
                            ),
                          ),
                          AnimatedPositioned(
                              duration: const Duration(milliseconds: 500),
                              top: 80.0,
                              right: pixels >= 3100 ? 170 : 0.0,
                              child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 1000),
                                  opacity: pixels >= 3100 ? 1.0 : 0.0,
                                  child: const FeaturesRight())),
                        ],
                      ),
                    ],
                  ),
                ),
                //how it works
                Container(
                  key: itemKey4,
                  padding:
                      const EdgeInsets.only(left: 170.0, right: 170, top: 50.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('HOW IT WORKS',
                              style: AppTextStyles.headings1
                                  .copyWith(color: AppColors.blueAccent)),
                          Text('This is the heading for the section',
                              style: AppTextStyles.sublanding),
                          const SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(child: HowItWorksLeft()),
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.4,
                                child: Image.asset(
                                  'assets/images/iotLeft2.png',
                                ),
                              ),
                              Positioned(
                                bottom: 70,
                                right: 70,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.095,
                                  height: 100,
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        top: pixels >= 4200 ? 0.0 : 100.0,
                                        child: AnimatedOpacity(
                                          duration:
                                              const Duration(milliseconds: 500),
                                          opacity: pixels >= 4200 ? 1.0 : 0.0,
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0,
                                            ),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.095,
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: AppColors.grey
                                                          .withOpacity(0.2),
                                                      blurRadius: 20.0,
                                                      spreadRadius: 5.0)
                                                ]),
                                            child: Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/assistance.png',
                                                  width: 30,
                                                ),
                                                const SizedBox(
                                                  width: 15.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 15.0),
                                                  child: Text(
                                                      'IoT EDGE Enabled',
                                                      style:
                                                          AppTextStyles.body2),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(child: HowItWorksRight()),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 170.0, vertical: 50.0),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //videos part
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        height: MediaQuery.of(context).size.height - 200,
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: 200,
                              right: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.45,
                                decoration: BoxDecoration(
                                    color: AppColors.greyAccentLine,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.grey.withOpacity(0.2),
                                          blurRadius: 20.0,
                                          spreadRadius: 5.0)
                                    ]),
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.48,
                                height:
                                    MediaQuery.of(context).size.height * 0.5405,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              AppColors.grey.withOpacity(0.2),
                                          blurRadius: 20.0,
                                          spreadRadius: 5.0)
                                    ]),
                                child: _vidController.value.isInitialized
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.48,
                                        child: Stack(
                                          children: [
                                            ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                child: VideoPlayer(
                                                    _vidController)),
                                            BasicOverlayWidget(
                                              controller: _vidController,
                                            ),
                                          ],
                                        ))
                                    : Center(
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.blueAccent),
                                        ),
                                      ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.greyAccentLine,
                                            width: 1.0),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.greyAccentLine,
                                            width: 1.0),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.17,
                                      decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(20),
                                        border: Border.all(
                                            color: AppColors.greyAccentLine,
                                            width: 1.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //text part
                      const HowVideo(),
                    ],
                  ),
                ),
                //faqs

                Container(
                  key: itemKey5,
                  padding: const EdgeInsets.symmetric(
                      vertical: 50.0, horizontal: 170),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Text('FAQS',
                              style: AppTextStyles.headings1
                                  .copyWith(color: AppColors.blueAccent)),
                          Text('Frequently Asked Questions',
                              style: AppTextStyles.sublanding),
                          const SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. Lorem ipsum dolor sit amet, consectetur.Lorem ipsum dolor sit amet, consectetur. ',
                                style: AppTextStyles.name
                                    .copyWith(color: AppColors.grey),
                                textAlign: TextAlign.center),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 50.0,
                      ),
                      FAQS(),
                      const SizedBox(
                        height: 50.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: AppColors.blueAccent,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.contact_support_outlined,
                                  color: Colors.white,
                                  size: 15,
                                ),
                              ),
                              SizedBox(
                                width: 30.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Still have questions?',
                                      style: AppTextStyles.title1),
                                  Text(
                                      "Can't find the answer you're looking for? Please contact our friendly team.",
                                      style: AppTextStyles.subtitle2),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // //about
                // Container(
                //   key: itemKey6,
                //   padding: const EdgeInsets.symmetric(
                //       vertical: 50.0, horizontal: 170),
                //   width: MediaQuery.of(context).size.width,
                //   height: MediaQuery.of(context).size.height - 100,
                //   color: Colors.orange,
                //   child: About(),
                // ),
                // //Footer
                // FooterSection(),
              ],
            ),
          ),
        )));
  }
}
