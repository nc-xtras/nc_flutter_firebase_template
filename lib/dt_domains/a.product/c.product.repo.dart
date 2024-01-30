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

    final result = await x1FbFirestore.readCollection(
      colId: _pv.listCol,
      limit: _pv.limit,
      lastCreateTime: _pv.rxProductList.state.isEmpty ? '9999-99-9' : _pv.rxProductList.state.last.createdAt,
    );

    for (var element in result.docs) {
      products.add(Product.fromMap(element.data()));
    }
    return products;
  }

  // Future<List<Product>> getCol() async {
  //   List<Product> products = [];
  //   final result = await FirebaseFirestore.instance
  //       .collection(_pv.listCol)
  //       .orderBy('created_at', descending: true)
  //       .limit(_pv.limit)
  //       .startAfter(
  //     [_pv.rxProductList.state.isEmpty ? '9999-99-9' : _pv.rxProductList.state.last.createdAt],
  //     // [_pv.rxLoadMore.state.isEmpty ? '9999-99-9' : _pv.rxLoadMore.state.last.createdAt],
  //   ).get();
  //   for (var element in result.docs) {
  //     products.add(Product.fromMap(element.data()));
  //   }
  //   return products;
  // }

  // * ------------ create product ----------------

  Future<void> createDoc(Product data) async {
    await x1FbFirestore.createDocumentForList(
      colId: _pv.listCol,
      docId: data.id,
      name: data.name,
      price: data.price,
      createdAt: data.createdAt,
      imageUrl: data.imageUrl,
    );
    await x1FbFirestore.createDocumentForDetail(
      colId: _pv.docCol,
      docId: data.id,
      data: data.toMap(),
    );
  }
  // Future<void> createDoc(Product data) async {
  //   await FirebaseFirestore.instance.collection('product').doc(data.id).set(
  //     {
  //       'name': data.name,
  //       'price': data.price,
  //       'id': data.id,
  //       'created_at': data.createdAt,
  //       'image_url': data.imageUrl,
  //     },
  //   );
  //   await FirebaseFirestore.instance.collection('productDetail').doc(data.id).set(data.toMap());
  // }

// * ------------ upload storage ----------------
  Future<String> uploadImage(String id) async {
    final imageType = _pv.rxPickedImage.state!.mimeType;
    final imageBytes = await _pv.rxPickedImage.state!.readAsBytes();
    return await x1FbStorage.uploadImage(
      id: id,
      imageBytes: imageBytes,
      imageType: imageType,
    );
  }
  // Future<String> uploadImage(String id) async {
  //   final imageType = _pv.rxPickedImage.state!.mimeType;
  //   final imageBytes = await _pv.rxPickedImage.state!.readAsBytes();
  //   final task = await FirebaseStorage.instance.ref(id).putData(
  //         imageBytes,
  //         SettableMetadata(contentType: imageType),
  //       );

  //   return await task.ref.getDownloadURL();
  // }

  // * ------------ read detail ----------------

  Future<Product> getDoc() async {
    final result = await x1FbFirestore.readDocument(
      colId: _pv.docCol,
      docId: _pv.rxSelectedId.st,
    );
    final productDetail = Product.fromMap(result.data() ?? {});
    return productDetail;
  }
  // Future<Product> getDoc() async {
  //   final result = await FirebaseFirestore.instance.collection(_pv.docCol).doc(_pv.rxSelectedId.state).get();
  //   final productDetail = Product.fromMap(result.data() ?? {});
  //   return productDetail;
  // }

// * ------------ delete 1 product 1 image ----------------

  Future<void> deleteDoc() async {
    await x1FbFirestore.deleteDocument(
      colId: _pv.listCol,
      colId2: _pv.docCol,
      docId: _pv.rxSelectedId.st,
    );
    await x1FbStorage.deleteOneImage(_pv.rxSelectedId.st);
  }
  // Future<void> deleteDoc() async {
  //   await FirebaseFirestore.instance.collection('product').doc(_pv.rxSelectedId.state).delete();
  //   await FirebaseFirestore.instance.collection('productDetail').doc(_pv.rxSelectedId.state).delete();
  //   await FirebaseStorage.instance.ref(_pv.rxSelectedId.state).delete();
  // }

  // * ------------ update product ----------------

  Future<void> editDoc(Product editData) async {
    await x1FbFirestore.updateDocumentForList(
      colId: _pv.listCol,
      docId: editData.id,
      name: editData.name,
      price: editData.price,
      createdAt: editData.createdAt,
      imageUrl: editData.imageUrl,
    );
    await x1FbFirestore.updateDocumentForDetail(
      colId: _pv.docCol,
      docId: editData.id,
      editData: editData.toMap(),
    );
  }
  // Future<void> editDoc(Product editData) async {
  //   await FirebaseFirestore.instance.collection('product').doc(editData.id).set(
  //     {
  //       'name': editData.name,
  //       'price': editData.price,
  //       'id': editData.id,
  //       'created_at': editData.createdAt,
  //       'image_url': editData.imageUrl,
  //     },
  //   );
  //   await FirebaseFirestore.instance.collection('productDetail').doc(editData.id).set(editData.toMap());
  // }
}
