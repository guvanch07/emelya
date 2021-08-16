import 'dart:io';

import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

List<String> itemProduct = [
  'Новинки',
  'Специальные предложения'
      'Хиты',
  'Рацион на каждый день',
  'Молочные продукты',
  'Овощи, фрукты, зелень',
  'Сладости, десерты, мороженное',
  'Торт на заказ',
  'Кулинария',
  'Сыры'
];

class ItemSelector extends StatelessWidget {
  CupertinoPicker IOSPicker() {
    List<Text> pickerItems = [];

    for (String item in itemProduct) {
      pickerItems.add(Text(item));
    }
    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Platform.isIOS ? IOSPicker() : SelectItem(),
          ),
        ],
      ),
    );
  }
}

class SelectItem extends StatefulWidget {
  @override
  _SelectItemState createState() => _SelectItemState();
}

class _SelectItemState extends State<SelectItem> {
  int currentIndex = -1;
  void setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 370.0,
      height: 530.0,
      color: Color(0xffFAFAFA),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Selector(
            press1: () => setBottomBarIndex(0),
            press: () {},
            position: 0,
            text: 'Новинки',
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(1),
            press: () {},
            text: 'Специальные предложения',
            position: 1,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(2),
            press: () {},
            text: 'Хиты',
            position: 2,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(3),
            press: () {},
            text: 'Рацион на каждый день',
            position: 3,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(4),
            press: () {},
            text: 'Молочные продукты',
            position: 4,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(5),
            press: () {},
            text: 'Овощи, фрукты, зелень',
            position: 5,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(6),
            press: () {},
            text: 'Сладости, десерты, мороженное',
            position: 6,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(7),
            press: () {},
            text: 'Торт на заказ',
            position: 7,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(8),
            press: () {},
            text: 'Кулинария',
            position: 8,
            onColorChanged: currentIndex,
          ),
          Selector(
            press1: () => setBottomBarIndex(9),
            press: () {},
            text: 'Сыры',
            position: 9,
            onColorChanged: currentIndex,
          ),
        ],
      ),
    );
  }
}

class Selector extends StatefulWidget {
  const Selector({
    required this.text,
    required this.press,
    required this.onColorChanged,
    required this.position,
    required this.press1,
  });

  final String text;
  final VoidCallback press;
  final VoidCallback press1;
  final int onColorChanged;
  final int position;
  @override
  _SelectorState createState() => _SelectorState();
}

class _SelectorState extends State<Selector> {
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
    return GestureDetector(
      onTap: () {
        widget.press();
        widget.press1();
      },
      child: Container(
        width: 330.0,
        height: 50.0,
        padding: EdgeInsets.only(right: 17.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected() ? AppColors.purple : Colors.transparent),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              widget.text,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                  color: isSelected() ? AppColors.purple : Colors.black),
            ),
            SizedBox(
              width: 20.0,
            ),
            Icon(Icons.arrow_forward_ios,
                size: 16,
                color: isSelected() ? AppColors.purple : Colors.black),
          ],
        ),
      ),
    );
  }
}
