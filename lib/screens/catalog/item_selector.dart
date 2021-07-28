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
  const ItemSelector({Key? key}) : super(key: key);

  List<Text> getPickerItems() {
    List<Text> pickerItems = [];

    for (String item in itemProduct) {
      pickerItems.add(Text(item));
    }
    return pickerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
              height: 150,
              child: CupertinoPicker(
                children: getPickerItems(),
                itemExtent: 30.0,
                onSelectedItemChanged: (selectedIndex) {
                  print(selectedIndex);
                },
              ))
        ],
      ),
    );
  }
}
