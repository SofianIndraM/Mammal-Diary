import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mammal_diary/models/allmammal_model.dart';
import 'package:mammal_diary/models/topmammal_model.dart';
import 'package:mammal_diary/services/allmammal_service.dart';
import 'package:mammal_diary/services/topmammal_service.dart';

part 'topmammal_state.dart';

class TopmammalCubit extends Cubit<TopmammalState> {
  TopmammalCubit() : super(TopmammalInitial());

  void fetchTopMammal() async {
    try {
      emit(TopmammalLoading());

      List<TopMammalModel> topmammal =
          await TopMammalService().fetchTopMammal();

      List<AllMammalModel> allmammal =
          await AllMammalService().fetchAllMammal();

      emit(TopmammalSuccess(topmammal, allmammal));
    } catch (e) {
      emit(TopmammalFailed(e.toString()));
    }
  }
}
