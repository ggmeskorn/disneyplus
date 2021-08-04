import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc_event.dart';
import 'package:mvvm_apimovie/src/bloc/moviebloc/movie_bloc_state.dart';
import 'package:mvvm_apimovie/src/component/title_card.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/movie_detail_screen.dart';

class TitleHeader extends StatefulWidget {
  TitleHeader({Key key}) : super(key: key);

  @override
  _TitleHeaderState createState() => _TitleHeaderState();
}

class _TitleHeaderState extends State<TitleHeader> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBloc>(
          create: (_) => MovieBloc()..add(MovieEventStarted(0, '')),
        ),
      ],
      child: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return Center(
              child: Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(),
            );
          } else if (state is MovieLoaded) {
            List<Movie> movies = state.movieList;
            print(movies.length);
            return Column(
              children: <Widget>[
                CarouselSlider.builder(
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    Movie movie = movies[index];
                    return TitleCard(
                      title: movie.title,
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
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(microseconds: 500),
                    pauseAutoPlayOnTouch: true,
                    viewportFraction: 0.95,
                    enlargeCenterPage: true,
                  ),
                ),
              ],
            );
          } else {
            return Container(
              child: Text('SomeThing went Wrong!!'),
            );
          }
        },
      ),
    );
  }
}
