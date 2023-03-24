import 'dart:typed_data';

import 'package:artemis_webapp/resources/storage_methods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  Future<void> updateProfile({
    required String companyName,
    required String ownerName,
    required String companyEmail,
    required String companyAddress,
    required String companyPhone,
    required String companyIndustry,
    required String companyFounded,
    required String companySize,
    required String companyWebsite,
    required String companyDescription,
    required String companySpecialties,
  }) async {
    if (companyName.isNotEmpty ||
        ownerName.isNotEmpty ||
        companyEmail.isNotEmpty ||
        companyAddress.isNotEmpty ||
        companyPhone.isNotEmpty ||
        companyIndustry.isNotEmpty ||
        companyFounded.isNotEmpty ||
        companySize.isNotEmpty ||
        companyWebsite.isNotEmpty ||
        companyDescription.isNotEmpty ||
        companySpecialties.isNotEmpty) {
      final user = FirebaseAuth.instance.currentUser;
      final userRef =
          FirebaseFirestore.instance.collection('users').doc(user!.uid);
      await userRef.update({
        'companyName': companyName,
        'ownerName': ownerName,
        'companyEmail': companyEmail,
        'companyAddress': companyAddress,
        'companyPhone': companyPhone,
        'companyIndustry': companyIndustry,
        'companyFounded': companyFounded,
        'companySize': companySize,
        'companyWebsite': companyWebsite,
        'companyDescription': companyDescription,
        'companySpecialties': companySpecialties,
      });
    }
  }

  Future<void> updateEnvScore({
    required double esgScore,
    required String descriptiveScore,
    required double envScore,
    required String lastAssessDateEnv,
    required bool isAssessedEnv,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    await userRef.update({
      'esgScore': esgScore,
      'descriptiveScore': descriptiveScore,
      'envScore': envScore,
      'lastAssessDateEnv': lastAssessDateEnv,
      'isAssessedEnv': isAssessedEnv,
    });
  }

  Future<void> updateSocScore({
    required double esgScore,
    required String descriptiveScore,
    required double socScore,
    required String lastAssessDateSoc,
    required bool isAssessedSoc,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    await userRef.update({
      'esgScore': esgScore,
      'descriptiveScore': descriptiveScore,
      'socScore': socScore,
      'lastAssessDateSoc': lastAssessDateSoc,
      'isAssessedSoc': isAssessedSoc,
    });
  }

  Future<void> updateGovScore({
    required double esgScore,
    required String descriptiveScore,
    required double govScore,
    required String lastAssessDateGov,
    required bool isAssessedGov,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    await userRef.update({
      'esgScore': esgScore,
      'descriptiveScore': descriptiveScore,
      'govScore': govScore,
      'lastAssessDateGov': lastAssessDateGov,
      'isAssessedGov': isAssessedGov,
    });
  }

  Future<void> updateESGScore({
    required double esgScore,
    required String descriptiveScore,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    await userRef.update({
      'esgScore': esgScore,
      'descriptiveScore': descriptiveScore,
    });
  }
}
