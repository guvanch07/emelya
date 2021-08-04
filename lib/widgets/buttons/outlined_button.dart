import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/order.dart/add_card.dart';
import 'package:emelya/screens/personal_account.dart/personal_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    required this.text,
    required this.press,
    this.color,
    this.textColor,
    this.padding,
    this.borderRadius,
    this.textStyle,
  });

  final String text;
  final VoidCallback press;
  final Color? color;
  final Color? textColor;
  final EdgeInsets? padding;
  final double? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    // return MaterialButton(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 35)),
    //   ),
    //   padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
    //   color: color ?? AppColors.purple,
    //   disabledColor: color,
    //   onPressed: press,
    //   elevation: 0,
    //   child: Text(
    //     text,
    //     textAlign: TextAlign.center,
    //     style: textStyle ??
    //         TextStyle(
    //             color: textColor ?? AppColors.white,
    //             fontSize: 16,
    //             fontFamily: 'Roboto',
    //             fontWeight: FontWeight.w400),
    //   ),
    // );
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 35)),
        ),
        // padding: padding ?? const EdgeInsets.symmetric(horizontal: 20),
        side: const BorderSide(width: 1, color: AppColors.purple),
      ),
      onPressed: press,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: textStyle ??
            Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.purple),
      ),
    );
  }
}

class CheckBoxButton extends StatelessWidget {
  const CheckBoxButton(
      {required this.press, required this.child, this.shape, this.radius});
  final VoidCallback press;
  final Widget child;
  final shape;
  final radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 24,
        width: 24,
        child: child,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.purple),
          borderRadius: radius,
          shape: shape,
        ),
      ),
      onTap: press,
    );
  }
}

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int _radioValue1 = 0;
  Widget text = PayCashPayment();

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: AppColors.purple),
                child: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.purple,
                  value: 0,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () => text = PayCashPayment(),
                  );
                  setState(() {
                    _radioValue1 = 0;
                  });
                },
                child: Text("Наличными при получении"),
              ),
            ],
          ),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: AppColors.purple),
                child: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.purple,
                  value: 1,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () => text = PayCashPayment(),
                  );
                  setState(() {
                    _radioValue1 = 1;
                  });
                },
                child: Text("Картой при получении"),
              ),
            ],
          ),
          Row(
            children: [
              Theme(
                data: ThemeData(unselectedWidgetColor: AppColors.purple),
                child: Radio(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: AppColors.purple,
                  value: 2,
                  groupValue: _radioValue1,
                  onChanged: _handleRadioValueChange1,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(
                    () => text = AddCardPayment(),
                  );
                  setState(() {
                    _radioValue1 = 2;
                  });
                },
                child: Text("Картой онлайн — Добавить новую карту"),
              )
            ],
          ),
          Container(
            width: double.infinity,
            height: 400,
            child: (text),
          )
        ],
      ),
    );
  }
}
