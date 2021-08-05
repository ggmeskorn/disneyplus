import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_apimovie/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailTitleCard extends StatelessWidget {
  final String image, title, youtube;
  const DetailTitleCard({Key key, this.image, this.title, this.youtube})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              final youtubeUrl = youtube;
              if (await canLaunch(youtubeUrl)) {
                await launch(youtubeUrl);
              }
            },
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl: image,
                height: getProportionateScreenHeight(250),
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
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15, left: 15),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
  