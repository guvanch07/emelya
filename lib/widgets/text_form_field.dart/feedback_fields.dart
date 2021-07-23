import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/material.dart';

class FeedFields extends StatelessWidget {
  const FeedFields(
      {required this.text,
      this.keybord,
      this.icon,
      required this.width,
      this.suficon,
      this.labeltext,
      required this.height});
  final text;
  final keybord;
  final icon;
  final double width;
  final suficon;
  final labeltext;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        height: height ?? 55,
        width: width,
        decoration: new BoxDecoration(
          color: Color(0xFFEFEFEF),
          borderRadius: new BorderRadius.all(
            new Radius.circular(9.0),
          ),
        ),
        child: TextField(
          keyboardType: keybord,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Color(0xFF000000)),
            labelText: labeltext,
            hintStyle: TextStyle(fontSize: 16),
            prefixIcon: icon,
            suffixIcon: suficon,
            filled: false,
            hintText: text,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class AdressForm extends StatelessWidget {
  const AdressForm({required this.text, required this.width, this.keyboard});

  final String text;
  final double width;
  final keyboard;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: Container(
          width: width,
          height: 55,
          decoration: new BoxDecoration(
            color: Color(0xFFEFEFEF),
            borderRadius: new BorderRadius.all(
              new Radius.circular(9.0),
            ),
          ),
          child: TextField(
            keyboardType: keyboard,
            decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.check_circle_outline,
                  color: AppColors.purple,
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  color: Colors.black,
                )),
                filled: true,
                fillColor: Color(0xFFEFEFEF),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                labelText: text,
                hintText: text,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(9),
                    ),
                    borderSide: BorderSide.none)),
          ),
        ));
  }
}
