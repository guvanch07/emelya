import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({Key? key}) : super(key: key);

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
            UserButton(
              press: () {},
              text: 'Настройки',
              icon: Icon(Icons.settings, color: AppColors.purple),
            ),
            UserButton(
              press: () {},
              text: 'Управление картами',
              icon: Icon(Icons.money, color: AppColors.purple),
            ),
            UserButton(
              press: () {},
              text: 'История заказов',
              icon: Icon(Icons.credit_card, color: AppColors.purple),
            ),
            UserButton(
              press: () {},
              text: 'Моя история',
              icon:
                  Icon(Icons.favorite_border_outlined, color: AppColors.purple),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: 330,
              height: 400,
            )
          ],
        ),
      )),
    );
  }
}
