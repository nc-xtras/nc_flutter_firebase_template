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

  // * ------------ list product ----------------

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

  // * ------------ add product ----------------

  addProductList(Product data) async => await _rp.createDoc(data);

  uploadImage(String id) async => await _rp.uploadImage(id);

  pickImage() async => await ImagePicker().pickImage(source: ImageSource.gallery);

  // * ------------ detail product ----------------

  readGetDoc() {
    _pv.rxProductDetail.stateAsync = _rp.getDoc();
  }

  deleteDoc() async {
    await _rp.deleteDoc();
    _pv.rxProductList.state = [..._pv.rxProductList.state]
      ..removeWhere((element) => element.id == _pv.rxSelectedId.state);
  }

  // * ------------ edit product ----------------

  editProduct(Product editData) async => await _rp.editDoc(editData);
}
