import 'package:flutter/material.dart';

ListTile mylisttitleheader(IconData leadingicondata, String title,
        String subtitle, Function ontap, IconData trailingticondata) =>
    ListTile(
      leading: Icon(
        leadingicondata,
        color: Colors.blue,
        size: 6,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 13),
      ),
      onTap: ontap,
      trailing: Icon(trailingticondata),
    );

ListTile mylisttitle(IconData leadingicondata, String title, String subtitle,
        Function ontap, IconData trailingticondata) =>
    ListTile(
      leading: Icon(
        leadingicondata,
        color: Colors.blue,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 9),
      ),
      onTap: ontap,
      trailing: Icon(trailingticondata),
    );

ListTile mylisttitlesub(IconData leadingicondata, String title, Function ontap,
        IconData trailingticondata) =>
    ListTile(
      leading: Icon(
        leadingicondata,
        color: Colors.blue,
        size: 30,
      ),
      title: Text(
        title,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black),
      ),
      onTap: ontap,
      trailing: Icon(trailingticondata),
    );
