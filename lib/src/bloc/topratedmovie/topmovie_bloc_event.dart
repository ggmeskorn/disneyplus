import 'package:equatable/equatable.dart';

abstract class MovieTopEvent extends Equatable {
  const MovieTopEvent();
}

class MovieTopEventStarted extends MovieTopEvent {
  final int movieId;
  final String query;

  const MovieTopEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
