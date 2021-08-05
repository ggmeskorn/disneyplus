import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviedetailbloc/movie_detail_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviedetailbloc/movie_detail_state.dart';
import 'package:mvvm_apimovie/src/component/detail_title_card.dart';
import 'package:mvvm_apimovie/src/component/title_card.dart';
import 'package:mvvm_apimovie/src/model/movie_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTitle extends StatefulWidget {
  DetailTitle({Key key}) : super(key: key);

  @override
  _DetailTitleState createState() => _DetailTitleState();
}

class _DetailTitleState extends State<DetailTitle> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      builder: (context, state) {
        if (state is MovieDetailLoading) {
          return Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(),
          );
        } else if (state is MovieDetailLoaded) {
          MovieDetail movieDetail = state.detail;
          return Stack(
            children: [
              DetailTitleCard(
                title: movieDetail.title.toUpperCase(),
                image:
                    'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
                youtube:
                    'https://www.youtube.com/embed/${movieDetail.trailerId}',
              ),
            ],
          );
          // TitleCard(
          //           title: movieDetail.title,
          //           image:
          //               'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
          //           press: () {
          //             // Navigator.push(
          //             //   context,
          //             //   MaterialPageRoute(
          //             //     builder: (context) => MovieDetailScreen(movie: movie),
          //             //   ),
          //             // );
          //           },
          //         );
        } else {
          return Container(
            child: Text('SomeThing went Wrong!!'),
          );
        }
      },
    );
    // ClipPath(
    //               child: ClipRRect(
    //                 child: CachedNetworkImage(
    //                   imageUrl:
    //                       'https://image.tmdb.org/t/p/original/${movieDetail.backdropPath}',
    //                   height: MediaQuery.of(context).size.height / 2,
    //                   width: double.infinity,
    //                   fit: BoxFit.cover,
    //                   placeholder: (context, url) => Platform.isAndroid
    //                       ? CircularProgressIndicator()
    //                       : CupertinoActivityIndicator(),
    //                   errorWidget: (context, url, error) => Container(
    //                     decoration: BoxDecoration(
    //                       image: DecorationImage(
    //                         image:
    //                             AssetImage('assets/images/img_not_found.jpg'),
    //                       ),
    //                     ),
    //                   ),
    //                 ),
    //                 borderRadius: BorderRadius.only(
    //                   bottomLeft: Radius.circular(30),
    //                   bottomRight: Radius.circular(30),
    //                 ),
    //               ),
    //             ),
  }
}
