import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class Calories extends StatelessWidget {
  const Calories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 30),
        Column(
          children: [
            Text(
              '348,3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Ккал',
              style: kStyleText,
            ),
          ],
        ),
        SizedBox(width: 30),
        Column(
          children: [
            Text(
              '27,9',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Белки (г)',
              style: kStyleText,
            ),
          ],
        ),
        SizedBox(width: 30),
        Column(
          children: [
            Text(
              '26,3',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              'Жиры (г)',
              style: kStyleText,
            ),
          ],
        ),
      ],
    );
  }
}

class PriceWeight extends StatelessWidget {
  const PriceWeight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 30.0, right: 20),
          margin: EdgeInsets.symmetric(horizontal: 13.0),
          height: 66.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0), color: Colors.white),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Цена за 1 кг',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    '35,5руб',
                    style: kStyleText,
                  ),
                ],
              ),

              SizedBox(
                width: 25,
              ),
              Container(
                width: 1,
                height: 45,
                color: Colors.grey,
              ),
              SizedBox(
                width: 25,
              ),
              //VerticalDivider(thickness: 3, color: Colors.black,),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Страна производителя',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    'Беларусь',
                    style: kStyleText,
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, top: 30.0, right: 10),
          child: Text(
            'Состав: молоко коровье пастеризованное, пищевая соль, закваска мезофильных, термофильных молочнокислых микроорганизмов, молокосвертывающий ферментный препарат животного происхождения, уплотнитель – хлорид кальция, краситель пищевой аннато',
            style: kStyleText,
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 80),
              child: Text(
                'Годен: 20 суток',
                style: kStyleText,
              ),
            ),
            Text(
              'Вес/объем: 220 г',
              style: kStyleText,
            ),
          ],
        ),
      ],
    );
  }
}
