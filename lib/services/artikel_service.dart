import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mammal_diary/models/artikel_model.dart';

class ArtikelService {
  CollectionReference _artikelRef =
      FirebaseFirestore.instance.collection('artikel');

  Future<List<ArtikelModel>> fetchArtikel() async {
    try {
      QuerySnapshot result = await _artikelRef.get();

      List<ArtikelModel> artikel = result.docs.map(
        (e) {
          return ArtikelModel.fromJson(e.id, e.data() as Map<String, dynamic>);
        },
      ).toList();

      return artikel;
    } catch (e) {
      throw e;
    }
  }
}
