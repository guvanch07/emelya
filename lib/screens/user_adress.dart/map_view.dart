import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/user_adress.dart/geolocator_service.dart';
import 'package:emelya/screens/user_adress.dart/mapbox.dart';
import 'package:emelya/widgets/buttons/basket_button.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../bot_bar_nav.dart';

import 'googlemap.dart';
import 'search_street.dart';

class MapAdress extends StatelessWidget {
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
              Container(width: 414.0, height: 400, child: MapBox()),
              Padding(
                padding: const EdgeInsets.only(top: 23.0, bottom: 20.0),
                child: Text(
                  'Адрес доставки',
                  style: kStyleTitleh1,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 15),
                    child: SvgPicture.asset('assets/icons/arrow.svg'),
                  ),
                  Text(
                    'Ваш адрес',
                    style: TextStyle(
                      color: Color(0xFF000000),
                    ),
                  ),
                ],
              ),
              AppOutlinedButton(
                text: 'Ввести адрес                   ',
                press: () => showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => buildSheet(context)),
              ),
              SizedBox(
                height: 45.0,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BotNavBar(preees: _openEndDrawer),
    );
  }
}

Widget buildSheet(BuildContext context) =>
    ChangeNotifierProvider<ApplicationBloc1>(
      create: (context) => ApplicationBloc1(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          color: Colors.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AdressMap(),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 170),
                  child: Text(
                    'Начните вводить адрес Например “Куприянова 1А"',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ))
            ],
          ),
        ),
      ),
    );

class AdressMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc1>(context);
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15, left: 15, top: 20),
          height: 55,
          decoration: new BoxDecoration(
            color: Color(0xFFEFEFEF),
            borderRadius: new BorderRadius.all(
              new Radius.circular(9.0),
            ),
          ),
          child: Row(
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Введите адрес?',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(9),
                          ),
                          borderSide: BorderSide.none),
                    ),
                    onChanged: (value) => applicationBloc.searchPlaces(value),
                  )),
              Container(
                width: 1,
                height: 45,
                color: Colors.grey,
              ),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ChangeNotifierProvider<ApplicationBloc>(
                      create: (context) => ApplicationBloc(),
                      child: GoMap(),
                    ),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Text('Карта'),
                  ),
                ),
              )
            ],
          ),
        ),
        if (applicationBloc.searchResults != null &&
            applicationBloc.searchResults.length != 0)
          ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(applicationBloc.searchResults[index].description),
              );
            },
            itemCount: applicationBloc.searchResults.length,
          )
      ],
    );
  }
}
