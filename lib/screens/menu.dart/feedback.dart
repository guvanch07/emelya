import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

import '../../bot_bar_nav.dart';
import 'menu_list.dart';

class FeedBackUser extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: DrawerPage(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
            child: Column(
          children: <Widget>[
            TopScreen(),
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 110, bottom: 15),
              child: Text(
                'Обратная связь',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Если вы тоже хотите получать письма от Емеля, оставьте нам адрес электронной почты',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 18,
            ),
            FeedFields(
              controller: _controller,
              text: 'Ваш E-mail',
              keybord: TextInputType.emailAddress,
              width: 370,
              height: 55,
            ),
            SizedBox(
              height: 18,
            ),
            FeedFields(
              controller: _controller,
              text: 'Ваш номер телефона',
              keybord: TextInputType.number,
              width: 370,
              height: 55,
            ),
            SizedBox(height: 18),
            FeedFields(
              controller: _controller,
              text: 'Напишите свое предложение',
              width: 370,
              height: 150,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AppOutlinedButton(
                  press: () {
                    Navigator.pop(context);
                  },
                  text: 'Отмена                 ',
                ),
                AppOutlinedButton(
                  press: () {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Успешно отправлено')));
                  },
                  text: 'Отправить           ',
                ),
              ],
            ),
          ],
        )),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}
