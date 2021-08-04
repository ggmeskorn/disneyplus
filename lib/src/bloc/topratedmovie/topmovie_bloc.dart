import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/topratedmovie/topmovie_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/topratedmovie/topmovie_bloc_state.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/model/services/api_services.dart';

class MovieTopBloc extends Bloc<MovieTopEvent, MovieTopState> {
  MovieTopBloc() : super(MovieTopLoading());

  @override
  Stream<MovieTopState> mapEventToState(MovieTopEvent event) async* {
    if (event is MovieTopEventStarted) {
      yield* _mapMovieTopEventStateToState(event.movieId, event.query);
    }
  }

  Stream<MovieTopState> _mapMovieTopEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield MovieTopLoading();
    try {
      List<Movie> movieList;
      if (movieId == 0) {
        movieList = await service.getTopRatedMovie();
      } else {
        print(movieId);
        movieList = await service.getTopRatedByGenre(movieId);
      }

      yield MovieTopLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield MovieTopError();
    }
  }
}
