import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/screens/product.dart/boogmark.dart';
import 'package:emelya/widgets/buttons/counter.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:emelya/core/utils/double.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key? key,
    required this.price,
    required this.isFavorite,
    required this.imageUri,
    required this.name,
    // this.map
  }) : super(key: key);

  final double price;
  final bool isFavorite;
  final String imageUri;
  final String name;
  //final Map<String,dynamic>map;

  @override
  Widget build(BuildContext context) {
    //final appbloc = Provider.of<CounterProduct>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        width: 44.w,
        height: 30.h,
        padding: const EdgeInsets.fromLTRB(8, 5, 8, 8),
        decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price.toPrice(),
                  //'$(map['name'].toPrice())'
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                BookMarkIcon(size: 19.0)
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Image.asset(
                  imageUri,
                ),
                //Image.network('$(map['image'])'),
              ),
            ),
            Text(
              name, //'$(map['name'])'
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: AppOutlinedButton(
                      text: 'В корзину',
                      press: () =>
                          Provider.of<CounterProduct>(context, listen: false)
                              .addBasket()),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
