import 'package:flutter/material.dart';

Text showTitle(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 24.0,
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
      ),
    );

Text showTitleH2(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.blue.shade900,
        fontWeight: FontWeight.bold,
      ),
    );

Text showTitleH3(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.blue.shade900,
        fontWeight: FontWeight.w500,
      ),
    );

Text showTitleH3White(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
    );

Text showTitleH3Red(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.red.shade900,
        fontWeight: FontWeight.w500,
      ),
    );

Text showTitleH3Purple(String title) => Text(
      title,
      style: TextStyle(
        fontSize: 16.0,
        color: Colors.purple.shade700,
        fontWeight: FontWeight.w500,
      ),
    );