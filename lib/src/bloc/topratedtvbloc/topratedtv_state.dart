import 'package:equatable/equatable.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/model/tv_top_rated.dart';

abstract class TvTopState extends Equatable {
  const TvTopState();

  @override
  List<Object> get props => [];
}

class TvTopLoading extends TvTopState {}

class TvTopLoaded extends TvTopState {
  final List<Tv> tvList;
  const TvTopLoaded(this.tvList);

  @override
  List<Object> get props => [tvList];
}

class TvTopError extends TvTopState {}
