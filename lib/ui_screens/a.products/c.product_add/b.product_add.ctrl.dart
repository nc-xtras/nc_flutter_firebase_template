part of '_index.dart';

class ProductAddCtrl {
  init() => logxx.i(ProductAddCtrl, '...');

  increaseCounter() => _dt.rxCounter.setState((s) => s + 1);

  updateRandom() => Serv.sample.updateRandom();

  submit() => _dt.rxForm.submit();

  addProductList() async {
    final nama = _dt.rxProductName.value;
    final price = int.parse(_dt.rxProductPrice.value);
    final description = _dt.rxProductDesc.value;
    final id = UniqueKey().toString();
    final createdAt = DateTime.now().toString();

    final data = Product(
      name: nama,
      price: price,
      description: description,
      id: id,
      createdAt: createdAt,
      imageUrl: await _sv.uploadImage(id),
    );

    await _sv.addProductList(data);
    _dt.rxProductList.state = [..._dt.rxProductList.state]..insert(0, data);
    logx.i(data.toString());
  }

  pickImage() async => await _sv.pickImage();
}
