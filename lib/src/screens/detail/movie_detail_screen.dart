
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviedetailbloc/movie_detail_bloc.dart';
import 'package:mvvm_apimovie/src/bloc/moviedetailbloc/movie_detail_event.dart';
import 'package:mvvm_apimovie/src/model/movie.dart';
import 'package:mvvm_apimovie/src/screens/detail/components/body.dart';

class MovieDetailScreen extends StatelessWidget {
  final Movie movie;

  const MovieDetailScreen({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MovieDetailBloc()..add(MovieDetailEventStated(movie.id)),
    
        child: Scaffold(
           appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue,
        ),
        title: Text(
          movie.title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print('Click Menu');
                },
                child: Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 24.0,
                ),
              )),
        ],
      ),
          body: Body(),
        ),
      
    );
  }
}
