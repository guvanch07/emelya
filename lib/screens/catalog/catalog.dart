import 'package:emelya/screens/product.dart/product_list_view.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'product_item.dart';

class ProductEntity {
  final double price;
  final bool isFavorite;
  final String imageUri;
  final String name;

  ProductEntity({
    required this.price,
    required this.isFavorite,
    required this.imageUri,
    required this.name,
  });
}

class CatalogList extends StatelessWidget {
  static final _products = [
    ProductEntity(
      price: 7.20,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy4.png',
      name: 'Салат "Мимоза"',
    ),
    ProductEntity(
      price: 10.0,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy3.png',
      name: 'Семга малосоленая',
    ),
    ProductEntity(
      price: 3.35,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy1.png',
      name: 'Десерт вафля с ягодами',
    ),
    ProductEntity(
      price: 2.20,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy2.png',
      name: 'Замороженный красный борщ',
    ),
    ProductEntity(
      price: 7.20,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy4.png',
      name: 'Салат "Мимоза"',
    ),
    ProductEntity(
      price: 10.0,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy3.png',
      name: 'Семга малосоленая',
    ),
    ProductEntity(
      price: 3.35,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy1.png',
      name: 'Десерт вафля с ягодами',
    ),
    ProductEntity(
      price: 2.20,
      isFavorite: false,
      imageUri: 'assets/images/dummies/dummy2.png',
      name: 'Замороженный красный борщ',
    ),
  ];

  const CatalogList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemWidth = 44.w;
    final itemHeight = 30.h;
    return GridView.builder(
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.w,
          childAspectRatio: itemWidth / itemHeight,
        ),
        itemBuilder: (BuildContext context, int index) {
          final product = _products[index];
          return Padding(
            padding: index % 2 == 0
                ? EdgeInsets.only(left: 4.w)
                : EdgeInsets.only(right: 4.w),
            child: GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductList(),
                ),
              ),
              child: ProductItem(
                price: product.price,
                isFavorite: product.isFavorite,
                imageUri: product.imageUri,
                name: product.name,
              ),
            ),
          );
        });
  }
}
