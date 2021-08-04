import 'package:equatable/equatable.dart';

abstract class UpComingEvent extends Equatable {
  const UpComingEvent();
}

class UpComingEventStarted extends UpComingEvent {
  final int movieId;
  final String query;

  const UpComingEventStarted(this.movieId, this.query);

  @override
  List<Object> get props => [];
}
