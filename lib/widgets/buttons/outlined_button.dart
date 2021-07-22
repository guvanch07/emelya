import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/material.dart';

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

enum SingingCharacter { card, cash, online }

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  SingingCharacter? _character = SingingCharacter.card;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Theme(
          data: ThemeData(unselectedWidgetColor: AppColors.purple),
          child: ListTile(
            title: const Text('Наличными при получении'),
            leading: Radio<SingingCharacter>(
              activeColor: AppColors.purple,
              value: SingingCharacter.card,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
        Theme(
          data: ThemeData(unselectedWidgetColor: AppColors.purple),
          child: ListTile(
            title: const Text('Картой при получении'),
            leading: Radio<SingingCharacter>(
                activeColor: AppColors.purple,
                value: SingingCharacter.cash,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                }),
          ),
        ),
        Theme(
          data: ThemeData(
            unselectedWidgetColor: AppColors.purple,
          ),
          child: ListTile(
            title: const Text('Картой онлайн — Добавить новую карту'),
            leading: Radio<SingingCharacter>(
              activeColor: AppColors.purple,
              value: SingingCharacter.online,
              groupValue: _character,
              onChanged: (SingingCharacter? value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
        ),
      ],
    );
  }
}
