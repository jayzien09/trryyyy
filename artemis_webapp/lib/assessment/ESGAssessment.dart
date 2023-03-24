import 'package:artemis_webapp/assessment/infoCard.dart';
import 'package:artemis_webapp/assessment/question/environmental/envQuestionScreen.dart';
import 'package:artemis_webapp/assessment/question/governance/govQuestionScreen.dart';
import 'package:artemis_webapp/assessment/question/questions.dart';
import 'package:artemis_webapp/assessment/scores.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ESGAssessment extends StatefulWidget {
  const ESGAssessment({super.key});

  @override
  State<ESGAssessment> createState() => _ESGAssessmentState();
}

class _ESGAssessmentState extends State<ESGAssessment> {
  Color _colorContainer1 = AppColors.white;
  Color _colorContainer2 = AppColors.white;
  Color _colorContainer3 = AppColors.white;
  Color _fontColor1 = AppColors.black;
  Color _fontColor2 = AppColors.black;
  Color _fontColor3 = AppColors.black;
  Border _border1 = Border.all(color: AppColors.greyAccentLine);
  Border _border2 = Border.all(color: AppColors.greyAccentLine);
  Border _border3 = Border.all(color: AppColors.greyAccentLine);
  Color pressedfontColor = AppColors.blueAccent;
  Color unpressedfontColor = AppColors.black;
  Color disablefontColor = AppColors.grey;
  Border unpressedBorder = Border.all(color: AppColors.greyAccentLine);
  Border pressedBorder = Border.all(color: Colors.transparent);
  EnvironmentalAssess _navigator1 = EnvironmentalAssess();
  GovernanceAssess _navigator2 = GovernanceAssess();

  BoxShadow _shadow1 = const BoxShadow(
    color: Colors.transparent,
    blurRadius: 15,
    offset: Offset(0, 5),
  );
  BoxShadow pressedShadow = const BoxShadow(
    color: Color.fromARGB(31, 49, 49, 49),
    blurRadius: 15,
    offset: Offset(0, 5),
  );
  BoxShadow unpressedShadow = const BoxShadow(
    color: Colors.transparent,
  );

  BoxShadow _shadow2 = const BoxShadow(
    color: Colors.transparent,
    blurRadius: 15,
    offset: Offset(0, 5),
  );
  BoxShadow _shadow3 = const BoxShadow(
    color: Colors.transparent,
    blurRadius: 15,
    offset: Offset(0, 5),
  );
  bool _visible1 = false;
  bool _visible2 = false;
  bool _visible3 = false;

  bool _visible = false;

  Icon _icon1 = const Icon(
    Icons.eco_rounded,
    color: AppColors.greyAccentLine,
  );
  Icon _icon2 = const Icon(
    Icons.groups_rounded,
    color: AppColors.greyAccentLine,
  );
  Icon _icon3 = const Icon(
    Icons.account_balance_rounded,
    color: AppColors.greyAccentLine,
  );

  bool _btnPressed1 = false;
  bool _btnPressed2 = false;
  bool _btnPressed3 = false;
  String formatDateEnv = '';
  String formatDateSoc = '';
  String formatDateGov = '';

  Future<void> getAssessmentData() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      lastAssessmentDateEnvDB = companyData['lastAssessDateEnv'];
      isAssessedEnvDB = companyData['isAssessedEnv'];
      lastAssessmentDateSocDB = companyData['lastAssessDateSoc'];
      isAssessedSocDB = companyData['isAssessedSoc'];
      lastAssessmentDateGovDB = companyData['lastAssessDateGov'];
      isAssessedGovDB = companyData['isAssessedGov'];

