import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/constants.dart';
import 'package:mvvm_apimovie/src/bloc/topratedtvbloc/topratedtv_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/topratedtvbloc/topratedtv_event.dart';
import 'package:mvvm_apimovie/src/bloc/topratedtvbloc/topratedtv_state.dart';
import 'package:mvvm_apimovie/src/component/mysizedbox.dart';
import 'package:mvvm_apimovie/src/component/square_card.dart';
import 'package:mvvm_apimovie/src/model/tv_top_rated.dart';

import '../../../../size_config.dart';

class TvRated extends StatefulWidget {
  TvRated({Key key}) : super(key: key);

  @override
  _TvRatedState createState() => _TvRatedState();
}

class _TvRatedState extends State<TvRated> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TvTopBloc>(
          create: (_) => TvTopBloc()..add(TvTopEventStarted(0, '')),
        ),
      ],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          sectiontitle(context, "ซีรีส์ยอดนิยม", () {}),
          mySizebox(),
          BlocBuilder<TvTopBloc, TvTopState>(
            builder: (context, state) {
              if (state is TvTopLoading) {
                return Center();
              } else if (state is TvTopLoaded) {
                List<Tv> tvList = state.tvList;
                return mySizeboxSquareCard(
                  ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: getProportionateScreenWidth(15),
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: tvList.length == 0 ? 0 : 16,
                    itemBuilder: (context, index) {
                      Tv tv = tvList[index];
                      return SquareCard(
                        image:
                            'https://image.tmdb.org/t/p/original/${tv.posterPath}',
                        press: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         MovieDetailScreen(movie: movie),
                          //   ),
                          // );
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
