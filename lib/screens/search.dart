import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';

import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../bot_bar_nav.dart';
import '../main.dart';
import 'menu.dart/menu_list.dart';

class SearchProduct extends StatelessWidget {
  static const String id = 'search_screen';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _controller = TextEditingController();

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
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TopScreen(),
              SizedBox(
                height: 43.0,
              ),
              FeedFields(
                controller: _controller,
                text: 'Введите название товара',
                icon: Icon(Icons.search, color: Colors.grey, size: 30),
                width: 370,
                height: 55,
              ),
              Container(
                margin: EdgeInsets.only(top: 140.0, bottom: 13.0),
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Color(0xFFFAFAFA),
                  shape: BoxShape.circle,
                ),
                child: Center(
                    child: SvgPicture.asset('assets/images/noproducts.svg')),
              ),
              Text(
                'Товары не найдены',
                style: TextStyle(color: Color(0xFFA7A7A7)),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}
