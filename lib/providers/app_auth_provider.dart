import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:planner/constants/app_colors.dart';
import 'package:planner/screens/dashboard_screen.dart';

class AppAuthProvider extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;

  void signUp({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
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

      Fluttertoast.showToast(
        msg: 'Logged in successfully',
        backgroundColor: AppColors.success,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DashboardScreen()),
      );
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
}
