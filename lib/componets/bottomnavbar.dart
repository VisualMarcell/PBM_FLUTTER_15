import 'package:flutter/material.dart';
import 'package:cobaa/pages/home.dart';
import 'package:cobaa/pages/notification.dart';
import 'package:cobaa/pages/profil.dart';

class Bottomnavbar extends StatefulWidget {
  final String username;
  Bottomnavbar({Key? key, required this.username}) : super(key: key);

  @override
  State<Bottomnavbar> createState() => _BottomnavbarState();
}

class _BottomnavbarState extends State<Bottomnavbar> {
  int myIndex = 0;
  late List<Widget> _container;

  @override
  void initState() {
    _container = [
      Home(username: widget.username),
      Notif(),
      Profil(username: widget.username),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _container[myIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black45,
        showUnselectedLabels: true,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Beranda"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Notifikasi"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
        ],
      ),
    );
  }
}
