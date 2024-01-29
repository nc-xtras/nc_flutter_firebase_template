part of '_index.dart';

class AuthServ {
  void init() {
    logxx.i(AuthServ, '...');
    _pv.rxUser.subscription = FirebaseAuth.instance.authStateChanges().listen(
          (event) => _pv.rxUser.state = event,
        );
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(AuthServ, 'rxCounter setState success');
  }

  responseAuthState(User? user) async {
    if (nav.routeData.location == '/login') {
      if (user != null) {
        nav.toReplacement(Routes.productList);
      }
    } else {
      if (user == null) {
        nav.toAndRemoveUntil(Routes.login);
      }
    }
  }

  signInByGoogle() async => await _rp.signInByGoogle();

  signInAnonymous() async => await _rp.signInAnonymous();

  deleteAccount() async => await _rp.deleteAccount();
}
