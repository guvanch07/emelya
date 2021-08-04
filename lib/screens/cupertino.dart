import 'package:emelya/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bot_bar_nav.dart';
import 'catalog/cotolog_view.dart';
import 'personal_account.dart/user_account_view.dart';
import 'search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int _currentIndex;
  late List<Widget> _children;

  @override
  void initState() {
    _currentIndex = 0;
    _children = [
      CotologView(),
      SearchProduct(),
      UserAccount(),
    ];
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [],
        ),
        tabBuilder: (BuildContext context, int index) {
          return CupertinoTabView(
            builder: (BuildContext context) {
              return SafeArea(
                top: false,
                bottom: false,
                child: CupertinoApp(
                  home: CupertinoPageScaffold(
                    resizeToAvoidBottomInset: false,
                    child: _children[_currentIndex],
                  ),
                ),
              );
            },
          );
        });
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
