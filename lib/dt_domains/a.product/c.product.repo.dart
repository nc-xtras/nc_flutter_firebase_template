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

  // * ------------ create product ----------------

  Future<void> createDoc(Product data) async {
    await FirebaseFirestore.instance.collection('product').doc(data.id).set(
      {
        'name': data.name,
        'price': data.price,
        'id': data.id,
        'created_at': data.createdAt,
        'image_url': data.imageUrl,
      },
    );
    await FirebaseFirestore.instance.collection('productDetail').doc(data.id).set(data.toMap());
  }

// * ------------ upload storage ----------------
  Future<String> uploadImage(String id) async {
    final imageType = _pv.rxPickedImage.state!.mimeType;
    final imageBytes = await _pv.rxPickedImage.state!.readAsBytes();
    final task = await FirebaseStorage.instance.ref(id).putData(
          imageBytes,
          SettableMetadata(contentType: imageType),
        );

    return await task.ref.getDownloadURL();
  }

  // * ------------ read detail ----------------

  Future<Product> getDoc() async {
    final result = await FirebaseFirestore.instance.collection(_pv.docCol).doc(_pv.rxSelectedId.state).get();
    final productDetail = Product.fromMap(result.data() ?? {});
    return productDetail;
  }

// * ------------ delete 1 product ----------------

  Future<void> deleteDoc() async {
    await FirebaseFirestore.instance.collection('product').doc(_pv.rxSelectedId.state).delete();
    await FirebaseFirestore.instance.collection('productDetail').doc(_pv.rxSelectedId.state).delete();
    await FirebaseStorage.instance.ref(_pv.rxSelectedId.state).delete();
  }

  // * ------------ update product ----------------

  Future<void> editDoc(Product editData) async {
    await FirebaseFirestore.instance.collection('product').doc(editData.id).set(
      {
        'name': editData.name,
        'price': editData.price,
        'id': editData.id,
        'created_at': editData.createdAt,
        'image_url': editData.imageUrl,
      },
    );
    await FirebaseFirestore.instance.collection('productDetail').doc(editData.id).set(editData.toMap());
  }
}
