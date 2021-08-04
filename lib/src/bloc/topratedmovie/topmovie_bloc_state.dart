import 'package:equatable/equatable.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';

abstract class MovieTopState extends Equatable {
  const MovieTopState();

  @override
  List<Object> get props => [];
}

class MovieTopLoading extends MovieTopState {}

class MovieTopLoaded extends MovieTopState {
  final List<Movie> movieList;
  const MovieTopLoaded(this.movieList);

  @override
  List<Object> get props => [movieList];
}

class MovieTopError extends MovieTopState {}
