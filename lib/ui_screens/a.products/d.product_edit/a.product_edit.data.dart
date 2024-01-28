part of '_index.dart';

class ProductEditData {
  final rxTitle = 'Product Edit'.inj();

  final rxCounter = 0.inj();

  final rxRandom = Prov.sample.st.rxRandom;

  final rxForm = RM.injectForm(
    submit: () async => await _ct.editProduct(),
  );

  final rxProductName = RM.inject(
    () => RM.injectTextEditing(
      text: '${_pv.rxProductDetail.state?.name}',
    ),
  );
  final rxProductPrice = RM.inject(
    () => RM.injectTextEditing(
      text: '${_pv.rxProductDetail.state?.price}',
    ),
  );
  final rxProductDesc = RM.inject(
    () => RM.injectTextEditing(
      text: '${_pv.rxProductDetail.state?.description}',
    ),
  );

  final rxProductList = _pv.rxProductList;

  final rxSelectedId = _pv.rxSelectedId;

  final rxProductDetail = _pv.rxProductDetail;

  final rxPickedImage = _pv.rxPickedImage;
}
