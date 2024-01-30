part of '_index.dart';

class AuthRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from AuthRepo');
    return x;
  }

  signInAnonymous() async {
    await x1FbAuth.st.signInAnonymously();
    // await FirebaseAuth.instance.signInAnonymously();
  }

  signInByGoogle() async {
    await x1FbAuth.st.signInWithGoogle();

    // final GoogleAuthProvider provider = GoogleAuthProvider().setCustomParameters({'prompt': 'select_account'});
    // await FirebaseAuth.instance.signInWithPopup(provider);
  }

  deleteAccount() async {
    await x1FbAuth.st.deleteAccount(_pv.rxUser.st);

    // await FirebaseAuth.instance.currentUser!.delete();
  }
}
