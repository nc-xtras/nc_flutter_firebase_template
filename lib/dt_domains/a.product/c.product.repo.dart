part of '_index.dart';

class ProductRepo {
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.s('random value coming from ProductRepo');
    return x;
  }

  // * -------------- read list ----------------
  Future<List<Product>> getCol() async {
    List<Product> products = [];
    final result = await FirebaseFirestore.instance
        .collection(_pv.listCol)
        .orderBy('created_at', descending: true)
        .limit(_pv.limit)
        .startAfter(
      [_pv.rxProductList.state.isEmpty ? '9999-99-9' : _pv.rxProductList.state.last.createdAt],
      // [_pv.rxLoadMore.state.isEmpty ? '9999-99-9' : _pv.rxLoadMore.state.last.createdAt],
    ).get();
    for (var element in result.docs) {
      products.add(Product.fromMap(element.data()));
    }
    return products;
  }

  Future<List<Product>> getColNoSA() async {
    List<Product> products = [];
    final result = await FirebaseFirestore.instance
        .collection(_pv.listCol)
        .limit(_pv.limit)
        .orderBy('created_at', descending: true)
        .get();
    for (var element in result.docs) {
      products.add(Product.fromMap(element.data()));
    }
    return products;
  }

  deleteAccount() async {
    await FirebaseAuth.instance.currentUser!.delete();
  }
}
