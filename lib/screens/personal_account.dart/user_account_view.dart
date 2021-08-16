import 'dart:io';

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
import 'package:image_picker/image_picker.dart';

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
            Usercount(),
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

class Usercount extends StatefulWidget {
  @override
  _UsercountState createState() => _UsercountState();
}

class _UsercountState extends State<Usercount> {
  var _imageFile;

  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: ((builder) => bottomSheet())),
      child: Container(
        width: 111.0,
        height: 111.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: _imageFile != null
            ? Container(
                width: 111.0,
                height: 111.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: FileImage(
                        File(_imageFile.path),
                      ),
                      fit: BoxFit.cover),
                ),
              )
            : SvgPicture.asset('assets/images/dude.svg'),
      ),
    );
  }

  @override
  Widget bottomSheet() {
    return Container(
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 30.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15.0),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            onPressed: () {
              takePhoto(ImageSource.gallery);
            },
            icon: Icon(
              Icons.photo_outlined,
              size: 40.0,
              color: AppColors.purple,
            ),
          ),
          IconButton(
              onPressed: () {
                takePhoto(ImageSource.camera);
              },
              icon: Icon(
                Icons.camera_alt_outlined,
                size: 40.0,
                color: AppColors.purple,
              ))
        ],
      ),
    );
  }

  void takePhoto(ImageSource imageSource) async {
    final pickedFile = await _picker.getImage(
      source: imageSource,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }
}
