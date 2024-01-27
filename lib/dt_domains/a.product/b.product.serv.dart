part of '_index.dart';

class ProductServ {
  void init() {
    logxx.i(ProductServ, '...');
  }

  void updateRandom() {
    _pv.rxRandom.st = _rp.giveNewRandom();
  }

  void onSetState() {
    logzz.i(ProductServ, 'rxCounter setState success');
  }

  selectedId(String id) {
    _pv.rxSelectedId.refresh();
    _pv.rxSelectedId.state = id;
  }

  readGetCol() {
    _pv.rxLoadMore.stateAsync = _rp.getCol();
  }

  addColToUserList(List<Product> moreProduct) {
    _pv.rxProductList.state = [..._pv.rxProductList.state, ...moreProduct];
    if (moreProduct.length < _pv.limit) {
      _pv.rxIsEnd.state = true;
    }
  }

  deleteAccount() => _rp.deleteAccount();
}
