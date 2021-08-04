import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/constants.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc_state.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';
import 'package:mvvm_apimovie/src/component/rectangle_card.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/movie_detail_screen.dart';

import '../../../../size_config.dart';

class MovieNowPlaying extends StatefulWidget {
  final int selectedGenre;

  MovieNowPlaying({Key key, this.selectedGenre = 28}) : super(key: key);

  @override
  _MovieNowPlayingState createState() => _MovieNowPlayingState();
}

class _MovieNowPlayingState extends State<MovieNowPlaying> {
  int selectedGenre;

  @override
  void initState() {
    super.initState();
    selectedGenre = widget.selectedGenre;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(selectedGenre, '')),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectiontitle(context, "กำลังเล่น", () {}),
          BlocBuilder<MovieBloc, MovieState>(
            builder: (context, state) {
              if (state is MovieLoading) {
                return Center();
              } else if (state is MovieLoaded) {
                List<Movie> movieList = state.movieList;
                return mySizeboxRectangleCard(
                  ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: getProportionateScreenWidth(15),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length == 0 ? 0 : 8,
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
