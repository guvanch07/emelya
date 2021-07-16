import 'package:emelya/widgets/text_form_field.dart/searcher.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import '../../constants.dart/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../main.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({Key? key}) : super(key: key);

  static const Color bgc = Colors.white;

  @override
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TopScreen(),
            ),
            SizedBox(
              height: 43.0,
            ),
            Expanded(
              child: Searcher(text: 'Введите название товара '),
            ),
            SizedBox(
              height: 140.0,
            ),
            Container(
              width: 152.0,
              height: 152.0,
              child: Center(
                child: SvgPicture.asset(
                  'assets/images/noproducts.svg',
                  color: Color(0xFFFAFAFA),
                ),
              ),
            ),
            SizedBox(
              height: 13.0,
            ),
            Text(
              'Товары не найдены',
              style: TextStyle(color: Color(0xffA7A7A7), fontSize: 18.0),
            ),
            BottomNavBarV2()
          ],
        ),
      ),
    );
  }
}
