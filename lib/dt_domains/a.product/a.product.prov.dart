part of '_index.dart';

class ProductProv {
  final rxRandom = RM.inject<int>(
    () => 0,
    autoDisposeWhenNotUsed: false,
    sideEffects: SideEffects(
      onSetState: (p0) => _sv.onSetState(),
    ),
  );
  final rxProductList = RM.inject<List<Product>>(
    () => [],
  );

  final rxLoadMore = RM.injectFuture<List<Product>>(
    () => Future.value([]),
    sideEffects: SideEffects(
      initState: () => _sv.readGetCol(),
      onSetState: (p0) {
        if (p0.hasData) {
          final moreProduct = p0.state.whereType<Product>().toList();
          _sv.addColToUserList(moreProduct);
        }
      },
    ),
  );

  final limit = 3;

  final rxIsEnd = false.inj();

  final listCol = 'product';

  final rxSelectedId = RM.inject<String>(() => '');
}
