part of '_index.dart';

class RouteMap {
  RouteMap._();

  static final data = {
    Routes.productList: (RouteData data) => const ProductListView(),
    Routes.productDetail: (RouteData data) => const ProductDetailView(),
    Routes.productAdd: (RouteData data) => const ProductAddView(),
    Routes.productEdit: (RouteData data) => const ProductEditView(),
    Routes.login: (RouteData data) => const LoginView(),
  };
}
