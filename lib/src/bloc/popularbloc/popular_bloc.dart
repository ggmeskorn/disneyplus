import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/model/services/api_services.dart';

import 'popular_bloc_event.dart';
import 'popular_bloc_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularLoading());

  @override
  Stream<PopularState> mapEventToState(PopularEvent event) async* {
    if (event is PopularEventStarted) {
      yield* _mapPopularEventStateToState(event.movieId, event.query);
    }
  }

  Stream<PopularState> _mapPopularEventStateToState(
      int movieId, String query) async* {
    final service = ApiService();
    yield PopularLoading();
    try {
      List<Movie> movieList;
  if (movieId == 0) {
        movieList = await service.getPopularMovie();
      }
      else {
        print(movieId);
        movieList = await service.getPopularByGenre(movieId);
      }

      yield PopularLoaded(movieList);
    } on Exception catch (e) {
      print(e);
      yield PopularError();
    }
  }
}
