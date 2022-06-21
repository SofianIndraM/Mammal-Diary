import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mammal_diary/models/topmammal_model.dart';

class TopMammalService {
  CollectionReference _topmammalRef =
      FirebaseFirestore.instance.collection('topmammal');

  Future<List<TopMammalModel>> fetchTopMammal() async {
    try {
      QuerySnapshot result = await _topmammalRef.get();

      List<TopMammalModel> topmammal = result.docs.map((e) {
        return TopMammalModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return topmammal;
    } catch (e) {
      throw e;
    }
  }
}