      //format string date
      DateTime parseDateEnv =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateEnvDB);
      formatDateEnv = DateFormat("yMMMM").format(parseDateEnv);

      DateTime parseDateSoc =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateSocDB);
      formatDateSoc = DateFormat("yMMMM").format(parseDateSoc);
      lastAssessDateEnv = formatDateEnv;
      lastAssessDateSoc = formatDateSoc;
      lastAssessDateGov = formatDateGov;

      DateTime parseDateGov =
          DateFormat("yyyy-MM-dd").parse(lastAssessmentDateGovDB);
      formatDateGov = DateFormat("yMMMM").format(parseDateGov);

      lastAssessDateEnv = formatDateEnv;
      lastAssessDateSoc = formatDateSoc;
      lastAssessDateGov = formatDateGov;
    });
    print("========================================");
    print('last Assessment Date ENV DB: $lastAssessmentDateEnvDB');
    print('isAssessedEnvDB: $isAssessedEnvDB\n');
    print('last Assessment Date SOC DB: $lastAssessmentDateSocDB');
    print('isAssessedSocDB: $isAssessedSocDB\n');
    print('last Assessment Date GOV DB: $lastAssessmentDateGovDB');
    print('isAssessedGovDB: $isAssessedGovDB');
    print("========================================");
  }

  @override
  void initState() {
    super.initState();
    getAssessmentData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.35,
      // decoration: BoxDecoration(
      //   color: AppColors.greyAccent,
      //   borderRadius: BorderRadius.circular(20),
      // ),
      // padding: EdgeInsets.symmetric(
      //   vertical: MediaQuery.of(context).size.width * 0.008,
      // ), //horizontal: MediaQuery.of(context).size.width * 0.008
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: (MediaQuery.of(context).size.width * 0.01),
        runSpacing: 20,
        alignment: WrapAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              print('is Env Assessed: $isAssessedEnvDB');
              if (isAssessedEnvDB == true) {
              } else {
                setState(() {
                  // _colorContainer1 = AppColors.white;
                  // _colorContainer2 = AppColors.greyAccent;
                  // _colorContainer3 = AppColors.greyAccent;
                  _btnPressed1 = !_btnPressed1;
                  _btnPressed2 = false;
                  _btnPressed3 = false;
                  _fontColor1 =
                      _btnPressed1 ? AppColors.blueAccent : AppColors.black;
                  _fontColor2 = _btnPressed1 ? AppColors.grey : AppColors.black;
                  _fontColor3 = _btnPressed1 ? AppColors.grey : AppColors.black;
                  _border1 = _btnPressed1 ? pressedBorder : unpressedBorder;
                  _border2 = unpressedBorder;
                  _border3 = unpressedBorder;
                  _shadow1 = _btnPressed1 ? pressedShadow : unpressedShadow;
                  _shadow2 = unpressedShadow;
                  _shadow3 = unpressedShadow;
                  _visible1 = _btnPressed1 ? true : false;
                  _visible2 = false;
                  _visible3 = false;
                });
              }
            },
            child: InfoCard(
                date: isAssessedEnvDB ? formatDateEnv : 'Assessment Date',
                navigation: 'environmental',
                visible: _visible1,
                icon: _icon1,
                fontColor: isAssessedEnvDB ? AppColors.grey : _fontColor1,
                color: _colorContainer1,
                border: _border1,
                boxShadow: _shadow1,
                label: 'Environmental',
                status: isAssessedEnvDB ? 'Completed' : 'Not Completed',
                items: questionsEnv.length),
          ),
          GestureDetector(
            onTap: () {
              print('is Soc Assessed: $isAssessedSocDB');
              if (isAssessedSocDB == true) {
              } else {
                setState(() {
                  // _colorContainer1 = AppColors.greyAccent;
                  // _colorContainer2 = AppColors.white;
                  // _colorContainer3 = AppColors.greyAccent;
                  _btnPressed1 = false;
                  _btnPressed2 = !_btnPressed2;
                  _btnPressed3 = false;
                  _fontColor1 = _btnPressed2 ? AppColors.grey : AppColors.black;
                  _fontColor2 =
                      _btnPressed2 ? AppColors.blueAccent : AppColors.black;
                  _fontColor3 = _btnPressed2 ? AppColors.grey : AppColors.black;
                  _border1 = unpressedBorder;
                  _border2 = _btnPressed2 ? pressedBorder : unpressedBorder;
                  _border3 = unpressedBorder;
                  _shadow1 = unpressedShadow;
                  _shadow2 = _btnPressed2 ? pressedShadow : unpressedShadow;
                  _shadow3 = unpressedShadow;
                  _visible1 = false;
                  _visible2 = _btnPressed2 ? true : false;
                  _visible3 = false;
                });
              }
            },
            child: InfoCard(
                date: isAssessedSocDB ? formatDateSoc : 'Assessment Date',
                navigation: 'social',
                visible: _visible2,
                icon: _icon2,
                fontColor: isAssessedSocDB ? AppColors.grey : _fontColor2,
                color: _colorContainer2,
                border: _border2,
                boxShadow: _shadow2,
                label: 'Social',
                status: isAssessedSocDB ? 'Completed' : 'Not Completed',
                items: questionsSoc.length),
          ),
          GestureDetector(
            onTap: () {
              print('is Gov Assessed: $isAssessedGovDB');
              if (isAssessedGovDB == true) {
              } else {
                setState(() {
                  // _colorContainer1 = AppColors.greyAccent;
                  // _colorContainer2 = AppColors.greyAccent;
                  // _colorContainer3 = AppColors.white;
                  _btnPressed1 = false;
                  _btnPressed2 = false;
                  _btnPressed3 = !_btnPressed3;

                  _fontColor1 = _btnPressed3 ? AppColors.grey : AppColors.black;
                  _fontColor2 = _btnPressed3 ? AppColors.grey : AppColors.black;
                  _fontColor3 =
                      _btnPressed3 ? AppColors.blueAccent : AppColors.black;
                  _border1 = unpressedBorder;
                  _border2 = unpressedBorder;
                  _border3 = _btnPressed3 ? pressedBorder : unpressedBorder;
                  _shadow1 = unpressedShadow;
                  _shadow2 = unpressedShadow;
                  _shadow3 = _btnPressed3 ? pressedShadow : unpressedShadow;
                  _visible1 = false;
                  _visible2 = false;
                  _visible3 = _btnPressed3 ? true : false;
                });
              }
            },
            child: InfoCard(
                date: isAssessedGovDB ? formatDateGov : 'Assessment Date',
                navigation: 'governance',
                visible: _visible3,
                icon: _icon3,
                fontColor: isAssessedGovDB ? AppColors.grey : _fontColor3,
                color: _colorContainer3,
                border: _border3,
                boxShadow: _shadow3,
                label: 'Governance',
                status: isAssessedGovDB ? 'Completed' : 'Not Completed',
                items: questionsGov.length),
          ),
        ],
      ),
    );
  }
}
