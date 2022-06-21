import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mammal_diary/models/allmammal_model.dart';

class AllMammalService {
  CollectionReference _allmammalRef =
      FirebaseFirestore.instance.collection('allmammal');

  Future<List<AllMammalModel>> fetchAllMammal() async {
    try {
      QuerySnapshot result = await _allmammalRef.get();

      List<AllMammalModel> allmammal = result.docs.map((e) {
        return AllMammalModel.fromJson(e.id, e.data() as Map<String, dynamic>);
      }).toList();

      return allmammal;
    } catch (e) {
      throw e;
    }
  }
}
