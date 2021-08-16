import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/models.dart/postingData.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/order.dart/payment.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bot_bar_nav.dart';

class UserData extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  final TextEditingController adressController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController floorController = TextEditingController();
  final TextEditingController enteranceController = TextEditingController();
  final TextEditingController apartController = TextEditingController();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerPage(),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TopScreen(),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 200),
                child: Text(
                  'Ваши данные',
                  style: kStyleTitleh2,
                ),
              ),
              AdressForm(
                controller: nameController,
                text: 'ФИО*',
                width: 370,
                keyboard: TextInputType.name,
              ),
              AdressForm(
                controller: numberController,
                text: 'Номер телефона*',
                width: 370,
                keyboard: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50, right: 160),
                child: Text(
                  'Доставка сегодня',
                  style: kStyleTitleh2,
                ),
              ),
              AdressForm(
                controller: adressController,
                text: 'Ваш адрес*',
                width: 370,
                keyboard: TextInputType.multiline,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AdressForm(
                    controller: houseController,
                    text: 'Дом',
                    width: 150,
                    keyboard: TextInputType.number,
                  ),
                  AdressForm(
                    controller: enteranceController,
                    text: 'Подъезд',
                    width: 150,
                    keyboard: TextInputType.number,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  AdressForm(
                    controller: floorController,
                    text: 'Этаж',
                    width: 150,
                    keyboard: TextInputType.number,
                  ),
                  AdressForm(
                    controller: apartController,
                    text: 'Квартира',
                    width: 150,
                    keyboard: TextInputType.number,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    AppOutlinedButton(
                      text: 'Отмена              ',
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                    AppOutlinedButton(
                        text: 'Далее               ',
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentMethod()),
                          );
                          Provider.of<UserDataPost>(context, listen: false)
                              .addData({
                            "title": nameController.text,
                            "description": numberController.text
                            // 'name': nameController.text,
                            // 'number': numberController.text,
                            // 'adress': adressController.text,
                            // 'house': houseController.text,
                            // 'enterence': enteranceController.text,
                            // 'floor': floorController.text,
                            // 'appartment': apartController.text,
                          });
                        }),
                  ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}
