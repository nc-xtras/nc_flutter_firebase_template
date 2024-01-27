part of '../_index.dart';

class ProductListFab extends StatelessWidget {
  const ProductListFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => const ProductAddView()),
        // );
      },
      child: const Icon(Icons.add),
    );
  }
}
