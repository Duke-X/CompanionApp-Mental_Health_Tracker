import 'package:demo_app/screen/home_screen.dart';
import 'package:demo_app/screen/messages_screen.dart';
import 'package:demo_app/screen/schedule_screen.dart';
import 'package:demo_app/screen/settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';

class NavBarRoots extends StatefulWidget {
  const NavBarRoots({super.key});

  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    //HOME SCREEN
    HomeScreen(),
    //MESSAGE SCREEN
    MessagesScreen(),
    //SCHEDULE SCREEN
    const ScheduleScreen(),
    //SETTINGS SCREEN
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(index: _selectedIndex,children: _screens,),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: lightColorScheme.primary,
            unselectedItemColor: lightColorScheme.onSurface,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(CupertinoIcons.chat_bubble_text_fill), label: "Messages"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month), label: "Schedule"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ]),
      ),
    );
  }
}
