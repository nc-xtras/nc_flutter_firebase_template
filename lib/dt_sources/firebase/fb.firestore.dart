part of '_index.dart';

final x1FbFirestore = FbFirestore();

class FbFirestore {
  final instance = FirebaseFirestore.instance;
  final instanceStorage = FirebaseStorage.instance;

  //* read multiple items
  Future<dynamic> readCollection({
    required String colId,
    required int limit,
    required String lastCreateTime,
  }) async {
    try {
      return Future.value(instance
          .collection(colId)
          .limit(limit)
          .orderBy('created_at', descending: true)
          .startAfter([lastCreateTime]).get());
    } catch (e) {
      logxx.e(FbFirestore, 'error on read. ${e.toString()}');
    }
  }

  //* read single item
  Future<dynamic> readDocument({
    required String colId,
    required String docId,
  }) async {
    try {
      return Future.value(instance.collection(colId).doc(docId).get());
    } catch (e) {
      logxx.e(FbFirestore, 'error on read. ${e.toString()}');
    }
  }

  //* delete single item w/ single image
  Future<void> deleteDocument({
    required String colId,
    required String colId2,
    required String refImage,
    required String docId,
  }) async {
    try {
      await instance.collection(colId).doc(docId).delete();
      await instance.collection(colId2).doc(docId).delete();
      await instanceStorage.ref(refImage).delete();
    } catch (e) {
      logxx.e(FbFirestore, 'error on delete. ${e.toString()}');
    }
  }
}
