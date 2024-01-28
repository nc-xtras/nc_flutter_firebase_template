part of '_index.dart';

class ProductAddData {
  final rxTitle = 'Product Add'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxForm = RM.injectForm(
    submit: () async => await _ct.addProductList(),
  );

  final rxProductName = RM.injectTextEditing(
    text: 'this is product',
  );

  final rxProductPrice = RM.injectTextEditing(
    text: '1000',
  );

  final rxProductDesc = RM.injectTextEditing(
    text: 'Description',
  );

  final rxImageUrl = _pv.rxImageUrl;

  final rxProductList = _pv.rxProductList;

  final rxPickedImage = _pv.rxPickedImage;
}
