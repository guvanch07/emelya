import 'dart:developer' as dev;
import 'dart:math';

import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/order.dart/order_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emelya/core/utils/double.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketButton extends StatefulWidget {
  const BasketButton({
    Key? key,
    this.initProductsCount = 0,
    this.initPriceCount = 0.0,
  }) : super(key: key);

  final int initProductsCount;
  final double initPriceCount;

  @override
  _BasketButtonState createState() => _BasketButtonState();
}

class _BasketButtonState extends State<BasketButton> {
  late int _count;
  late double _price;
  final Random rand = Random();

  @override
  void initState() {
    _count = widget.initProductsCount;
    _price = widget.initPriceCount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    dev.log('root button rebuilded');

    void incrementCounter() {
      setState(() {
        _price += rand.nextDouble() * 20;
        _count++;
      });
    }

    return Stack(
      children: [
        BasketButtonRoot(
          itemCount: _count,
          fillColor: AppColors.black,
          lineColor: AppColors.white,
          lineWidth: 5,
        ),
        PriceCount(
          count: _price,
        ),
        Positioned(
          top: 32,
          left: 38.5,
          child: CustomPaint(
            painter: TrianglePainter(
              strokeColor: AppColors.white,
              strokeWidth: 10,
              paintingStyle: PaintingStyle.fill,
            ),
            child: Container(
              height: 7,
              width: 12,
            ),
          ),
        ),
      ],
    );
  }
}

class BasketButtonRoot extends StatefulWidget {
  const BasketButtonRoot({
    Key? key,
    required this.itemCount,
    required this.fillColor,
    required this.lineColor,
    required this.lineWidth,
  }) : super(key: key);

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
      clipBehavior: Clip.none,
      children: [
        CustomPaint(
          painter: ButtonBackground(
            fillColor: widget.fillColor,
            lineColor: widget.lineColor,
            lineWidth: widget.lineWidth,
          ),
        ),
        Positioned(
          // bottom: 25,
          top: 57,
          left: 22.8,
          child: SvgPicture.asset('assets/icons/basket.svg'),
        ),
        ItemCount(
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
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    final containerSize = 90 * 0.22;
    dev.log('item count rebuilded');

    return Positioned(
      top: containerSize / 1.5 + 33,
      left: 90 / 2 - containerSize / 2,
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

  final double count;

  @override
  Widget build(BuildContext context) {
    dev.log('item count rebuilded');

    return Positioned(
      top: 12,
      left: 10,
      child: Stack(
        children: [
          Container(
            width: 70,
            height: 25,
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(100),
              ),
            ),
            child: Center(
              child: Text('${count.toPrice()} р.',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
        ],
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter(
      {this.strokeColor = Colors.black,
      this.strokeWidth = 3,
      this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x / 2, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return true;
  }
}

class ButtonBackground extends CustomPainter {
  ButtonBackground({
    required this.fillColor,
    required this.lineColor,
    required this.lineWidth,
  });

  final Color fillColor;
  final Color lineColor;
  final double lineWidth;

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
    canvas.drawCircle(Offset(90 / 2, 90 / 2 + 30), 90 / 2, paint);
  }

  Rect calculateArcsRect(Size size) {
    final offest = lineWidth / 2;
    final arcRect = Offset(offest, offest + 30) &
        Size(size.width - offest * 2, size.width - offest * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
