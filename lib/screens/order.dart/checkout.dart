import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

import '../../bot_bar_nav.dart';

class CheckoutOrder extends StatelessWidget {
  const CheckoutOrder({Key? key}) : super(key: key);

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
                        text: 'Оформить заказ   88,34 р.',
                        press: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9.0)),
                            child: Container(
                              height: 280,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                      left: 20,
                                    ),
                                    child: Text(
                                      'Подтверждение номера телефона',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 18, right: 10),
                                    child: Text(
                                      'Введите код из СМС чтобы подтвердить номер +375 (29) 777-77-77',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        FeedFields(
                                          height: 50,
                                          width: 90,
                                          text: 'Код',
                                          keybord: TextInputType.number,
                                        ),
                                        Text(
                                          'Отправить код повторно через 0:08',
                                          style: TextStyle(fontSize: 9),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: <Widget>[
                                        AppOutlinedButton(
                                          text: 'Изменить номер',
                                          textStyle: TextStyle(
                                              fontSize: 12,
                                              color: AppColors.purple),
                                          press: () => showDialog<String>(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          9.0)),
                                              child: Container(
                                                  height: 220,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                  context,
                                                                );
                                                              },
                                                              icon: Icon(Icons
                                                                  .close))),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          bottom: 10.0,
                                                          left: 10,
                                                        ),
                                                        child: Text(
                                                          'Введите ваш номер',
                                                          style: TextStyle(
                                                              fontSize: 18),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      FeedFields(
                                                        height: 55,
                                                        width: 270,
                                                        text: '+375',
                                                        keybord: TextInputType
                                                            .number,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      AppOutlinedButton(
                                                          text: 'Сохранить',
                                                          press: () {
                                                            Navigator.pop(
                                                              context,
                                                            );
                                                          }),
                                                    ],
                                                  )),
                                            ),
                                          ),
                                        ),
                                        AppOutlinedButton(
                                            text: 'Подтвердить         ',
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                color: AppColors.purple),
                                            press: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CheckoutOrder()));
                                            }),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      Text(
                          'Стоимость заказа может измениться в меньшую сторону  после того как мы соберем покупку. В заказ будет добавлено необходимое колличество пакетов и их стоимость. Мы можем позвонить для уточнения деталей заказа. Будьте на связи'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      //bottomNavigationBar: BotNavBar(),
    );
  }
}
