import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/screens/order.dart/payment.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

class UserData extends StatelessWidget {
  const UserData({Key? key}) : super(key: key);

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
              padding: const EdgeInsets.only(top: 40, bottom: 13, right: 200),
              child: Text(
                'Ваши данные',
                style: kStyleTitleh2,
              ),
            ),
            FeedFields(
              text: 'ФИО*',
              height: 55,
              suficon: Icon(
                Icons.check_circle_outline,
                color: AppColors.purple,
              ),
            ),
            SizedBox(
              height: 18,
            ),
            FeedFields(
              text: 'Hомер телефон',
              height: 55,
              suficon: Icon(
                Icons.check_circle_outline,
                color: AppColors.purple,
              ),
              labeltext: 'Номер телефона*',
              keybord: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 13, right: 160),
              child: Text(
                'Доставка сегодня',
                style: kStyleTitleh2,
              ),
            ),
            FeedFields(
              text: 'Ваш адрес',
              height: 55,
              suficon: Icon(
                Icons.check_circle_outline,
                color: AppColors.purple,
              ),
              labeltext: 'Ваш адрес*',
              keybord: TextInputType.multiline,
            ),
            SizedBox(
              height: 140,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  AppOutlinedButton(text: 'Отмена        ', press: () {}),
                  AppOutlinedButton(
                      text: 'Далее         ',
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaymentMethod()),
                        );
                      }),
                ]),
          ],
        ),
      ),
    ));
  }
}
