import 'package:artemis_webapp/admin/assessment/assessmentAdminHeader.dart';
import 'package:artemis_webapp/admin/assessment/textfield.dart';
import 'package:artemis_webapp/appBarItems.dart';
import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/navigation/admin/assessment/assessmentAdmin.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class EnvAddQuestion extends StatefulWidget {
  const EnvAddQuestion({super.key});

  @override
  State<EnvAddQuestion> createState() => _EnvAddQuestionState();
}

class _EnvAddQuestionState extends State<EnvAddQuestion> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _questionController = TextEditingController();
  final TextEditingController _option1Controller = TextEditingController();
  final TextEditingController _option2Controller = TextEditingController();
  final TextEditingController _option3Controller = TextEditingController();
  final TextEditingController _option4Controller = TextEditingController();
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
              child: AssessmentAdmin(),
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
              const Expanded(
                flex: 2,
                child: AssessmentAdmin(),
              ),
            Expanded(
              flex: 10,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 30, left: 50, right: 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const AssessmentAdminHeader(),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.blueAccent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                ),
                                child: Text('Save',
                                    style: TextStyle(
                                      color: AppColors.white,
                                      fontSize: 15,
                                    )),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              ElevatedButton(
                                onPressed: (() {}),
                                style: ButtonStyle(
                                  padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          vertical: 20.0, horizontal: 40)),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.greyAccent),
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  shadowColor: MaterialStateProperty.all<Color>(
                                      Colors.transparent),
                                ),
                                child: Text('Cancel',
                                    style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 15,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Container(
                            padding: const EdgeInsets.all(30.0),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                Decorations.boxShadow,
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Add Environmental Question',
                                  style: AppTextStyles.title,
                                ),
                                Text(
                                  'subtitle',
                                  style: AppTextStyles.body,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.1,
                                      child: Column(
                                        children: [
                                          AdminTextFieldInput(
                                            keyboardType: TextInputType.text,
                                            labelText: "Question Category",
                                            textEditingController:
                                                _categoryController,
                                            maxlines: 1,
                                          ),
                                          AdminTextFieldInput(
                                            keyboardType:
                                                TextInputType.multiline,
                                            labelText: "Question",
                                            textEditingController:
                                                _questionController,
                                            maxlines: 2,
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.all(25.0),
                                            decoration: BoxDecoration(
                                              color: AppColors.greyAccent,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      Icons.info_outline,
                                                      size: 12,
                                                    ),
                                                    SizedBox(
                                                      width: 5.0,
                                                    ),
                                                    Text(
                                                      "Note:",
                                                      style: AppTextStyles.body,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10.0,
                                                ),
                                                Text(
                                                    "Options arrangment is based on its weight (Option 1 being the lowest and Option 4 being the highest). If you want to add more questions, click the add button. If you want to change the weight of an option, click the up or down button. ",
                                                    style: AppTextStyles.body),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.8,
                                      child: Column(
                                        children: [
                                          AdminTextFieldInput(
                                            keyboardType: TextInputType.text,
                                            labelText: "Option 1",
                                            textEditingController:
                                                _option1Controller,
                                            maxlines: 1,
                                          ),
                                          AdminTextFieldInput(
                                            keyboardType: TextInputType.text,
                                            labelText: "Option 2",
                                            textEditingController:
                                                _option2Controller,
                                            maxlines: 1,
                                          ),
                                          AdminTextFieldInput(
                                            keyboardType: TextInputType.text,
                                            labelText: "Option 3",
                                            textEditingController:
                                                _option3Controller,
                                            maxlines: 1,
                                          ),
                                          AdminTextFieldInput(
                                            keyboardType: TextInputType.text,
                                            labelText: "Option 4",
                                            textEditingController:
                                                _option4Controller,
                                            maxlines: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: AppColors.white,
                              size: 15,
                            ),
                            label: Text('Question',
                                style: AppTextStyles.body
                                    .copyWith(color: AppColors.white)),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 40)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColors.blueAccent),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              shadowColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                            ),
                          ),
                        ],
                      )
                    ],
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
