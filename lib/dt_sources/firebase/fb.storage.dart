part of '_index.dart';

final x1FbStorage = FbStorage();

class FbStorage {
  final instance = FirebaseStorage.instance;

  //* delete single image
  Future<void> deleteOneImage(String refImage) async {
    try {
      await instance.ref(refImage).delete();
    } catch (e) {
      logxx.e(FbStorage, 'error on delete image. ${e.toString()}');
    }
  }

// * upload single image
  Future<String> uploadImage({
    required String id,
    required Uint8List imageBytes,
    required String? imageType,
  }) async {
    final task = await instance.ref(id).putData(
          imageBytes,
          SettableMetadata(contentType: imageType),
        );
    return await task.ref.getDownloadURL();
  }
}
