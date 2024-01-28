part of '_index.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductDetail View'),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              await _ct.deleteDoc();

              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Icon(Icons.delete),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: null,
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductEditView()),
              );
            },
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 10),
        ],
      ),
      body: OnBuilder<Product?>.all(
        listenTo: _dt.rxProductDetail,
        onWaiting: () => const Center(
          child: CircularProgressIndicator(),
        ),
        onError: (error, refreshError) => const Text('error'),
        onData: (data) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 250,
                width: 250,
                child: Image.network(data!.imageUrl),
              ),
              Text(data.id),
              Text(data.name),
              Text(data.price.toString()),
              Text(data.description),
            ],
          ),
        ),
      ),
    );
  }
}
