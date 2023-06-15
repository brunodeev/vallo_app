// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vallo_app/models/user_model.dart';

import '../helpers/firebase_errors.dart';

class UserManager extends ChangeNotifier {
  UserManager() {
    _loadCurrentUser();
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  late User user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> signIn(
      {UserModel? user, Function? onSuccess, Function? onFail}) async {
    loading = true;
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      this.user = result.user!;
      onSuccess!();
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
    loading = false;
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser() async {
    final User? currentUser = auth.currentUser;

    if (currentUser != null) {
      user = currentUser;
    }
    notifyListeners();
  }
}
