//import 'package:carousel_pro/carousel_pro.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'colories.dart';
import 'counter.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Widget image_carousel = Container(
    //   width: 240,
    //   height: 123,
    //   color: Colors.white,
    //   child: Carousel(
    //     images: [
    //       new AssetImage('assets/images/cheese 2.png'),
    //       new AssetImage('assets/images/cheese 2.png'),
    //       new AssetImage('assets/images/cheese 2.png'),
    //     ],
    //     autoplay: false,
    //     dotColor: Color(0xFFAC4AEB),
    //     dotSize: 10.0,
    //     indicatorBgPadding: 1,
    //   ),
    // );

    return SafeArea(
        child: Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(child: TopScreen()),
              Text(
                'Сыр «Пошехонский»',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              Container(
                  width: 390,
                  height: 240,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                      ),
                      AppOutlinedButton(
                        press: () {},
                        text: '    В корзину  24,45р.          ',
                        padding: EdgeInsets.only(left: 20, right: 20, top: 10),
                      ),
                    ],
                  )),
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
                    width: 40,
                  ),
                  CounterPc(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
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
              AppBottomNavBar(),
            ],
          ),
        ),
      ),
    ));
  }
}
