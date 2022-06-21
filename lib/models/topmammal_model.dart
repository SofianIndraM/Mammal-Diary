import 'package:equatable/equatable.dart';

class TopMammalModel extends Equatable {
  final String id;
  final String famili;
  final String filum;
  final String foto1;
  final String foto2;
  final String foto3;
  final String genus;
  final String habitat;
  final String hamil;
  final String hidup;
  final String imageUrl;
  final String kelas;
  final String kerajaan;
  final String latin;
  final String makanan1;
  final String makanan2;
  final String makanan3;
  final String makanan4;
  final String nama;
  final String ordo;
  final String persebaran;
  final String spesies;
  final String suara;
  final String tentang;

  TopMammalModel({
    required this.id,
    this.famili = '',
    this.filum = '',
    this.foto1 = '',
    this.foto2 = '',
    this.foto3 = '',
    this.genus = '',
    this.hamil = '',
    this.habitat = '',
    this.hidup = '',
    this.imageUrl = '',
    this.kelas = '',
    this.kerajaan = '',
    this.latin = '',
    this.makanan1 = '',
    this.makanan2 = '',
    this.makanan3 = '',
    this.makanan4 = '',
    this.nama = '',
    this.ordo = '',
    this.persebaran = '',
    this.spesies = '',
    this.suara = '',
    this.tentang = '',
  });

  factory TopMammalModel.fromJson(String id, Map<String, dynamic> json) =>
      TopMammalModel(
        id: id,
        famili: json['famili'],
        filum: json['filum'],
        foto1: json['foto1'],
        foto2: json['foto2'],
        foto3: json['foto3'],
        genus: json['genus'],
        hamil: json['hamil'],
        habitat: json['habitat'],
        hidup: json['hidup'],
        imageUrl: json['imageUrl'],
        kelas: json['kelas'],
        kerajaan: json['kerajaan'],
        latin: json['latin'],
        makanan1: json['makanan1'],
        makanan2: json['makanan2'],
        makanan3: json['makanan3'],
        makanan4: json['makanan4'],
        nama: json['nama'],
        ordo: json['ordo'],
        persebaran: json['persebaran'],
        spesies: json['spesies'],
        suara: json['suara'],
        tentang: json['tentang'],
      );

  @override
  List<Object?> get props => [
        id,
        famili,
        filum,
        foto1,
        foto2,
        foto3,
        genus,
        hamil,
        habitat,
        hidup,
        imageUrl,
        kelas,
        kerajaan,
        latin,
        makanan1,
        makanan2,
        makanan3,
        makanan4,
        nama,
        ordo,
        persebaran,
        spesies,
        suara,
        tentang,
      ];
}
