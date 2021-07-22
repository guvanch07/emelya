import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

class CheckoutOrder extends StatelessWidget {
  const CheckoutOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            TopScreen(),
            Padding(
              padding: const EdgeInsets.only(top: 117, left: 10, bottom: 51),
              child: Text(
                'Итоговая сумма оплаты не будет больше этой суммы, разницу вернем на карту',
                style: kStyleText,
              ),
            ),
            Divider(
              height: 20,
              thickness: 2,
              indent: 7,
              endIndent: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Text(
                  'Стоимость заказа',
                  style: kStyleTitleh2,
                ),
                SizedBox(
                  width: 50,
                ),
                Text(
                  '88,34 р.',
                  style: kStylePrice,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 70, left: 17, right: 17),
              child: Container(
                padding: EdgeInsets.all(15),
                height: 196,
                width: 382,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Color(0xFFEFEFEF)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AppOutlinedButton(
                        text: 'Оформить заказ   88,34 р.', press: () {}),
                    SizedBox(
                      height: 22,
                    ),
                    Text(
                        'Стоимость заказа может измениться в меньшую сторону  после того как мы соберем покупку. В заказ будет добавлено необходимое колличество пакетов и их стоимость. Мы можем позвонить для уточнения деталей заказа. Будьте на связи')
                  ],
                ),
              ),
            ),
            //Expanded(child: AppBottomNavBar())
          ],
        ),
      ),
    );
  }
}
