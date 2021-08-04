import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/constants.dart';
import 'package:mvvm_apimovie/src/bloc/upcomingbloc/upcoming_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/upcomingbloc/upcoming_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/upcomingbloc/upcoming_bloc_state.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';
import 'package:mvvm_apimovie/src/component/rectangle_card.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/movie_detail_screen.dart';

import '../../../../size_config.dart';

class MovieUpComing extends StatefulWidget {
  MovieUpComing({Key key}) : super(key: key);

  @override
  _MovieUpComingState createState() => _MovieUpComingState();
}

class _MovieUpComingState extends State<MovieUpComing> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpComingBloc>(
          create: (_) => UpComingBloc()..add(UpComingEventStarted(0, '')),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectiontitle(context, "เร็ว ๆ นี้", () {}),
          BlocBuilder<UpComingBloc, UpComingState>(
            builder: (context, state) {
              if (state is UpComingLoading) {
                return Center();
              } else if (state is UpComingLoaded) {
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
