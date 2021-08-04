import 'package:flutter/material.dart';

class bottomNavigationbar extends StatefulWidget {
  bottomNavigationbar({Key key}) : super(key: key);

  @override
  _bottomNavigationbarState createState() => _bottomNavigationbarState();
}

class _bottomNavigationbarState extends State<bottomNavigationbar> {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "หน้าหลัก",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.live_tv),
            title: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "ซีรีส์",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
        BottomNavigationBarItem(
          icon: ImageIcon(
            AssetImage(
              "assets/images/disneylogo.png",
            ),
            size: 50,
          ),
          title: Text(
            " ",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.local_movies),
            title: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "ภาพยนตร์",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.play_circle),
            title: Padding(
              padding: const EdgeInsets.only(top: 3),
              child: Text(
                "เอเชีย",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            )),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Theme.of(context).primaryColor,
      unselectedItemColor: Colors.grey,
      onTap: _onItemTapped,
    );
  }
}

