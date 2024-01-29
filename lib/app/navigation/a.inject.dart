part of '_index.dart';

final nav = RM.injectNavigator(
  initialLocation: Prov.auth.st.rxUser.st != null ? Routes.productList : Routes.login,
  routes: RouteMap.data,
);
