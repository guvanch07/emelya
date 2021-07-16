import 'dart:developer' as dev;
import 'dart:math';

import 'package:emelya/constants.dart/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketButton extends StatefulWidget {
  const BasketButton({
    Key? key,
    this.initProductsCount = 0,
    this.initPriceCount = 0,
  }) : super(key: key);

  final int initProductsCount;
  final double initPriceCount;

  @override
  _BasketButtonState createState() => _BasketButtonState();
}

class _BasketButtonState extends State<BasketButton> {
  late int _count;

  @override
  void initState() {
    _count = widget.initProductsCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double buttonSize = 90;
    dev.log('root button rebuilded');

    void _incrementCounter() {
      setState(() {
        _count++;
      });
    }

    return Stack(
      children: [
        InkWell(
          onTap: _incrementCounter,
          child: BasketButtonRoot(
            itemCount: _count,
            fillColor: AppColors.black,
            lineColor: AppColors.white,
            lineWidth: 5,
            size: buttonSize,
          ),
        ),
        PriceCount(
          count: _count,
        ),
      ],
    );
  }
}

class BasketButtonRoot extends StatefulWidget {
  const BasketButtonRoot({
    Key? key,
    required this.size,
    required this.itemCount,
    required this.fillColor,
    required this.lineColor,
    required this.lineWidth,
  }) : super(key: key);

  final double size;
  final int itemCount;
  final Color fillColor;
  final Color lineColor;
  final double lineWidth;

  @override
  _BasketButtonRootState createState() => _BasketButtonRootState();
}

class _BasketButtonRootState extends State<BasketButtonRoot> {
  @override
  Widget build(BuildContext context) {
    dev.log('basket icon button rebuilded');

    return Stack(
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: ButtonBackground(
            size: widget.size,
            fillColor: widget.fillColor,
            lineColor: widget.lineColor,
            lineWidth: widget.lineWidth,
          ),
        ),
        Positioned(
          bottom: -15,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: widget.size / 4, vertical: 150 / 4),
            child: SvgPicture.asset('assets/icons/basket.svg'),
          ),
        ),
        ItemCount(
          size: widget.size,
          count: widget.itemCount,
        ),
      ],
    );
  }
}

class ItemCount extends StatelessWidget {
  const ItemCount({
    Key? key,
    required this.count,
    required this.size,
  }) : super(key: key);

  final int count;
  final double size;

  @override
  Widget build(BuildContext context) {
    final containerSize = size * 0.22;
    dev.log('item count rebuilded');

    return Positioned(
      top: containerSize / 1.5 + 30,
      left: size / 2 - containerSize / 2,
      child: Container(
        width: containerSize,
        height: containerSize,
        decoration: const BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Arial',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class PriceCount extends StatelessWidget {
  const PriceCount({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    dev.log('item count rebuilded');

    return Positioned(
      top: 30,
      left: 35,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.purple,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Center(
          child: Text(
            count.toString(),
            style: const TextStyle(
              color: AppColors.white,
              fontFamily: 'Arial',
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}

class ButtonBackground extends CustomPainter {
  ButtonBackground({
    required this.fillColor,
    required this.lineColor,
    required this.lineWidth,
    required this.size,
  });

  final Color fillColor;
  final Color lineColor;
  final double lineWidth;
  final double size;

  @override
  void paint(Canvas canvas, Size size) {
    dev.log('background painted');

    final arcRect = calculateArcsRect(size);
    drawBackground(canvas, size);
    drawFilledArc(canvas, arcRect);
  }

  void drawFilledArc(Canvas canvas, Rect arcRect) {
    final paint = Paint();
    paint.color = lineColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = lineWidth;
    paint.strokeCap = StrokeCap.round;

    canvas.drawArc(
      arcRect,
      0,
      pi * 2,
      false,
      paint,
    );
  }

  void drawBackground(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = fillColor;
    paint.style = PaintingStyle.fill;
    canvas.drawCircle(
        Offset(this.size / 2, this.size / 2 + 30), this.size / 2, paint);
  }

  Rect calculateArcsRect(Size size) {
    final offest = lineWidth / 2;
    final arcRect = Offset(offest, offest + 30) &
        Size(size.width - offest * 2, size.width - offest * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
