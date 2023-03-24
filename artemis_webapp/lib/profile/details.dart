import 'package:artemis_webapp/authentication/services/firebaseAuth.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({super.key});

  @override
  State<CompanyDetails> createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  String? companyEmail;
  String? companyPhone;
  String? companyAddress;

  Future<void> getCompanyData() async {
    final user = context.read<User?>();
    final companyData = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    setState(() {
      companyPhone = companyData['companyPhone'];
      companyAddress = companyData['companyAddress'];
    });
    // print(
    //     'DETAILS: \nCompany Phone: $companyPhone \nCompany Address: $companyAddress\n\n');
  }

  @override
  void initState() {
    super.initState();
    getCompanyData();
    // print('INIT STATE DETAILS: \nCompany Phone: $companyPhone\n\n');
  }

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthMethods>().user;
    if (user != null) {
      String companyEmail = '${user.email}';
      // print('INSIDE BUILD DETAILS: \nCompany Email: $companyEmail\n\n');

      // final userRef =
      //     FirebaseFirestore.instance.collection('users').doc(user.uid);
      // userRef.get().then((DocumentSnapshot documentSnapshot) {
      //   if (documentSnapshot.exists) {
      //     setState(() {
      //       companyPhone = documentSnapshot['companyPhone'];
      //       companyAddress = documentSnapshot['companyAddress'];
      //     });
      //   } else {
      //     print('Document does not exist on the database');
      //   }
      // });

      return Container(
        padding: const EdgeInsets.symmetric(vertical: 30),
        height: 280,
        width: MediaQuery.of(context).size.width / 7,
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
                'Contact Details',
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              height: 160,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.email_rounded,
                          color: AppColors.grey,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 7 - 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email', style: AppTextStyles.body),
                              Text(companyEmail, style: AppTextStyles.details),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.grey,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 7 - 90,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Address', style: AppTextStyles.body),
                              Text(companyAddress ?? 'No Address',
                                  style: AppTextStyles.details),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.phone,
                          color: AppColors.grey,
                          size: 15,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Contact Number', style: AppTextStyles.body),
                            Text(companyPhone ?? 'No Phone',
                                style: AppTextStyles.details),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
