import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:flutter/material.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  bool _character = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                height: 20,
              ),
              ListTile(
                contentPadding: EdgeInsets.only(
                  left: 8,
                ),
                title: const Text(
                  'Сохранить информацию о кредитной карте',
                  style: kStyleText,
                ),
                leading: Radio(
                  visualDensity: VisualDensity(vertical: -4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.purple,
                  value: _character,
                  groupValue: _character,
                  onChanged: (value) {
                    setState(() {
                      value = !_character;
                    });
                  },
                ),
              ),
              AppOutlinedButton(
                  text: 'Сохранить                       ', press: () {})
            ],
          ),
        ),
      ),
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
