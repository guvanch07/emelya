import 'dart:async';
import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/core/utils/toast.dart';
import 'package:emelya/screens/onboarding/slide_dots.dart';
import 'package:emelya/screens/onboarding/slide_item.dart';
import 'package:emelya/screens/onboarding/slide.dart';
import 'package:emelya/widgets/buttons/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int _currentPage = 0;
  final _pageController = PageController();

  @override
  void initState() {
    super.initState();
    inititializePageController();
  }

  void inititializePageController() {
    WidgetsBinding.instance?.addPostFrameCallback(
      (_) {
        Timer.periodic(
          const Duration(seconds: 5),
          (Timer timer) {
            slideNext();
          },
        );
      },
    );
  }

  void slideNext() {
    if (_currentPage < 2) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }

    _pageController.animateToPage(
      _currentPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  DateTime? currentBackPressTime;

  Future<bool> _onTap() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showToast('Нажмите ещё раз, чтобы выйти');
      return Future.value(false);
    }
    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    return Future.value(true);
  }

  void _onNextPressed() async {
    slideNext();
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).unfocus();
    return WillPopScope(
      onWillPop: _onTap,
      child: Scaffold(
        body: Container(
          color: AppColors.white,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SlideItem(i),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for (int i = 0; i < slideList.length; i++)
                            if (i == _currentPage)
                              SlideDots(true)
                            else
                              SlideDots(false)
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: 65.w,
                height: 52,
                child: AppElevatedButton(
                  text: "Далее",
                  press: _onNextPressed,
                ),
              ),
              SizedBox(height: 20.w)
            ],
          ),
        ),
      ),
    );
  }
}
