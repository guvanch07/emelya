//import 'package:carousel_pro/carousel_pro.dart';
import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/widgets/buttons/counter.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../bot_bar_nav.dart';
import '../../main.dart';
import 'boogmark.dart';
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
      backgroundColor: Color(0xFFFAFAFA),
      key: _scaffoldKey,
      endDrawer: DrawerPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.white,
                child: Column(children: [
                  TopScreen(),
                  Text(
                    'Сыр «Пошехонский»',
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              Container(
                color: Colors.white,
                height: 240.0,
                width: 390.0,
                padding: EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                          child: Container(
                            child: imageCarousel,
                            height: 135,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 70.0,
                          ),
                          child: BookMarkIcon(
                            color: AppColors.purple,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    AppOutlinedButton(
                      press: () {
                        Provider.of<CounterProduct>(context, listen: false)
                            .addBasket();
                      },
                      text: ' В корзину  24,45р.                            ',
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
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  CounterPc(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 135.0),
                child: Text('Пищевая ценность на 100 г.', style: kStyleText),
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
                height: 60.0,
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
