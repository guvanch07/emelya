import 'package:flutter/material.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Container(
            width: double.infinity,
            height: 56,
            child: Center(
              child: Image.asset('assets/images/emelya.svg'),
            ))
      ],
    );
  }
}
