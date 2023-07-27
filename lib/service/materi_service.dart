import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pembelajaran_photography/common/dummy/materi_dummy.dart';
import 'package:pembelajaran_photography/model/materi_model.dart';
import 'package:uuid/uuid.dart';

class MateriService {
  final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection("materi");

  Future<List<MateriModel>> getMateri() async {
    try {
      QuerySnapshot result = await _collectionReference.get();

      List<MateriModel> datas = result.docs
          .map((e) => MateriModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();

      datas.sort((b, a) => a.createdAt!.compareTo(b.createdAt!));

      return datas;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createMateri() async {
    try {
      for (var i = 0; i < materiDummy.length; i++) {
        _collectionReference.doc(const Uuid().v4()).set(materiDummy[i].toMap());
      }
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }
}
