import 'package:flutter/material.dart';
import 'package:medico_project/constants/global_variables.dart';
import 'package:medico_project/features/Animations/screens/animations_screen.dart';
import 'package:medico_project/features/chat/screens/chat_screens.dart';
import 'package:medico_project/features/home/screens/home_screen.dart';

class BottomBar extends StatefulWidget {
  List<Widget> pages = [
    HomeScreen(),
    AnimationScreen(),
    ChatScreen()
  ];

  int _page = 0;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final double bottombarWidth = 48;
  final double bottombarBorderWidth = 5;

  void updatePage(int page){
    setState(() {
      widget._page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages[widget._page],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: widget._page,
          onTap: updatePage,
          selectedItemColor: GlobalVariables.selectedNavbarColor,
          unselectedItemColor: GlobalVariables.unselectedNavbarColor,
          backgroundColor: GlobalVariables.backgroundColor,
          iconSize: 28,
          items: [
            BottomNavigationBarItem(
                icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: widget._page == 0
                    ? GlobalVariables.selectedNavbarColor
                    : GlobalVariables.backgroundColor,
                width: bottombarBorderWidth
              ),)),
              child: Icon(Icons.home),
            ),
            label: ''
            ),
            BottomNavigationBarItem(
                icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: widget._page == 1
                    ? GlobalVariables.selectedNavbarColor
                    : GlobalVariables.backgroundColor,
                width: bottombarBorderWidth
              ),)),
              child: Icon(Icons.animation),
            ),
            label: ''
            ),
            BottomNavigationBarItem(
                icon: Container(
              width: bottombarWidth,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                color: widget._page == 2
                    ? GlobalVariables.selectedNavbarColor
                    : GlobalVariables.backgroundColor,
                width: bottombarBorderWidth
              ),)),
              child: Icon(Icons.chat_bubble_rounded),
            ),
            label: ''
            ),
            
          ]),
    );
  }
}
