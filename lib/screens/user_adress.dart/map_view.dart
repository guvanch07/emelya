import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/user_adress.dart/mapbox.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bot_bar_nav.dart';

class MapAdress extends StatelessWidget {
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
              Container(width: 414.0, height: 420, child: MapBox()),
              Padding(
                padding: const EdgeInsets.only(top: 23.0, bottom: 20.0),
                child: Text(
                  'Адрес доставки',
                  style: kStyleTitleh1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: SvgPicture.asset('assets/icons/arrow.svg'),
                  ),
                  Text(
                    'Ваш адрес',
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              AppOutlinedButton(
                text: 'Ввести адрес                   ',
                press: () => showModalBottomSheet(
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => buildSheet(),
                ),
              ),
              SizedBox(
                height: 45.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}

Widget buildSheet() => Container(
      height: 600.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              FeedFields(
                width: 250,
                height: 55,
                text: 'Куда доставить?',
                icon: Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 55,
                height: 55,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9.0),
                    color: Color(0xffEFEFEF)),
                child: Text("Карта"),
              )
            ],
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 170),
              child: Text(
                'Начните вводить адрес Например “Куприянова 1А"',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ))
        ],
      ),
    );
