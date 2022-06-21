import 'package:equatable/equatable.dart';

class ArtikelModel extends Equatable {
  final String id;
  final String judul;
  final String waktu;
  final String imageUrl;
  final String isi;
  final String sumber;
  final String penulis;

  ArtikelModel({
    required this.id,
    this.judul = '',
    this.waktu = '',
    this.imageUrl = '',
    this.isi = '',
    this.sumber = '',
    this.penulis = '',
  });

  factory ArtikelModel.fromJson(String id, Map<String, dynamic> json) =>
      ArtikelModel(
        id: id,
        judul: json['judul'],
        waktu: json['waktu'],
        imageUrl: json['imageUrl'],
        isi: json['isi'],
        sumber: json['sumber'],
        penulis: json['penulis'],
      );

  @override
  List<Object?> get props => [
        id,
        judul,
        waktu,
        imageUrl,
        isi,
        sumber,
        penulis,
      ];
}
