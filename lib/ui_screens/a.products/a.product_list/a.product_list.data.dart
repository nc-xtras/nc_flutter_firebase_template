part of '_index.dart';

class ProductListData {
  final rxTitle = 'Product List'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxLoadMore = _pv.rxLoadMore;

  final rxProductList = _pv.rxProductList;

  final rxIsEnd = _pv.rxIsEnd;

  final rxSelectedId = _pv.rxSelectedId;
}
