import 'dart:developer' as dev;
import 'dart:math';

import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:emelya/core/utils/double.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'counter.dart';

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
  // @override
  // void initState() {
  //   _count = widget.initProductsCount;
  //   _price = widget.initPriceCount;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    dev.log('root button rebuilded');

    return Stack(
      fit: StackFit.expand,
      children: [
        BasketButtonRoot(
          //itemCount: '${appbloc.getCounter}',
          fillColor: AppColors.black,
          lineColor: AppColors.white,
          lineWidth: 5,
        ),
        // Positioned(
        //   top: 0,
        //   left: 10,
        //   child: PriceCount(
        //     count: _price,
        //   ),
        // ),
        Positioned(
          top: 5,
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
    //required this.itemCount,
    required this.fillColor,
    required this.lineColor,
    required this.lineWidth,
  }) : super(key: key);

  //final itemCount;
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
      // clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        CustomPaint(
          painter: ButtonBackground(
            fillColor: widget.fillColor,
            lineColor: widget.lineColor,
            lineWidth: widget.lineWidth,
          ),
        ),
        Positioned(
          bottom: 20,
          left: 22.8,
          child: SvgPicture.asset('assets/icons/basket.svg'),
        ),
        Positioned(
          top: 18,
          left: 35,
          child:
              // ChangeNotifierProvider<CounterProduct>(
              //   create: (context) => CounterProduct(),
              //   builder: (context, child) =>
              // child:
              ItemCount(),
        ),
        // )
      ],
    );
  }
}

class ItemCount extends StatelessWidget {
  // const ItemCount({
  //   Key? key,
  //   required this.count,
  // }) : super(key: key);

  // final count;

  @override
  Widget build(BuildContext context) {
    //final appbloc = Provider.of<CounterProduct>(context);
    dev.log('item count rebuilded');

    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.all(
          Radius.circular(100),
        ),
      ),
      child: Center(
        child: Consumer<CounterProduct>(
          builder: (context, countProduct, child) => Text(
            '${countProduct.getCounter}',

            //'${context.watch<CounterProduct>().getCounter}',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                ?.copyWith(color: AppColors.white),
          ),
        ),
      ),
    );
  }
}

class PriceCount extends StatelessWidget {
  // const PriceCount({
  //   Key? key,
  //   required this.count,
  // }) : super(key: key);

  // final double count;

  @override
  Widget build(BuildContext context) {
    dev.log('item count rebuilded');

    return Container(
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
          child: Consumer<CounterProduct>(
            builder: (context, priceProduct, child) => Text(
                '${priceProduct.getPrice}p',
                style: Theme.of(context).textTheme.bodyText1),
          ),
        ));
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
    canvas.drawCircle(Offset(90 / 2, 90 / 2), 90 / 2, paint);
  }

  Rect calculateArcsRect(Size size) {
    final offset = lineWidth / 2;
    final arcRect = Offset(offset, offset) &
        Size(size.width - offset * 2, size.width - offset * 2);
    return arcRect;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
