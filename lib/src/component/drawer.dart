import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_apimovie/constants.dart';

import 'list_title.dart';

Drawer drawer() {
  bool _switchValue = false;
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        mylisttitleheader(Icons.account_circle, 'Username', '+66 690988909',
            () {}, Icons.keyboard_arrow_right),
        ListTile(
          tileColor: Color(0xFFE3E3E3),
          title: Text(
            'KiDS Safe',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xffEAB53A)),
          ),
          onTap: () {
            // Update the state of the app.
            // ...
          },
          trailing: CupertinoSwitch(
            value: _switchValue, onChanged: (bool value) {},
            // onChanged: (value) {
            //   setState(() {
            //     _switchValue = value;
            //   });
            // },
          ),
        ),
        mylisttitle(
            Icons.download_outlined,
            'ดาวน์โหลด',
            'รับชมวิดีโอแบบโดยไม่เชื่อมต่อกับอินเทอร์เน็ต',
            () {},
            Icons.keyboard_arrow_right),
        mylisttitle(Icons.check_outlined, 'รายการรับชม',
            'บันทึกไว้รับชมภายหลัง', () {}, Icons.keyboard_arrow_right),
        mylisttitlesub(Icons.theater_comedy_rounded, 'ประเภท', () {},
            Icons.keyboard_arrow_right),
        mylisttitlesub(
            Icons.help, 'ความช่วยเหลือ', () {}, Icons.keyboard_arrow_right),
        mylisttitlesub(Icons.settings_rounded, 'การตั้งค่า', () {},
            Icons.keyboard_arrow_right),
      ],
    ),
  );
}
