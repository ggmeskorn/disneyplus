import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/upcomingbloc/upcoming_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/upcomingbloc/upcoming_bloc_state.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/model/services/api_services.dart';


class UpComingBloc extends Bloc<UpComingEvent, UpComingState> {
  UpComingBloc() : super(UpComingLoading());

  @override
  Stream<UpComingState> mapEventToState(UpComingEvent event) async* {
    if (event is UpComingEventStarted) {
      yield* _mapUpComingEventStateToState(event.movieId, event.query);
    }
  }

  Stream<UpComingState> _mapUpComingEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield UpComingLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getUpcomingMovie();
      }
      else {
        print(movieId);
        movieList = await service.getUpcomingByGenre(movieId);
      }

      yield UpComingLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield UpComingError();
    }
  }
}
