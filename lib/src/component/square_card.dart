import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';

class SquareCard extends StatelessWidget {
  const SquareCard({Key key, this.image, this.title, this.press})
      : super(key: key);
  final String image, title;
  final Function press;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: press,
          child: ClipRRect(
            child: CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) {
                return Container(
                  width: getProportionateScreenWidth(90),
                  height: getProportionateScreenHeight(120),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
              placeholder: (context, url) => Container(
                width: getProportionateScreenWidth(110),
                height: getProportionateScreenHeight(90),
                child: Center(
                  child: Platform.isAndroid
                      ? CircularProgressIndicator()
                      : CupertinoActivityIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: getProportionateScreenWidth(110),
                height: getProportionateScreenHeight(140),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_not_found.jpg'),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
