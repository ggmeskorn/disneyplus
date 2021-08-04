import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_apimovie/src/component/bottombar.dart';
import 'package:mvvm_apimovie/src/component/drawer.dart';

import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Colors.blue,
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "assets/images/logo.png",
                height: 100,
                width: 100,
              ),
            ],
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
        drawer: drawer(),
        body: Body(),
        bottomNavigationBar: bottomNavigationbar(),
    );
  }
}
