import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/profil.dart';
import 'package:flutter_application_1/Pages/login.dart';
import 'package:flutter_application_1/Pages/dissatisfied.dart';
import 'package:flutter_application_1/Pages/love.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedTab = 0;

  List<Widget> _pages = [
    Home(),
    Scaffold(body: Center(child: Text("Search Page"))),
    Scaffold(body: Center(child: Text("Library Page"))),
    Profil(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Music Player'),
      ),
      body: _selectedTab == 1
          ? Profil()
          : Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.sentiment_very_dissatisfied,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dissatisfied()),
                        );
                      },
                    ),
                    backgroundColor: Colors.red,
                    radius: 40,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Love()),
                        );
                      },
                    ),
                    backgroundColor: Colors.pink,
                    radius: 40,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  CircleAvatar(
                    child: IconButton(
                      icon: Icon(
                        Icons.sentiment_satisfied,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                    backgroundColor: Colors.orange,
                    radius: 40,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            this._selectedTab = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: "logout",
          ),
        ],
      ),
    );
  }
}
