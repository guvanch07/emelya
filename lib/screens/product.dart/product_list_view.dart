//import 'package:carousel_pro/carousel_pro.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bot_bar_nav.dart';
import '../../main.dart';
import 'calories.dart';
import 'counter.dart';

class ProductList extends StatelessWidget {
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
              Center(
                child: Text(
                  'Сыр «Пошехонский»',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                width: 390,
                height: 240,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Container(
                        child: imageCarousel,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    AppOutlinedButton(
                      press: () {},
                      text: '    В корзину  24,45р.          ',
                      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'В наличии 4 кг',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  CounterPc(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0),
                child: Text(
                  'Пищевая ценность на 100 г.',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Calories(),
              SizedBox(
                height: 25.0,
              ),
              PriceWeight(),
              SizedBox(
                height: 30.0,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}

Widget imageCarousel = SizedBox(
  width: 260,
  height: 140,
  child: Carousel(
    boxFit: BoxFit.cover,
    images: [
      new AssetImage('assets/images/cheese 2.png'),
      new AssetImage('assets/images/cheese 2.png'),
      new AssetImage('assets/images/cheese 2.png'),
    ],
    autoplay: false,
    dotColor: Colors.black,
    dotSize: 6.0,
    dotIncreasedColor: Color(0xFFAC4AEB),
    dotPosition: DotPosition.bottomCenter,
    dotBgColor: Colors.transparent,
    dotVerticalPadding: 0,
    indicatorBgPadding: 0,
    dotIncreaseSize: 2,
  ),
);
