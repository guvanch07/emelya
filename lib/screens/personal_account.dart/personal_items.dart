import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/catalog/catalog.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/screens/order.dart/checkout.dart';
import 'package:emelya/screens/user_adress.dart/map_view.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PayCashPayment extends StatelessWidget {
  const PayCashPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          AppOutlinedButton(
              text: 'Отмена             ',
              press: () {
                Navigator.pop(
                  context,
                );
              }),
          AppOutlinedButton(
              text: 'Далее             ',
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckoutOrder()));
              }),
        ],
      ),
    );
  }
}

class SelectedCard extends StatelessWidget {
  const SelectedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 25, right: 250, bottom: 12),
        child: Text('Мои карты'),
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
            Text('**** **** ****  7777'),
            SizedBox(
              width: 100,
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.close))
          ],
        ),
      ),
      SizedBox(
        height: 18,
      ),
      AppOutlinedButton(
          text: '+     Добавить карту       ',
          press: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddCard()),
            );
          }),
    ]);
  }
}

class SelectAdress extends StatelessWidget {
  const SelectAdress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AdressForm(
          text: 'Введите ваш номер',
          width: 370,
          keyboard: TextInputType.number,
        ),
        AdressForm(
          text: 'Введите ваше имя',
          width: 370,
          keyboard: TextInputType.name,
        ),
        SizedBox(
          height: 18,
        ),
        AppOutlinedButton(
            text: '+   Добавить адрес    ',
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MapAdress(),
                ),
              );
            }),
      ],
    );
  }
}

class UserHistory extends StatelessWidget {
  const UserHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 230),
          child: Text('Все товары'),
        ),
        Container(
          height: 185,
          width: 280,
          alignment: Alignment.center,
          child: SvgPicture.asset('assets/images/nohidtory.svg'),
        ),
        Text(
          'Здесь будут ваши избранные товары',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class UserOrders extends StatelessWidget {
  const UserOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 30.0, bottom: 13.0),
          height: 130,
          width: 130,
          decoration: BoxDecoration(
            color: Color(0xFFFAFAFA),
            shape: BoxShape.circle,
          ),
          child:
              Center(child: SvgPicture.asset('assets/images/noproducts.svg')),
        ),
        Text(
          'Нет истории заказов',
          style: TextStyle(color: Color(0xFFA7A7A7)),
        ),
      ],
    );
  }
}

class AddCardPayment extends StatelessWidget {
  const AddCardPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
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
        SelectedCard(),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            AppOutlinedButton(
              text: 'Отмена          ',
              press: () {
                Navigator.pop(context);
              },
            ),
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
    );
  }
}
