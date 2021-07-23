import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkout.dart';

class PaymentMethod extends StatefulWidget {
  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  bool _isSelected = false;

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
              padding: const EdgeInsets.only(top: 17.0, bottom: 15, right: 180),
              child: Text(
                'Способ оплаты',
                style: kStyleTitleh2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 18,
              ),
              child: Text(
                'Вы можете выбрать способ оплаты “Картой при получнии”. Тогда привязывать карту не нужно',
                style: kStyleText,
              ),
            ),
            RadioButton(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 18,
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       CheckBoxButton(
            //         child: Icon(
            //           Icons.circle_rounded,
            //           color: AppColors.purple,
            //           size: 20,
            //         ),
            //         press: () {},
            //         shape: BoxShape.circle,
            //       ),
            //       SizedBox(
            //         width: 13,
            //       ),
            //       Text(
            //         'Наличными при получении',
            //         style: kStyleText,
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     left: 18,
            //     top: 15,
            //   ),
            //   child: Row(
            //     children: <Widget>[
            //       CheckBoxButton(
            //         child: Icon(
            //           Icons.circle_rounded,
            //           color: AppColors.purple,
            //           size: 20,
            //         ),
            //         press: () {},
            //         shape: BoxShape.circle,
            //       ),
            //       SizedBox(
            //         width: 13,
            //       ),
            //       Text(
            //         'Картой при получении',
            //         style: kStyleText,
            //       )
            //     ],
            //   ),
            // ),
            // Padding(
            //     padding: const EdgeInsets.only(
            //       left: 18,
            //       top: 15,
            //     ),
            //     child: Row(
            //       children: <Widget>[
            //         CheckBoxButton(
            //           child: Icon(
            //             Icons.circle_rounded,
            //             color: AppColors.purple,
            //             size: 20,
            //           ),
            //           press: () {},
            //           shape: BoxShape.circle,
            //         ),
            //         SizedBox(
            //           width: 13,
            //         ),
            //         Text(
            //           'Картой онлайн — Добавить новую карту',
            //           style: kStyleText,
            //         )
            //       ],
            //     )),
            Padding(
              padding: const EdgeInsets.only(right: 200, top: 20, bottom: 12),
              child: Text(
                'Выберете карту',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Arial',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0, right: 12.0),
              height: 55,
              width: 370,
              decoration: new BoxDecoration(
                  color: Color(0xFFEFEFEF),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(9.0),
                  )),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SvgPicture.asset('assets/icons/visa.svg'),
                  ),
                  Text('**** **** ****  7777')
                ],
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Container(
              margin: const EdgeInsets.only(left: 12.0, right: 12.0),
              height: 55,
              width: 370,
              decoration: new BoxDecoration(
                  color: Color(0xFFEFEFEF),
                  borderRadius: new BorderRadius.all(
                    new Radius.circular(9.0),
                  )),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SvgPicture.asset('assets/icons/visa.svg'),
                  ),
                  Text('**** **** ****  7777')
                ],
              ),
            ),

            SizedBox(
              height: 15,
            ),
            AppOutlinedButton(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCard()),
                );
              },
              text: 'Добавить карту                                  ',
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                AppOutlinedButton(text: 'Отмена          ', press: () {}),
                AppOutlinedButton(
                  text: 'Далее          ',
                  press: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0)),
                      child: Container(
                        height: 290,
                        child: Column(
                          children: <Widget>[
                            Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    },
                                    icon: Icon(Icons.close))),
                            Padding(
                              padding: const EdgeInsets.only(
                                bottom: 10.0,
                              ),
                              child: Text(
                                'Комментарий к заказу',
                                style: TextStyle(fontSize: 18),
                              ),
                            ),
                            FeedFields(
                              width: 270,
                              height: 130,
                              text: 'Напишите комментарий к заказу.'
                                  'Например, пожелание в какое колличество'
                                  'пакетов сложить продукты или другие'
                                  'детали, которые важно знать при сборке.'
                                  'Нужна сдача с____р.',
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                AppOutlinedButton(
                                    text: 'Отмена        ',
                                    press: () {
                                      Navigator.pop(
                                        context,
                                      );
                                    }),
                                AppOutlinedButton(
                                    text: 'Далее        ',
                                    press: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CheckoutOrder()));
                                    }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
