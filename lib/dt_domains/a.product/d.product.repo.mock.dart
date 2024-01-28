part of '_index.dart';

class ProductRepoMock implements ProductRepo {
  @override
  int giveNewRandom() {
    final x = Random().nextInt(100);
    logz.wtf('random value coming from ProductRepoMock');
    return x;
  }

  @override
  deleteAccount() {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getCol() {
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getColNoSA() {
    throw UnimplementedError();
  }

  @override
  Future<void> createDoc(Product data) {
    throw UnimplementedError();
  }

  @override
  Future<String> uploadImage(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteDoc() {
    throw UnimplementedError();
  }

  @override
  Future<Product> getDoc() {
    throw UnimplementedError();
  }

  @override
  Future<void> editDoc(Product editData) {
    throw UnimplementedError();
  }
}
