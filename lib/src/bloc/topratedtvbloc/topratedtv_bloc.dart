import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/topratedtvbloc/topratedtv_event.dart';
import 'package:mvvm_apimovie/src/bloc/topratedtvbloc/topratedtv_state.dart';
import 'package:mvvm_apimovie/src/model/services/api_services.dart';
import 'package:mvvm_apimovie/src/model/tv_top_rated.dart';

class TvTopBloc extends Bloc<TvTopEvent, TvTopState> {
  TvTopBloc() : super(TvTopLoading());

  @override
  Stream<TvTopState> mapEventToState(TvTopEvent event) async* {
    if (event is TvTopEventStarted) {
      yield* _mapTvEventStateToState(event.tvId, event.query);
    }
  }

  Stream<TvTopState> _mapTvEventStateToState(int tvId, String query) async* {
    final service = ApiService();
    yield TvTopLoading();
    try {
      List<Tv> tvList;
      if (tvId == 0) {
        tvList = await service.getTopRatedTv();
      } else {
        print(tvId);
        tvList = await service.getTopRatedTvGenre(tvId);
      }

      yield TvTopLoaded(tvList);
    } on Exception catch (e) {
      print(e);
      yield TvTopError();
    }
  }
}
