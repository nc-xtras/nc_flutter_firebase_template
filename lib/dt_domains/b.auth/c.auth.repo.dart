part of '_index.dart';

class AuthRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from AuthRepo');
    return x;
  }

  signInAnonymous() async {
    await FirebaseAuth.instance.signInAnonymously();
  }

  signInByGoogle() async {
    final GoogleAuthProvider provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
    await FirebaseAuth.instance.signInWithPopup(provider);
  }

  deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
