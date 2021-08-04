import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:flutter/material.dart';

import '../../bot_bar_nav.dart';

class AddCard extends StatefulWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  int _radioValue1 = 0;

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerPage(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: 360,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              FeedFields(
                text: 'Номер карты',
                height: 55,
                width: 370,
                keybord: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: FeedFields(
                  text: 'Имя владельца карты',
                  height: 55,
                  width: 370,
                  keybord: TextInputType.name,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FeedFields(
                      text: 'Срок',
                      height: 55,
                      width: 150,
                    ),
                    FeedFields(
                      text: 'CVV',
                      height: 55,
                      width: 150,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 15.0),
                child: Row(
                  children: [
                    Theme(
                      data: ThemeData(unselectedWidgetColor: AppColors.purple),
                      child: Radio(
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        activeColor: AppColors.purple,
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _radioValue1 = 1;
                        });
                      },
                      child: Text("Сохранить информацию о кредитной карте"),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AppOutlinedButton(
                      text: 'Отмена                   ',
                      press: () => Navigator.pop(context)),
                  AppOutlinedButton(
                      text: 'Сохранить             ',
                      press: () => Navigator.pop(context))
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}

class PayCash extends StatelessWidget {
  const PayCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          AppOutlinedButton(text: 'Отмена', press: () {}),
          AppOutlinedButton(text: 'Далее', press: () {})
        ],
      ),
    );
  }
}

class SelectCard extends StatelessWidget {
  const SelectCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[Container()],
    );
  }
}
