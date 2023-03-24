import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String companyName;
  final String ownerName;
  final String companyEmail;
  final String companyAddress;
  final String companyPhone;
  final String companyIndustry;
  final String companyFounded;
  final String companySize;
  final String companyWebsite;
  final String companyDescription;
  final double envScore;
  final double govScore;
  final double socScore;
  final double esgScore;
  final String descriptiveScore;
  final String imageUrl;
  final String fileName;
  final String companySpecialties;
  final String companyRank;
  final String lastAssessDateEnv;
  final String lastAssessDateSoc;
  final String lastAssessDateGov;
  final bool isAssessedEnv;
  final bool isAssessedSoc;
  final bool isAssessedGov;
  final bool isAdmin;

  const User(
      {required this.uid,
      required this.companyName,
      required this.ownerName,
      required this.companyEmail,
      required this.companyAddress,
      required this.companyPhone,
      required this.companyIndustry,
      required this.companyFounded,
      required this.companySize,
      required this.companyWebsite,
      required this.companyDescription,
      required this.envScore,
      required this.govScore,
      required this.socScore,
      required this.esgScore,
      required this.descriptiveScore,
      required this.imageUrl,
      required this.fileName,
      required this.companySpecialties,
      required this.companyRank,
      required this.lastAssessDateEnv,
      required this.lastAssessDateSoc,
      required this.lastAssessDateGov,
      required this.isAssessedEnv,
      required this.isAssessedSoc,
      required this.isAssessedGov,
      required this.isAdmin});

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      uid: snap.id,
      companyName: snapshot['companyName'],
      ownerName: snapshot['ownerName'],
      companyEmail: snapshot['companyEmail'],
      companyAddress: snapshot['companyAddress'],
      companyPhone: snapshot['companyPhone'],
      companyIndustry: snapshot['companyIndustry'],
      companyFounded: snapshot['companyFounded'],
      companySize: snapshot['companySize'],
      companyWebsite: snapshot['companyWebsite'],
      companyDescription: snapshot['companyDescription'],
      envScore: snapshot['envScore'],
      govScore: snapshot['govScore'],
      socScore: snapshot['socScore'],
      esgScore: snapshot['esgScore'],
      descriptiveScore: snapshot['descriptiveScore'],
      imageUrl: snapshot['imageUrl'],
      fileName: snapshot['fileName'],
      companySpecialties: snapshot['companySpecialties'],
      companyRank: snapshot['companyRank'],
      lastAssessDateEnv: snapshot['lastAssessDateEnv'],
      lastAssessDateSoc: snapshot['lastAssessDateSoc'],
      lastAssessDateGov: snapshot['lastAssessDateGov'],
      isAssessedEnv: snapshot['isAssessedEnv'],
      isAssessedSoc: snapshot['isAssessedSoc'],
      isAssessedGov: snapshot['isAssessedGov'],
      isAdmin: snapshot['isAdmin'],
    );
  }

  Map<String, dynamic> toJson() => {
        'uid': uid,
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
        'envScore': envScore,
        'govScore': govScore,
        'socScore': socScore,
        'esgScore': esgScore,
        'descriptiveScore': descriptiveScore,
        'imageUrl': imageUrl,
        'fileName': fileName,
        'companySpecialties': companySpecialties,
        'companyRank': companyRank,
        'lastAssessDateEnv': lastAssessDateEnv,
        'lastAssessDateSoc': lastAssessDateSoc,
        'lastAssessDateGov': lastAssessDateGov,
        'isAssessedEnv': isAssessedEnv,
        'isAssessedSoc': isAssessedSoc,
        'isAssessedGov': isAssessedGov,
        'isAdmin': isAdmin,
      };
}
