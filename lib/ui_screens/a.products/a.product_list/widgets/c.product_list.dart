part of '../_index.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return OnReactive(
      () => _dt.rxProductList.state.isEmpty
          ? const Center(
              child: Text('data is empty'),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  ...List.generate(
                    _dt.rxProductList.state.length,
                    (index) => Card(
                      child: ListTile(
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(_dt.rxProductList.state[index].imageUrl),
                        ),
                        title: Text(_dt.rxProductList.state[index].name),
                        subtitle: Text(_dt.rxProductList.state[index].createdAt),
                        onTap: () {
                          _ct.selectedId(_dt.rxProductList.state[index].id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ProductDetailView()),
                          );
                          debugPrint(_dt.rxSelectedId.state);
                        },
                        selected: _dt.rxSelectedId.state == _dt.rxProductList.state[index].id,
                        selectedTileColor: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const ProductLoad(),
                ],
              ),
            ),
    );
  }
}
