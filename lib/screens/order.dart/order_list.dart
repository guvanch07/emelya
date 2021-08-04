import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/order.dart/user_data.dart';
import 'package:emelya/screens/order.dart/your_order.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

import '../../bot_bar_nav.dart';

class OrderList extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TopScreen(),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  'Оформление заказа',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    height: 350,
                    width: 382,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        color: Color(0xFFEFEFEF)),
                    child: YourOrder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 9.0, bottom: 30),
                child: Container(
                  height: 50,
                  width: 382,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6.0),
                      color: Color(0xFFEFEFEF)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'ИТОГО: ',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '88,34 р.',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppOutlinedButton(
                      text: 'Отмена          ',
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                    AppOutlinedButton(
                        text: 'Далее            ',
                        press: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserData()));
                        }),
                  ]),
              SizedBox(
                height: 30,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}
