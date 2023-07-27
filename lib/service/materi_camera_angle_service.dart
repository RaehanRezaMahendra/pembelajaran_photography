import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pembelajaran_photography/common/dummy/materi_camera_angle_dummy.dart';
import 'package:pembelajaran_photography/model/materi_camera_angle_model.dart';
import 'package:uuid/uuid.dart';

class MateriCameraAngleService {
  final CollectionReference<Map<String, dynamic>> _collectionReference =
      FirebaseFirestore.instance.collection("materi_camera_angle");

  Future<List<MateriCameraAngleModel>> getMateri() async {
    try {
      QuerySnapshot result = await _collectionReference.get();

      List<MateriCameraAngleModel> datas = result.docs
          .map((e) =>
              MateriCameraAngleModel.fromMap(e.data() as Map<String, dynamic>))
          .toList();

      datas.sort((b, a) => a.createdAt!.compareTo(b.createdAt!));

      return datas;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createMateri() async {
    try {
      for (var i = 0; i < materiCameraAngleDummy.length; i++) {
        _collectionReference
            .doc(const Uuid().v4())
            .set(materiCameraAngleDummy[i].toMap());
      }
    } catch (e) {
      throw Exception('Data gagal disimpan, silahkan dicoba lagi');
    }
  }
}
