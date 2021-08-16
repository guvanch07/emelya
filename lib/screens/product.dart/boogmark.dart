import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/main.dart';
import 'package:flutter/material.dart';

class BookMarkIcon extends StatefulWidget {
  final size;
  final color;

  const BookMarkIcon({this.size, this.color});
  @override
  _BookMarkIconState createState() => _BookMarkIconState();
}

class _BookMarkIconState extends State<BookMarkIcon> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => _toggleFavorite(),
        icon: _isFavorite
            ? Icon(
                Icons.bookmark,
                color: AppColors.purple,
                size: widget.size,
              )
            : Icon(
                Icons.bookmark_border,
                color: widget.color,
                size: widget.size,
              ));
  }
}
