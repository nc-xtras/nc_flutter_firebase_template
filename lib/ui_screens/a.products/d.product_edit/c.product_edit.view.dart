part of '_index.dart';

class ProductEditView extends StatelessWidget {
  const ProductEditView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProductEdit View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnReactive(
              () => _dt.rxPickedImage.state == null
                  ? Card(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white10,
                        ),
                        height: 200,
                        width: 200,
                        child: Image.network(_dt.rxProductDetail.state!.imageUrl),
                      ),
                    )
                  : SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.network(_dt.rxPickedImage.state!.path),
                    ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                _dt.rxPickedImage.state = await _ct.pickImage();
                debugPrint(_dt.rxPickedImage.state!.path);
              },
              child: const Text(
                "pick image from galery",
              ),
            ),
            const SizedBox(height: 20),
            OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => TextField(
                controller: _dt.rxProductName.state.controller,
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => TextField(
                controller: _dt.rxProductPrice.state.controller,
                decoration: const InputDecoration(
                  labelText: 'Product Price',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            OnFormBuilder(
              listenTo: _dt.rxForm,
              builder: () => TextField(
                controller: _dt.rxProductDesc.state.controller,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            OnFormSubmissionBuilder(
              listenTo: _dt.rxForm,
              onSubmitting: () => const CircularProgressIndicator(),
              child: ElevatedButton(
                onPressed: () async {
                  await _ct.submit();
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                  // ignore: use_build_context_synchronously
                  Navigator.pop(context);
                },
                child: const Text(
                  "Submit",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
