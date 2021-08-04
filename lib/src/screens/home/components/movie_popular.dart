import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/constants.dart';
import 'package:mvvm_apimovie/src/bloc/popularbloc/popular_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/popularbloc/popular_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/popularbloc/popular_bloc_state.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';
import 'package:mvvm_apimovie/src/component/square_card.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/movie_detail_screen.dart';

import '../../../../size_config.dart';

class MoviePopular extends StatefulWidget {
  MoviePopular({Key key}) : super(key: key);

  @override
  _MoviePopularState createState() => _MoviePopularState();
}

class _MoviePopularState extends State<MoviePopular> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularBloc>(
          create: (_) => PopularBloc()..add(PopularEventStarted(0, '')),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectiontitle(context, "ยอดนิยม", () {}),
          mySizebox(),
          BlocBuilder<PopularBloc, PopularState>(
            builder: (context, state) {
              if (state is PopularLoading) {
                return Center();
              } else if (state is PopularLoaded) {
                List<Movie> movieList = state.movieList;
                return mySizeboxSquareCard(
                  ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: getProportionateScreenWidth(15),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: movieList.length == 0 ? 0 : 16,
                    itemBuilder: (context, index) {
                      Movie movie = movieList[index];
                      return SquareCard(
                        image:
                            'https://image.tmdb.org/t/p/original/${movie.posterPath}',
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
