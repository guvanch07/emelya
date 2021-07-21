import 'package:emelya/widgets/text_form_field.dart/searcher.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../main.dart';

class SearchProduct extends StatelessWidget {
  const SearchProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TopScreen(),

            SizedBox(
              height: 43.0,
            ),
            Searcher(),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     right: 80,
            //   ),
            //   child:
            Expanded(
              child: SvgPicture.asset(
                'assets/images/noproducts.svg',
              ),
            ),

            Text(
              'Товары не найдены',
              style: TextStyle(color: Color(0xffA7A7A7), fontSize: 18.0),
            ),
            Expanded(child: AppBottomNavBar())
          ],
        ),
      ),
    );
  }
}
