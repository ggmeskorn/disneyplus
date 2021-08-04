import 'package:equatable/equatable.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularLoading extends PopularState {}

class PopularLoaded extends PopularState {
  final List<Movie> movieList;
  const PopularLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class PopularError extends PopularState {}
