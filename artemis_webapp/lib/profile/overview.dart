import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyOverview extends StatefulWidget {
  const CompanyOverview({super.key});

  @override
  State<CompanyOverview> createState() => _CompanyOverviewState();
}

class _CompanyOverviewState extends State<CompanyOverview> {
  String? companyDescription;
  String? companySize;
  String? companyWebsite;
  String? companySpecialties;

  Future<void> getCompanyData() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      companyDescription = companyData['companyDescription'];
      companySize = companyData['companySize'];
      companyWebsite = companyData['companyWebsite'];
      companySpecialties = companyData['companySpecialties'];
      print("Company Description: $companyDescription");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 30),
      height: MediaQuery.of(context).size.height / 1.93,
      width: MediaQuery.of(context).size.width / 4.3,
      decoration: BoxDecoration(
        borderRadius: Decorations.borderRadius,
        color: AppColors.white,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Overview',
              style: AppTextStyles.title,
            ),
          ),
          const SizedBox(
            height: 9,
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width / 2.39,
            color: AppColors.greyAccentLine,
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Container(
                height: (MediaQuery.of(context).size.height / 1.93) / 2.2,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        companyDescription ?? 'No description',
                        style: AppTextStyles.subHeadings,
                        textAlign: TextAlign.justify,
                      ),
                      // Text('No Available Data',
                      //     style: AppTextStyles
                      //         .subHeadings),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 17,
                          //color: Colors.red,
                          child: Text('Company Size:',
                              style: AppTextStyles.subHeadings),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.3 -
                              MediaQuery.of(context).size.width / 17 -
                              70,
                          child: Text(companySize ?? 'No Available Data',
                              style: AppTextStyles.overviewDetails),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 17,
                          //color: Colors.red,
                          child: Text('Website:',
                              style: AppTextStyles.subHeadings),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4.3 -
                              MediaQuery.of(context).size.width / 17 -
                              70,
                          child: Text(companyWebsite ?? 'No Available Data',
                              style: AppTextStyles.overviewDetails),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 17,
                            //color: Colors.red,
                            child: Text('Specialties:',
                                style: AppTextStyles.subHeadings),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(companySpecialties.toString(),
                              style: AppTextStyles.overviewDetails),
                          // SizedBox(
                          //   height: MediaQuery.of(context).size.height * 0.06,
                          //   width: MediaQuery.of(context).size.width / 4.3 -
                          //       MediaQuery.of(context).size.width / 17 -
                          //       70,
                          //   child: SingleChildScrollView(
                          //     scrollDirection: Axis.vertical,
                          //     child: Column(
                          //       crossAxisAlignment: CrossAxisAlignment.start,
                          //       children: [
                          //         Wrap(
                          //           spacing: 5,
                          //           runSpacing: 5,
                          //           alignment: WrapAlignment.start,
                          //           children: [
                          //             Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 15, vertical: 5),
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(30),
                          //                 color: AppColors.lightred,
                          //               ),
                          //               child: Text('Technology',
                          //                   style: AppTextStyles.body2.copyWith(
                          //                       color: AppColors.redBright)),
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 15, vertical: 5),
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(30),
                          //                 color: AppColors.lightgreen,
                          //               ),
                          //               child: Text('Telecommunications',
                          //                   style: AppTextStyles.body2.copyWith(
                          //                       color: AppColors.green)),
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 15, vertical: 5),
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(30),
                          //                 color: AppColors.lightyellow,
                          //               ),
                          //               child: Text('Manufacturing',
                          //                   style: AppTextStyles.body2.copyWith(
                          //                       color: AppColors.yellow)),
                          //             ),
                          //             Container(
                          //               padding: const EdgeInsets.symmetric(
                          //                   horizontal: 15, vertical: 5),
                          //               decoration: BoxDecoration(
                          //                 borderRadius:
                          //                     BorderRadius.circular(30),
                          //                 color: AppColors.lightblue,
                          //               ),
                          //               child: Text('Education',
                          //                   style: AppTextStyles.body2.copyWith(
                          //                       color: AppColors.blueAccent)),
                          //             ),
                          //           ],
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
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
    );
  }
}
