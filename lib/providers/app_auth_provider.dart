import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planner/constants/app_colors.dart';
import 'package:planner/models/user_model.dart';
import 'package:planner/screens/dashboard_screen.dart';

class AppAuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final String allUsersCollection = 'allUsers';

  UserModel? userData;

  void signUp({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        Fluttertoast.showToast(
          msg: 'Cannot create account',
          backgroundColor: Colors.red,
        );
        return;
      }

      var data = {"name": name, "email": email};

      //save user data to firebase
      await FirebaseFirestore.instance
          .collection(allUsersCollection)
          .doc(email)
          .set(data);

      Fluttertoast.showToast(
        msg: 'Account created successfully',
        backgroundColor: AppColors.success,
      );
      Navigator.pop(context);
      notifyListeners();
    } on FirebaseAuthException catch (firebaseAuthError) {
      Fluttertoast.showToast(
        msg: firebaseAuthError.message ?? 'Authentication error',
        backgroundColor: AppColors.error,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.error,
      );
    }
  }

  void signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user == null) {
        Fluttertoast.showToast(
          msg: 'User does not exist',
          backgroundColor: Colors.red,
        );
        return;
      }

      getUserData();
      Fluttertoast.showToast(
        msg: 'Logged in successfully',
        backgroundColor: AppColors.success,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );

      notifyListeners();
    } on FirebaseAuthException catch (firebaseAuthError) {
      Fluttertoast.showToast(
        timeInSecForIosWeb: 5,
        msg: firebaseAuthError.message ?? 'Login error',
        backgroundColor: AppColors.error,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColors.error,
      );
    }
  }

  void getUserData() async {
    final documentSnapshot = await FirebaseFirestore.instance
        .collection(allUsersCollection)
        .doc(_auth.currentUser!.email!)
        .get();

    final userDataAsMap = documentSnapshot.data() as Map<String, dynamic>;

    userData = UserModel.fromJson(userDataAsMap);
    notifyListeners();
  }

  Future<void> signOut() async {
    _auth.signOut();
    userData = null;
    notifyListeners();
  }
}
