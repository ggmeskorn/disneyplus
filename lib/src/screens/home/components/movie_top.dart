import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/topratedmovie/topmovie_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/topratedmovie/topmovie_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/topratedmovie/topmovie_bloc_state.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';
import 'package:mvvm_apimovie/src/component/rectangle_card.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/movie_detail_screen.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';

class MovieTopRated extends StatefulWidget {
  MovieTopRated({Key key}) : super(key: key);

  @override
  _MovieTopRatedState createState() => _MovieTopRatedState();
}

class _MovieTopRatedState extends State<MovieTopRated> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieTopBloc>(
          create: (_) => MovieTopBloc()..add(MovieTopEventStarted(0, '')),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectiontitle(context, "หนังดีตลอดการ", () {}),
          BlocBuilder<MovieTopBloc, MovieTopState>(
            builder: (context, state) {
              if (state is MovieTopLoading) {
                return Center();
              } else if (state is MovieTopLoaded) {
                List<Movie> movieList = state.movieList;
                return mySizeboxRectangleCard(
                  ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: getProportionateScreenWidth(15),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length == 0 ? 0 : 16,
                    itemBuilder: (context, index) {
                      Movie movie = movieList[index];
                      return RectangleCard(
                        image:
                            'https://image.tmdb.org/t/p/original/${movie.backdropPath}',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  MovieDetailScreen(movie: movie),
                            ),
                          );
                        },
                      );
                    },
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
