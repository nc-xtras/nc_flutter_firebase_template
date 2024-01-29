part of '_index.dart';

class LoginCtrl {
  init() => logxx.i(LoginCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  signInByGoogle() async => await _sv.signInByGoogle();

  signInAnonymous() async => await _sv.signInAnonymous();
}
