import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_apimovie/constants.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';

import 'package:mvvm_apimovie/src/screens/home/components/titleheader.dart';
import 'package:mvvm_apimovie/src/screens/home/components/tv_rated.dart';

import '../../../../size_config.dart';
import 'movie_popular.dart';
import 'movie_top.dart';
import 'movie_upcoming.dart';
import 'movienowplaying.dart';

class Body extends StatefulWidget {
  Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleHeader(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      mySizebox(),
                      MovieNowPlaying(),
                      TvRated(),
                      MovieUpComing(),
                      MovieTopRated(),
                      MoviePopular(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
