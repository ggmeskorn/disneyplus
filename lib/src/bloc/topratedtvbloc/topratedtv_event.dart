import 'package:equatable/equatable.dart';

abstract class TvTopEvent extends Equatable {
  const TvTopEvent();
}

class TvTopEventStarted extends TvTopEvent {
  final int tvId;
  final String query;

  const TvTopEventStarted(this.tvId, this.query);

  @override
  List<Object> get props => [];
}
