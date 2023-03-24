import 'package:artemis_webapp/admin/adminpanel/adminScreen.dart';
import 'package:artemis_webapp/auth_methods/database.dart';
import 'package:artemis_webapp/authentication/loginScreen.dart';
import 'package:artemis_webapp/authentication/services/snackBar.dart';
import 'package:artemis_webapp/authentication/services/showOTPDialog.dart';
import 'package:artemis_webapp/dashboard/dashboardScreen.dart';
import 'package:artemis_webapp/globalVariable.dart';
import 'package:artemis_webapp/models/admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:artemis_webapp/models/users.dart' as model;
import 'package:provider/provider.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;
  FirebaseAuthMethods(this._auth);
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // GET USER DATA
  // using null check operator since this method should be called only
  // when the user is logged in
  User get user => _auth.currentUser!;

  // get user details
  Future<model.User> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();

    return model.User.fromSnap(documentSnapshot);
  }

  //State
  Stream<User?> get authState => FirebaseAuth.instance.authStateChanges();
  // OTHER WAYS (depends on use case):
  // Stream get authState => FirebaseAuth.instance.userChanges();
  // Stream get authState => FirebaseAuth.instance.idTokenChanges();
  // KNOW MORE ABOUT THEM HERE: https://firebase.flutter.dev/docs/auth/start#auth-state

  //ADMIN SIGN UP
  Future<void> signUpAdmin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showSnackBar(context, "Please fill all the fields");
        return;
      } else {
        QuerySnapshot querySnapshot = await _firestore
            .collection("admin")
            .where("email", isEqualTo: email)
            .get();
        if (querySnapshot.docs.length > 0) {
          showSnackBar(context, "Email already exists");
          return;
        } else {
          // registering user in auth with email and password
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          Admin _admin = Admin(
            uid: cred.user!.uid,
            adminEmail: email,
            isAdmin: true,
          );
          // adding admin in our database
          await _firestore
              .collection("admin")
              .doc(cred.user!.uid)
              .set(_admin.toJson());
          await sendEmailVerification(context);
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 800),
                  child: const LoginScreen()));

          showSnackBar(
              context, 'Email Verification Sent. Please verify your email');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //ADMIN LOGIN
  Future<void> loginAdmin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showSnackBar(context, "Please fill all the fields");
        return;
      } else {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 800),
                child: const AdminScreen()));
      }
    } catch (e) {
      print(e);
    }
  }

  //check if admin or user
  Future<void> checkIfAdminOrUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty) {
        showSnackBar(context, "Please fill all the fields");
        return;
      } else {
        QuerySnapshot querySnapshot = await _firestore
            .collection("admin")
            .where("adminEmail", isEqualTo: email)
            .get();
        if (querySnapshot.docs.length > 0) {
          loginAdmin(
            email: email,
            password: password,
            context: context,
          );
        } else {
          loginWithEmail(
            email: email,
            password: password,
            context: context,
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //EMAIL SIGN UP
  Future<void> signUpWithEmail({
    required String companyName,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      if (email.isEmpty || password.isEmpty || companyName.isEmpty) {
        showSnackBar(context, "Please fill all the fields");
        return;
      } else {
        QuerySnapshot querySnapshot = await _firestore
            .collection("users")
            .where("email", isEqualTo: email)
            .get();
        if (querySnapshot.docs.length > 0) {
          showSnackBar(context, "Email already exists");
          return;
        } else {
          // registering user in auth with email and password
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );
          await sendEmailVerification(context);
          model.User _user = model.User(
            uid: cred.user!.uid,
            companyEmail: email,
            companyName: companyName,
            ownerName: "",
            companyAddress: "",
            companyPhone: "",
            companyWebsite: "",
            companyDescription: "",
            companySize: "",
            companyFounded: "",
            companyIndustry: "",
            envScore: 0,
            govScore: 0,
            socScore: 0,
            esgScore: 0,
            descriptiveScore: "",
            fileName: "",
            imageUrl: "",
            companySpecialties: "",
            companyRank: "",
            lastAssessDateEnv: "",
            lastAssessDateGov: "",
            lastAssessDateSoc: "",
            isAssessedEnv: false,
            isAssessedGov: false,
            isAssessedSoc: false,
            isAdmin: false,
          );

          // adding user in our database
          await _firestore
              .collection("users")
              .doc(cred.user!.uid)
              .set(_user.toJson());
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 800),
                  child: const LoginScreen()));

          showSnackBar(
              context, 'Email Verification Sent. Please verify your email');
        }
      }
    } on FirebaseAuthException catch (e) {
      // if (e.code == 'weak-password') {

      //   print('The password provided is too weak.');
      // } else if (e.code == 'email-already-in-use') {
      //   print('The account already exists for that email.');
      // }
      showSnackBar(context, e.message!);
      print(e);
    }
  }

  //ADMIN LOGIN

  //EMAIL LOGIN
  Future<void> loginWithEmail({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (!_auth.currentUser!.emailVerified) {
        _auth.currentUser!.sendEmailVerification();
        showSnackBar(
            context, 'Account is not verified. Email Verification Sent');
        Navigator.pushReplacement(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                duration: const Duration(milliseconds: 800),
                child: const LoginScreen()));
        return;
      } else {
        QuerySnapshot querySnapshot = await _firestore
            .collection("admin")
            .where("adminEmail", isEqualTo: email)
            .get();
        if (querySnapshot.docs.length > 0) {
          print('ADMIN ACCOUNT');
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 800),
                  child: const AdminScreen()));
        } else {
          print('USER ACCOUNT');
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 800),
                  child: const DashboardScreen()));
          final user = context.read<User?>();
          final companyData = await FirebaseFirestore.instance
              .collection('users')
              .doc(user!.uid)
              .get();

          companyName = companyData['companyName'];
          ownerName = companyData['ownerName'];
          companyEmail = companyData['companyEmail'];
          companyAddress = companyData['companyAddress'];
          companyPhone = companyData['companyPhone'];
          companyWebsite = companyData['companyWebsite'];
          companyDescription = companyData['companyDescription'];
          companySize = companyData['companySize'];
          companyFounded = companyData['companyFounded'];
          companyIndustry = companyData['companyIndustry'];
          companySpecialties = companyData['companySpecialties'];
          companyRank = companyData['companyRank'];
          lastAssessDateEnv = companyData['lastAssessDateEnv'];
          lastAssessDateGov = companyData['lastAssessDateGov'];
          lastAssessDateSoc = companyData['lastAssessDateSoc'];
          isAssessedEnv = companyData['isAssessedEnv'];
          isAssessedGov = companyData['isAssessedGov'];
          isAssessedSoc = companyData['isAssessedSoc'];
          envScore = companyData['envScore'];
          govScore = companyData['govScore'];
          socScore = companyData['socScore'];
          esgScore = companyData['esgScore'];
          fileName = companyData['fileName'];
          imageUrl = companyData['imageUrl'];
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      print(e);
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackBar(context, 'Email Verification Sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      print(e);
    }
  }

  //PHONE SIGN IN
  Future<void> phoneSignIn({
    required BuildContext context,
    required String phoneNumber,
  }) async {
    try {
      //For web only
      TextEditingController codeController = TextEditingController();
      if (kIsWeb) {
        ConfirmationResult result =
            await _auth.signInWithPhoneNumber(phoneNumber);

        showOTPDialog(
            codeController: codeController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: result.verificationId,
                smsCode: codeController.text.trim(),
              );
              await _auth.signInWithCredential(credential);
              //Navigator.of(context).pop();
              Navigator.pushReplacement(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade,
                      duration: const Duration(milliseconds: 800),
                      child: const DashboardScreen()));
            });
      }
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!);
      print(e);
    }
  }

  // SIGN OUT
  Future<void> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      showSnackBar(context, 'Successfully Signed Out');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }

  // DELETE ACCOUNT
  Future<void> deleteAccount(BuildContext context) async {
    try {
      await _auth.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
      // if an error of requires-recent-login is thrown, make sure to log
      // in user again and then delete account.
    }
  }

  // RESET PASSWORD
  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showSnackBar(context, 'Password Reset Email Sent');
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message!); // Displaying the error message
    }
  }
}
