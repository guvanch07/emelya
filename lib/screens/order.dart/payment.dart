import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../bot_bar_nav.dart';
import 'checkout.dart';

class PaymentMethod extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
          ],
        ),
      )),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}
