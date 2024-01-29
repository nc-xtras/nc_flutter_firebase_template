part of '_index.dart';

abstract class Data {
  static Injected<ProductListData> get productList => _productListData;
  static Injected<ProductDetailData> get productDetail => _productDetailData;
  static Injected<ProductAddData> get productAdd => _productAddData;
  static Injected<ProductEditData> get productEdit => _productEditData;
  static Injected<LoginData> get login => _loginData;
}

final _productListData = RM1.inj(ProductListData(), Ctrl.productList.init);
final _productDetailData = RM1.inj(ProductDetailData(), Ctrl.productDetail.init);
final _productAddData = RM1.inj(ProductAddData(), Ctrl.productAdd.init);
final _productEditData = RM1.inj(ProductEditData(), Ctrl.productEdit.init);

final _loginData = RM1.inj(LoginData(), Ctrl.login.init);
