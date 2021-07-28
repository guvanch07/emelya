import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/screens/personal_account.dart/personal_items.dart';
import 'package:emelya/widgets/buttons/elevated_button.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bot_bar_nav.dart';

class UserAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TopScreen(),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 18),
                child: Text(
                  'Личный кабинет',
                  style: kStyleTitleh1,
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Color(0xFFEFEFEF),
                  child: Icon(
                    Icons.person_outline_rounded,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                'Виктория Вика',
                style: kStyleTitleh2,
              ),
              SizedBox(
                height: 10,
              ),
              UserBut(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(),
    );
  }
}

class UserBut extends StatefulWidget {
  const UserBut({Key? key}) : super(key: key);

  @override
  _UserButState createState() => _UserButState();
}

class _UserButState extends State<UserBut> {
  Widget text = SelectAdress();
  Color currentColor = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserButton(
          press: () => setState(
            () => text = SelectAdress(),
          ),
          text: 'Настройки',
          icon: 'settings',
          onColorChanged: (color) =>
              setState(() => currentColor = Colors.purple),
        ),
        UserButton(
          press: () => setState(() => text = SelectedCard()),
          text: 'Управление картами',
          icon: 'dollar',
          onColorChanged: (color) =>
              setState(() => currentColor = Colors.purple),
        ),
        UserButton(
          press: () => setState(() => text = UserOrders()),
          text: 'История заказов',
          icon: 'history',
          onColorChanged: (color) =>
              setState(() => currentColor = Colors.purple),
        ),
        UserButton(
          press: () => setState(() => text = UserHistory()),
          text: 'Моя история',
          icon: 'favorite',
          onColorChanged: (color) =>
              setState(() => currentColor = Colors.purple),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: (text),
        )
      ],
    );
  }
}
