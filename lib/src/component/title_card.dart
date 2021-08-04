import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class TitleCard extends StatelessWidget {
  const TitleCard({Key key, this.image, this.title, this.press}) : super(key: key);
  final String image, title;
  final Function press;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: image,
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
              placeholder: (context, url) => Platform.isAndroid
                  ? CircularProgressIndicator()
                  : CupertinoActivityIndicator(),
              errorWidget: (context, url, error) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_not_found.jpg'),
                  ),
                ),
              ),
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 15, left: 15),
          child: Text(
            title.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: getProportionateScreenHeight(14),
              fontFamily: 'muli',
            ),
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}
