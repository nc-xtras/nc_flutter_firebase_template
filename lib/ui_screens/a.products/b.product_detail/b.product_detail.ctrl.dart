part of '_index.dart';

class ProductDetailCtrl {
  init() => logxx.i(ProductDetailCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  deleteDoc() async => await _sv.deleteDoc();
}
