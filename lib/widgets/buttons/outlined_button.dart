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
        //shadowColor: color ?? AppColors.purple,
        //backgroundColor: color ?? AppColors.white,
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
