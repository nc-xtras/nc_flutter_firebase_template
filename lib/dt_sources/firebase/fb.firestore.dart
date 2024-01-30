part of '_index.dart';

final x1FbFirestore = FbFirestore();

class FbFirestore {
  final instance = FirebaseFirestore.instance;

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

  //* delete single item
  Future<void> deleteDocument({
    required String colId,
    required String colId2,
    required String docId,
  }) async {
    try {
      await instance.collection(colId).doc(docId).delete();
      await instance.collection(colId2).doc(docId).delete();
    } catch (e) {
      logxx.e(FbFirestore, 'error on delete. ${e.toString()}');
    }
  }

  //* create single item
  Future<void> createDocumentForDetail({
    required String colId,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await instance.collection(colId).doc(docId).set(data);
    } catch (e) {
      logxx.e(FbFirestore, 'error on create. ${e.toString()}');
    }
  }

  Future<void> createDocumentForList({
    required String colId,
    required String docId,
    required String name,
    required int price,
    required String createdAt,
    required String imageUrl,
  }) async {
    try {
      await instance.collection(colId).doc(docId).set(
        {
          'name': name,
          'price': price,
          'id': docId,
          'created_at': createdAt,
          'image_url': imageUrl,
        },
      );
    } catch (e) {
      logxx.e(FbFirestore, 'error on create. ${e.toString()}');
    }
  }

  //* update single item
  Future<void> updateDocumentForDetail({
    required String colId,
    required String docId,
    required Map<String, dynamic> editData,
  }) async {
    try {
      await instance.collection(colId).doc(docId).set(editData);
    } catch (e) {
      logxx.e(FbFirestore, 'error on create. ${e.toString()}');
    }
  }

  Future<void> updateDocumentForList({
    required String colId,
    required String docId,
    required String name,
    required int price,
    required String createdAt,
    required String imageUrl,
  }) async {
    try {
      await instance.collection(colId).doc(docId).set(
        {
          'name': name,
          'price': price,
          'id': docId,
          'created_at': createdAt,
          'image_url': imageUrl,
        },
      );
    } catch (e) {
      logxx.e(FbFirestore, 'error on create. ${e.toString()}');
    }
  }
}
