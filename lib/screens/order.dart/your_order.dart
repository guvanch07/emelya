import 'package:emelya/constants/app_colors.dart';
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
                  child: Container(
                      height: 45,
                      width: 80,
                      child:
                          Image(image: AssetImage('assets/images/mango.png'))),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 12),
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CountOrder(),
                          Text(
                            '31,96 р.',
                            style: kStylePrice,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     bottom: 120,
                //   ),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(Icons.close),
                //   ),
                // ),
              ],
            ),
          ),
          Divider(
            height: 20,
            thickness: 2,
            indent: 2,
            endIndent: 2,
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
                  child: Container(
                    width: 80,
                    height: 45,
                    child: Image(
                      image: AssetImage('assets/images/salmon.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: <Widget>[
                      Text(
                        "Форрель малосоленая филе",
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          CountOrder(),
                          Text(
                            '31,96 р.',
                            style: kStylePrice,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(
                //     bottom: 120,
                //   ),
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(Icons.close),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
