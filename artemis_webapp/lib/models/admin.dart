import 'package:cloud_firestore/cloud_firestore.dart';

class Admin {
  final String uid;
  final String adminEmail;
  final bool isAdmin;

  const Admin(
      {required this.uid, required this.adminEmail, this.isAdmin = true});

  static Admin fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Admin(
      uid: snap.id,
      adminEmail: snapshot['adminEmail'],
      isAdmin: true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'adminEmail': adminEmail,
      'isAdmin': isAdmin,
    };
  }
}
