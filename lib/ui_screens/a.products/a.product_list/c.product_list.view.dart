part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              _ct.deleteAccount();
              // Route route = MaterialPageRoute(builder: (context) => const LoginView());
              // Navigator.pushReplacement(context, route);
            },
            child: const Text(
              "Delete Account",
            ),
          ),
        ],
        title: const Text('ProductList View'),
      ),
      floatingActionButton: const ProductListFab(),
      body: OnBuilder<List<Product>>.all(
        listenToMany: [
          _dt.rxLoadMore,
        ],
        onWaiting: () => _dt.rxProductList.state.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : OnReactive(() => const ProductList()),
        onError: (error, refreshError) => Text(error),
        onData: (data) => OnReactive(
          () => const ProductList(),
        ),
      ),
    );
  }
}
