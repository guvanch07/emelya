import 'package:emelya/constants.dart/app_colors.dart';
import 'package:emelya/screens/onboarding/onboarding.dart';
import 'package:emelya/widgets/buttons/basket_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bottom Nav Bar V2',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Onboarding(),
        );
      },
    );
  }
}

class BottomNavBarV2 extends StatefulWidget {
  @override
  _BottomNavBarV2State createState() => _BottomNavBarV2State();
}

class _BottomNavBarV2State extends State<BottomNavBarV2> {
  int currentIndex = 0;

  setBottomBarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white.withAlpha(55),
      body: bottomNavBar(size),
    );
  }

  Stack bottomNavBar(Size size) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 90,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 90),
                  painter: BNBCustomPainter(),
                ),
                const Center(
                  heightFactor: 0.5,
                  child: BasketButton(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () => currentIndex = 0,
                            child: BottomBarButton(
                              text: 'Меню',
                              icon: 'menu',
                              space: 12,
                              position: 0,
                              selected: currentIndex,
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          InkWell(
                            onTap: () => currentIndex = 1,
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
                          InkWell(
                            onTap: () => currentIndex = 2,
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
                          InkWell(
                            onTap: () => currentIndex = 3,
                            child: BottomBarButton(
                              text: 'Каталог',
                              icon: 'catalog',
                              space: 10,
                              position: 3,
                              selected: currentIndex,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 33.w,
          bottom: 4,
          child: Container(
            height: 5,
            width: 33.w,
            decoration: BoxDecoration(
              color: AppColors.white.withOpacity(0.4),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
          ),
        ),
      ],
    );
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
    path_0.moveTo(size.width, size.height);
    path_0.lineTo(size.width * -0.1183575, size.height * 0.9891446);
    path_0.lineTo(size.width * -0.1183575, size.height * 0.1358696);
    path_0.cubicTo(
        size.width * 0.2402821,
        size.height * -0.1449043,
        size.width * 0.3241667,
        size.height * 0.1684783,
        size.width * 0.6181425,
        size.height * 0.09616098);
    path_0.cubicTo(
        size.width * 0.9065000,
        size.height * -0.05978859,
        size.width * 0.9952488,
        size.height * 0.01630826,
        size.width * 1.119254,
        size.height * 0.1684783);
    path_0.lineTo(size.width, size.height);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = AppColors.purple;
    canvas.drawPath(path_0, paint_0_fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
