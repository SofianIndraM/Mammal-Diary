import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mammal_diary/models/artikel_model.dart';
import 'package:mammal_diary/services/artikel_service.dart';

part 'artikel_state.dart';

class ArtikelCubit extends Cubit<ArtikelState> {
  ArtikelCubit() : super(ArtikelInitial());

  void fetchArtikel() async {
    try {
      emit(ArtikelLoading());

      List<ArtikelModel> artikel = await ArtikelService().fetchArtikel();
      emit(ArtikelSuccess(artikel));
    } catch (e) {
      emit(ArtikelFailed(e.toString()));
    }
  }
}
