part of '_index.dart';

class ProductEditCtrl {
  init() => logxx.i(ProductEditCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  submit() => _dt.rxForm.submit();

  editProduct() async {
    final docId = _dt.rxSelectedId.state;
    final nama = _dt.rxProductName.state.value;
    final price = int.parse(_dt.rxProductPrice.state.value);
    final description = _dt.rxProductDesc.state.value;
    final createdAt = _dt.rxProductDetail.state!.createdAt;
    String imageUrl = _dt.rxProductDetail.state!.imageUrl;

    if (_dt.rxPickedImage.state != null) {
      imageUrl = await _sv.uploadImage(_dt.rxSelectedId.state);
    }

    final editData = Product(
      name: nama,
      price: price,
      description: description,
      id: docId,
      createdAt: createdAt,
      imageUrl: imageUrl,
    );

    await _sv.editProduct(editData);
    final index = _dt.rxProductList.state.indexWhere((element) => element.id == docId);
    _dt.rxProductList.setState((s) => s[index] = editData);
  }

  pickImage() async => await _sv.pickImage();
}
