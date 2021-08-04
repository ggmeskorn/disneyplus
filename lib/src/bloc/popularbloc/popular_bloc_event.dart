import 'package:equatable/equatable.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();
}

class PopularEventStarted extends PopularEvent {
  final int movieId;
  final String query;

  const PopularEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
