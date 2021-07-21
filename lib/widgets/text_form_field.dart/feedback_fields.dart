import 'package:flutter/material.dart';

class FeedFields extends StatelessWidget {
  const FeedFields(
      {required this.text, this.keybord, this.icon, required this.height});
  final text;
  final keybord;
  final icon;
  final double? height;
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
          prefixIcon: icon,
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
