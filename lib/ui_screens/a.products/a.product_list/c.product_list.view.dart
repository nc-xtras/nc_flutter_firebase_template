part of '_index.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: ProductListAppbar(),
      ),
      floatingActionButton: const ProductListFab(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ProductListCharlie(),
            const ProductListDelta(),
            const ProductListEcho(),
            ElevatedButton(
              onPressed: () async {
                final test = await FirebaseFirestore.instance.collection('indah').get();

                debugPrint(test.toString());
                debugPrint(test.docs[0].data().toString());
                debugPrint(test.docs[0].id.toString());
                debugPrint(test.docs[0]['indah'].toString());
              },
              child: const Text(
                "Elevated Button",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
