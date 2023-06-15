import 'package:firebase_auth/firebase_auth.dart';
import 'package:vallo_app/models/user_model.dart';

import '../helpers/firebase_errors.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(
      {UserModel? user, Function? onSuccess, Function? onFail}) async {
    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(
          email: user!.email!, password: user.password!);
      onSuccess!();
    } on FirebaseAuthException catch (e) {
      onFail!(getErrorString(e.code));
    }
  }
}
