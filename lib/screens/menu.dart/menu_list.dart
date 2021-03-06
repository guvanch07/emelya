import 'package:emelya/main.dart';
import 'package:emelya/screens/menu.dart/contacts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bot_bar_nav.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // void _openEndDrawer() {
  //   _scaffoldKey.currentState!.openEndDrawer();
  // }

  // void _closeEndDrawer() {
  //   Navigator.of(context).pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: 180,
                color: Color(0xff01ECFB),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 130, left: 20),
                      child: Container(
                        child: SvgPicture.asset('assets/images/emelya.svg'),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 43),
                        child: Image(
                          image: AssetImage('assets/images/carlson.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, right: 20),
                child: Container(
                  height: 200,
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: <Widget>[
                          GestureDetector(
                              child: Text("??????????",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black)),
                              onTap: () {}),
                          GestureDetector(
                              child: Text("????????????????",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black)),
                              onTap: () {}),
                          GestureDetector(
                              child: Text("????????????????",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Contacts()),
                                );
                              }),
                          GestureDetector(
                              child: Text("?? ??????",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black)),
                              onTap: () {})
                        ],
                      )),
                ),
              ),
            ],
          ),
        ),
      ),

      //bottomNavigationBar: BotNavBar(),
    );
  }
}
