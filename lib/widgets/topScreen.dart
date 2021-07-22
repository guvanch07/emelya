import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopScreen extends StatelessWidget {
  // const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30.0,
            color: Colors.black,
            child: Center(
              child: Text(
                'Доставка товаров от 15 минут  и отлюбой суммы',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
              ),
            ),
          ),
          SizedBox(
            height: 22.0,
          ),
          Center(
            child: Container(
              width: 150,
              height: 30,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/emelya.svg',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
