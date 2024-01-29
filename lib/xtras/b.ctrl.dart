part of '_index.dart';

abstract class Ctrl {
  static ProductListCtrl get productList => ProductListCtrl();
  static ProductDetailCtrl get productDetail => ProductDetailCtrl();
  static ProductAddCtrl get productAdd => ProductAddCtrl();
  static ProductEditCtrl get productEdit => ProductEditCtrl();
  static LoginCtrl get login => LoginCtrl();
}
