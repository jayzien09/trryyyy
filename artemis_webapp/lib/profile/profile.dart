import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/profile/edit%20profile/editProfileScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyProfile extends StatefulWidget {
  const CompanyProfile({super.key});

  @override
  State<CompanyProfile> createState() => _CompanyProfileState();
}

class _CompanyProfileState extends State<CompanyProfile> {
  String? companyName;
  String? companyIndustry;
  String? companyFounded;

  var userData = {};

  Future<void> getCompanyData() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      companyName = companyData['companyName'];
      companyIndustry = companyData['companyIndustry'];
      companyFounded = companyData['companyFounded'];
    });
    userData = companyData.data()!;
    print("IMAGE URL: ${userData['imageUrl']}");
  }

  @override
  @override
  void initState() {
    super.initState();
    getCompanyData();
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    // Image image = Image.network(
    //   userData['imageUrl']!,
    // );
    Image image = Image.asset('assets/images/Logo2.png');

    double companyESG = 84;
    int companyRank = 4;
    int companyPartners = 1;

    return Container(
      padding: const EdgeInsets.all(30),
      height: 280, //240,
      width: MediaQuery.of(context).size.width / 2.39,
      decoration: BoxDecoration(
        borderRadius: Decorations.borderRadius,
        color: AppColors.white,
        boxShadow: [
          Decorations.boxShadow,
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 240,
            width: 240,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(child: image),
            // child: ClipRRect(
            //   borderRadius: BorderRadius.circular(10),
            //   child: Image.network(
            //     userData['imageUrl'],
            //     fit: BoxFit.cover,
            //   ),
            // ),
          ),
          const SizedBox(
            width: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 2.39 - 320,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(),
                            ),
                          );
                        },
                        child: const Icon(Icons.edit_rounded,
                            color: AppColors.grey, size: 15),
                      ),
                    ),
                    const SizedBox(width: 10),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditProfileScreen(),
                              ),
                            );
                          },
                          child: Text('Edit Profile',
                              style: AppTextStyles.subtitle3)),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      companyName ?? user.displayName ?? 'Company Name',
                      style: AppTextStyles.headings,
                    ),
                    Text(companyIndustry ?? 'No Industry',
                        style: AppTextStyles.subHeadings),
                  ],
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    height: 75,
                    width: MediaQuery.of(context).size.width / 2.39 - 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(160, 240, 240, 240),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${esgScore.round().toString()}%",
                              style: AppTextStyles.title,
                            ),
                            Text(
                              'ESG Score',
                              style: AppTextStyles.subtitle3,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              companyRank.toString(),
                              style: AppTextStyles.title,
                            ),
                            Text(
                              'Rank',
                              style: AppTextStyles.subtitle3,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              companyPartners.toString(),
                              style: AppTextStyles.title,
                            ),
                            Text(
                              'Partners',
                              style: AppTextStyles.subtitle3,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              companyFounded ?? 'No Founded Date',
                              style: AppTextStyles.title,
                            ),
                            Text(
                              'Founded',
                              style: AppTextStyles.subtitle3,
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
