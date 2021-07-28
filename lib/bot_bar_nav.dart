import 'dart:developer';
//import 'package:google_fonts/google_fonts.dart';
import 'package:emelya/screens/catalog/catalog.dart';
import 'package:emelya/screens/catalog/cotolog_view.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/onboarding/onboarding.dart';
import 'package:emelya/screens/order.dart/order_list.dart';
import 'package:emelya/screens/personal_account.dart/user_account_view.dart';
import 'package:emelya/screens/search.dart';
import 'package:emelya/screens_list.dart';
import 'package:emelya/widgets/buttons/basket_button.dart';
import 'package:emelya/widgets/filter_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

import 'constants/app_colors.dart';

const double xOffset = 0;

class BotNavBar extends StatefulWidget {
  @override
  _BotNavBarState createState() => _BotNavBarState();
}

class _BotNavBarState extends State<BotNavBar> {
  int currentIndex = 0;

  var pages = [CotologView(), SearchProduct(), UserAccount(), DrawerPage()];
  var _appPageController = PageController();

  void setBottomBarIndex(int index) {
    //log('bnb setted to $index');
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return

        // Scaffold(
        //   backgroundColor: AppColors.backgroundColor,
        //   body:

        // PageView(
        //   scrollDirection: Axis.horizontal,
        //   children: pages,
        //   onPageChanged: (index) {
        //     setState(() {
        //       currentIndex = index;
        //     });
        //   },
        //   controller: _appPageController,
        // ),

        //  body(size),
        // bottomNavigationBar:
        //BottomNavigationBar(
        //   items: [],
        // ),
        //   );
        // }

        // Widget body(Size size) {
        //   return
        //   SafeArea(
        // child:
        // Stack(children: [
        // const Padding(
        //   padding: EdgeInsets.only(bottom: 90, top: 50),
        //   child: CatalogList(),
        // ),
        // Positioned(
        //   bottom: 0,
        //   left: 0,
        //   child:
        Container(
      width: size.width,
      height: 90 + xOffset,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, 90),
            painter: BNBCustomPainter(),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CotologView())),
                      child: BottomBarButton(
                        text: 'Каталог',
                        icon: 'catalog',
                        space: 10,
                        position: 0,
                        selected: currentIndex,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchProduct())),
                      child: BottomBarButton(
                        text: 'Поиск',
                        icon: 'search',
                        space: 10,
                        position: 1,
                        selected: currentIndex,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20.w,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 1.w,
                    ),
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserAccount())),
                      child: BottomBarButton(
                        text: 'Кабинет',
                        icon: 'profile',
                        space: 10,
                        position: 2,
                        selected: currentIndex,
                      ),
                    ),
                    SizedBox(
                      width: 1.w,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DrawerPage())),
                      },
                      child: BottomBarButton(
                        text: 'Меню',
                        icon: 'menu',
                        space: 12,
                        position: 3,
                        selected: currentIndex,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              OrderList();
            },
            child: Positioned(
              left: 35.w,
              bottom: 5,
              child: Container(
                height: 1,
                width: 30.w,
                decoration: BoxDecoration(
                  color: AppColors.white.withOpacity(0.4),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 1),
              child: SizedBox(
                height: 150,
                width: 90,
                child: BasketButton(),
              ),
            ),
          ),
        ],
      ),
    );

    //   )
    // ])

    //     ],
    //   ),
    // );
  }
}

class BottomBarButton extends StatefulWidget {
  BottomBarButton({
    Key? key,
    required this.icon,
    required this.text,
    required this.space,
    required this.position,
    required this.selected,
  }) : super(key: key);

  final String icon;
  final String text;
  final double space;
  final int position;
  int selected;

  @override
  _BottomBarButtonState createState() => _BottomBarButtonState();
}

class _BottomBarButtonState extends State<BottomBarButton> {
  bool isSelected() {
    if (widget.position == widget.selected) {
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SvgPicture.asset(
          'assets/icons/${widget.icon}.svg',
          color: isSelected() ? AppColors.black : AppColors.white,
        ),
        SizedBox(
          height: widget.space,
        ),
        Text(
          widget.text,
          style: TextStyle(
            color: isSelected() ? AppColors.black : AppColors.white,
            fontFamily: 'Arial',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Path path_0 = Path();
    path_0.moveTo(size.width, size.height + xOffset);
    path_0.lineTo(size.width * -0.1183575, size.height * 0.9891446 + xOffset);
    path_0.lineTo(size.width * -0.1183575, size.height * 0.1358696 + xOffset);
    path_0.cubicTo(
        size.width * 0.2402821,
        size.height * -0.1449043 + xOffset,
        size.width * 0.3241667,
        size.height * 0.1684783 + xOffset,
        size.width * 0.6181425,
        size.height * 0.09616098 + xOffset);
    path_0.cubicTo(
        size.width * 0.9065000,
        size.height * -0.05978859 + xOffset,
        size.width * 0.9952488,
        size.height * 0.01630826 + xOffset,
        size.width * 1.119254,
        size.height * 0.1684783 + xOffset);
    path_0.lineTo(size.width, size.height + xOffset);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = AppColors.purple;
    canvas.drawPath(path_0, paint0Fill);
    // canvas.drawColor(AppColors.backgroundColor, BlendMode.darken);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class BotNavBarCont extends StatefulWidget {
  @override
  _BotNavBarContState createState() => _BotNavBarContState();
}

class _BotNavBarContState extends State<BotNavBarCont> {
  int currentIndex = 0;

  var pages = [CotologView(), SearchProduct(), UserAccount(), DrawerPage()];
  var _appPageController = PageController();

  void setBottomBarIndex(int index) {
    //log('bnb setted to $index');
    setState(() {
      currentIndex = index;
    });
    _appPageController.animateToPage(index,
        duration: Duration(milliseconds: 400), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.horizontal,
          children: pages,
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: _appPageController,
        ),
      ),
    );
  }
}