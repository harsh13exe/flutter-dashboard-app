import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'leaderboard_screen.dart';
import 'announcements_screen.dart';

class MainNavScreen extends StatefulWidget {
  final String internName;

  const MainNavScreen({required this.internName});

  @override
  _MainNavScreenState createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      DashboardScreen(internName: widget.internName),
      LeaderboardScreen(),
      AnnouncementsScreen(),
    ];

    final List<String> _titles = ["Dashboard", "Leaderboard", "Announcements"];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(75),
        child: AppBar(
          title: Text(
            _titles[_currentIndex],
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
          ),

          centerTitle: true,
          backgroundColor: Colors.deepPurple.shade500,
          elevation: 6,
          shadowColor: Colors.deepPurple.shade200,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(24)),
          ),
        ),
      ),

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard),
            label: 'Leaderboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: 'Announcements',
          ),
        ],
      ),
    );
  }
}
