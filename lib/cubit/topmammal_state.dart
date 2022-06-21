part of 'topmammal_cubit.dart';

abstract class TopmammalState extends Equatable {
  const TopmammalState();

  @override
  List<Object> get props => [];
}

class TopmammalInitial extends TopmammalState {}

class TopmammalLoading extends TopmammalState {}

class TopmammalSuccess extends TopmammalState {
  final List<TopMammalModel> topmammal;
  final List<AllMammalModel> allmammal;

  TopmammalSuccess(
    this.topmammal,
    this.allmammal,
  );

  @override
  List<Object> get props => [topmammal, allmammal];
}

class AllMammalSuccess extends TopmammalState {
  final List<AllMammalModel> allmammal;

  AllMammalSuccess(this.allmammal);

  @override
  List<Object> get props => [allmammal];
}

class TopmammalFailed extends TopmammalState {
  final String error;

  TopmammalFailed(this.error);

  @override
  List<Object> get props => [error];
}

class AllMammalFailed extends TopmammalState {
  final String error;

  AllMammalFailed(this.error);

  @override
  List<Object> get props => [error];
}
