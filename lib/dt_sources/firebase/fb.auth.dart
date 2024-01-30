part of '_index.dart';

final x1FbAuth = RM.inject<FbAuth>(() => FbAuth());

class FbAuth {
  final instance = FirebaseAuth.instance;

  // *SignIn Anonymous
  Future<void> signInAnonymously() async {
    try {
      await instance.signInAnonymously();
    } catch (e) {
      logx.i('authError $e');
    }
  }

// * delete account
  Future<void> deleteAccount(User? user) async {
    try {
      await user?.delete();
    } catch (e) {
      logx.i('authError $e');
    }
  }

  // *  SignIn By Google (web only)

  Future<void> signInWithGoogle() async {
    try {
      final GoogleAuthProvider provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
      await instance.signInWithPopup(provider);
    } catch (e) {
      logx.i('authError $e');
    }
  }
}
