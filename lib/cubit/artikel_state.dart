part of 'artikel_cubit.dart';

abstract class ArtikelState extends Equatable {
  const ArtikelState();

  @override
  List<Object> get props => [];
}

class ArtikelInitial extends ArtikelState {}

class ArtikelLoading extends ArtikelState {}

class ArtikelSuccess extends ArtikelState {
  final List<ArtikelModel> artikel;

  ArtikelSuccess(this.artikel);

  @override
  List<Object> get props => [artikel];
}

class ArtikelFailed extends ArtikelState {
  final String error;

  ArtikelFailed(this.error);

  @override
  List<Object> get props => [error];
}
