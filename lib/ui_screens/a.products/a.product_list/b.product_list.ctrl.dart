part of '_index.dart';

class ProductListCtrl {
  init() => logxx.i(ProductListCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  readGetCol() => _sv.readGetCol();

  selectedId(String id) => _sv.selectedId(id);

  deleteAccount() => _svA.deleteAccount();
}
