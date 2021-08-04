import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/screens/personal_account.dart/personal_items.dart';
import 'package:emelya/widgets/buttons/elevated_button.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../bot_bar_nav.dart';

class UserAccount extends StatelessWidget {
  static const String id = 'user_screen';
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
        child: Column(
          children: <Widget>[
            TopScreen(),
            Padding(
              padding: const EdgeInsets.only(top: 40, bottom: 18),
              child: Text(
                'Личный кабинет',
                style: kStyleTitleh1,
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFEFEFEF),
                child: Icon(
                  Icons.person_outline_rounded,
                  size: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              'Виктория Вика',
              style: kStyleTitleh2,
            ),
            SizedBox(
              height: 10,
            ),
            UserBut(),
          ],
        ),
      )),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}

class UserBut extends StatefulWidget {
  @override
  _UserButState createState() => _UserButState();
}

class _UserButState extends State<UserBut> {
  Widget text = SelectAdress();
  int currentIndex = 0;
  void setBottomBarIndex(int index) {
    //log('bnb setted to $index');
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UserButton(
          press1: () => setBottomBarIndex(0),
          press: () => setState(
            () => text = SelectAdress(),
          ),
          position: 0,
          text: 'Настройки',
          icon: 'settings',
          onColorChanged: currentIndex,
        ),
        UserButton(
          press1: () => setBottomBarIndex(1),
          press: () => setState(
            () => text = SelectedCard(),
          ),
          text: 'Управление картами',
          icon: 'dollar',
          position: 1,
          onColorChanged: currentIndex,
        ),
        UserButton(
          press1: () => setBottomBarIndex(2),
          press: () => setState(
            () => text = UserOrders(),
          ),
          text: 'История заказов',
          icon: 'card',
          position: 2,
          onColorChanged: currentIndex,
        ),
        UserButton(
          press1: () => setBottomBarIndex(3),
          press: () => setState(
            () => text = UserHistory(),
          ),
          text: 'Моя история',
          icon: 'history',
          position: 3,
          onColorChanged: currentIndex,
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 400,
          child: (text),
        )
      ],
    );
  }
}

class UserButton extends StatefulWidget {
  const UserButton({
    required this.text,
    required this.icon,
    required this.press,
    required this.onColorChanged,
    required this.position,
    required this.press1,
  });

  final String icon;
  final String text;
  final VoidCallback press;
  final VoidCallback press1;
  final int onColorChanged;
  final int position;

  @override
  _UserButtonState createState() => _UserButtonState();
}

class _UserButtonState extends State<UserButton> {
  bool isSelected() {
    if (widget.position == widget.onColorChanged) {
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: GestureDetector(
        onTap: () {
          widget.press();
          widget.press1();
        },
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          height: 40,
          width: 370,
          decoration: BoxDecoration(
              border: Border.all(color: AppColors.purple),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: isSelected() ? AppColors.purple : Colors.transparent),
          child: Row(
            children: <Widget>[
              SvgPicture.asset('assets/icons/${widget.icon}.svg',
                  color: isSelected() ? Colors.white : AppColors.purple),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    widget.text,
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: isSelected() ? Colors.white : AppColors.purple),
                  ),
                ),
              ),
              Icon(Icons.arrow_forward,
                  color: isSelected() ? Colors.white : AppColors.purple),
            ],
          ),
        ),
      ),
    );
  }
}
