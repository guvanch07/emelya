import 'dart:ui';

import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/screens/menu.dart/feedback.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Contacts extends StatelessWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopScreen(),
            Padding(
              padding: const EdgeInsets.only(right: 160.0),
              child: Text(
                'Контакты',
                style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 20),
              child: Row(
                children: [
                  Text('Минск'),
                  Text(
                    '+375 (29) 666-66-66',
                    style: TextStyle(color: Color(0xFFAC4AEB)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 15),
              child: Row(children: [
                Text('Каждый ден'),
                Text(
                  ' с 9.00 до 21.00',
                  style: TextStyle(color: Color(0xFFAC4AEB)),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, top: 15),
              child: Text(
                  'Друзья, мы любим общаться и искренне радуемся вашей обратной связи! Сотрудники горячей линии помогут вам по любым вопросам. '),
            ),
            SizedBox(
              height: 31,
            ),
            Text(
              'Хотите работать у нас?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone_outlined,
                  color: Color(0xFFAC4AEB),
                ),
                Text(
                  '+375 (29) 666-66-66',
                  style: TextStyle(color: Color(0xFFAC4AEB)),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.email_outlined,
                  color: Color(0xFFAC4AEB),
                ),
                Text(
                  'knv@proviant.by',
                  style: TextStyle(color: Color(0xFFAC4AEB)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Отдел по работе с В2В-клиентами',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone_outlined,
                  color: Color(0xFFAC4AEB),
                ),
                Text(
                  '+375 (29) 666-66-66',
                  style: TextStyle(color: Color(0xFFAC4AEB)),
                ),
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.email_outlined,
                  color: Color(0xFFAC4AEB),
                ),
                Text(
                  'knv@proviant.by',
                  style: TextStyle(color: Color(0xFFAC4AEB)),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  child: Row(children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(right: 3),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10)),
                      child: (SvgPicture.asset('assets/icons/vk.svg')),
                    ),
                    Text(
                      'Vkontakte',
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                  onTap: () {},
                ),
                SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  child: Row(children: <Widget>[
                    Container(
                      child: (SvgPicture.asset('assets/icons/insta.svg')),
                    ),
                    Text(
                      'Instagram',
                      style: TextStyle(fontSize: 18),
                    )
                  ]),
                  onTap: () {},
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            AppOutlinedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedBackUser(),
                  ),
                );
              },
              text: 'Обратная связь',
              textStyle: TextStyle(fontSize: 18, color: AppColors.purple),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                children: [
                  GestureDetector(
                      child: Text("Публичная оферта",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black)),
                      onTap: () {}),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      child: Text("Правил сайта",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black)),
                      onTap: () {}),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      child: Text("Политика конфиденциальности",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black)),
                      onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
