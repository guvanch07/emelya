import 'package:emelya/screens/product.dart/counter.dart';
import 'package:flutter/material.dart';

class YourOrder extends StatefulWidget {
  const YourOrder({Key? key}) : super(key: key);

  @override
  _YourOrderState createState() => _YourOrderState();
}

class _YourOrderState extends State<YourOrder> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 190),
            child: Text(
              'Ваш заказ',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            height: 145,
            width: 382,
            child: Row(
              children: <Widget>[
                Container(
                  height: 118,
                  width: 118,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Text(
                        "Манго",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '900 г.',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Осталось 52 кг.',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      Row(
                        children: <Widget>[
                          CountOrder(),
                        ],
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.close),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
