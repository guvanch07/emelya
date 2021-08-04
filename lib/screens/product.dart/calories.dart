import 'package:flutter/material.dart';

import '../../main.dart';

class Calories extends StatelessWidget {
  const Calories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Column(
          children: [
            Text(
              '348,3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text('Ккал'),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              '27,9',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text('Белки (г)'),
          ],
        )),
        Expanded(
            child: Column(
          children: [
            Text(
              '26,3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text('Жиры (г)'),
          ],
        )),
      ],
    );
  }
}

class PriceWeight extends StatelessWidget {
  const PriceWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Column(
                children: [
                  Text(
                    'Цена за 1 кг',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text('35,5руб'),
                ],
              ),
            ),
            VerticalDivider(thickness: 3, color: Colors.black),
            Container(
                child: Column(
              children: [
                Text(
                  'Страна производителя',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text('Беларусь'),
              ],
            )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 10),
          child: Text(
              'Состав: молоко коровье пастеризованное, пищевая соль, закваска мезофильных, термофильных молочнокислых микроорганизмов, молокосвертывающий ферментный препарат животного происхождения, уплотнитель – хлорид кальция, краситель пищевой аннато'),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text('Годен: 20 суток'),
            Text('Вес/объем: 220 г'),
          ],
        ),
      ],
    );
  }
}
