import 'package:flutter/material.dart';
import 'package:mvvm_apimovie/size_config.dart';

SizedBox mySizeboxSquareCard(Widget widgets) => SizedBox(
      height: getProportionateScreenHeight(130),
      child: widgets,
    );

SizedBox mySizeboxRectangleCard(Widget widgets) => SizedBox(
      height: getProportionateScreenHeight(100),
      child: widgets,
    );

SizedBox mySizebox() => SizedBox(
      height: getProportionateScreenHeight(10),
    );
