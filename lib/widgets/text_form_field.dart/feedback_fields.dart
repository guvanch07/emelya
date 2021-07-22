import 'package:flutter/material.dart';

class FeedFields extends StatelessWidget {
  const FeedFields({
    required this.text,
    this.keybord,
    this.icon,
    required this.height,
    this.suficon,
    this.labeltext,
  });
  final text;
  final keybord;
  final icon;
  final double? height;
  final suficon;
  final labeltext;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 12.0, right: 12.0),
      height: height ?? 55,
      decoration: new BoxDecoration(
        color: Color(0xFFEFEFEF),
        borderRadius: new BorderRadius.all(
          new Radius.circular(9.0),
        ),
      ),
      child: TextField(
        keyboardType: keybord,
        decoration: InputDecoration(
          labelStyle:
              TextStyle(height: 2, fontSize: 12, color: Color(0xFF000000)),
          labelText: labeltext,
          hintStyle: TextStyle(fontSize: 14),
          prefixIcon: icon,
          suffixIcon: suficon,
          filled: false,
          hintText: text,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class AdressForm extends StatelessWidget {
  const AdressForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(),
          filled: true,
          fillColor: Color(0xFFEFEFEF),
          labelText: 'name',
          hintText: 'entry name',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(9),
              ),
              borderSide: BorderSide.none)),
    );
  }
}
