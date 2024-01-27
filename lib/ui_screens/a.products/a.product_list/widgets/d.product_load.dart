part of '../_index.dart';

class ProductLoad extends StatelessWidget {
  const ProductLoad({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBuilder.all(
      listenToMany: [_dt.rxLoadMore],
      onWaiting: () => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (error, refreshError) => const Text('error'),
      onData: (data) => _dt.rxIsEnd.state == true
          ? const Center(child: Text('end of list'))
          : ElevatedButton(
              onPressed: () {
                _ct.readGetCol();
              },
              child: const Text('loadmore'),
            ),
    );
  }
}
