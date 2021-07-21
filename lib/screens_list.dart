import 'package:emelya/main.dart';
import 'package:emelya/screens/catalog/catalog.dart';
import 'package:emelya/screens/menu.dart/menu_list.dart';
import 'package:emelya/screens/onboarding/onboarding.dart';
import 'package:emelya/screens/product.dart/product_list_view.dart';
import 'package:emelya/screens/search.dart';
import 'package:emelya/widgets/expandable_demo.dart';
import 'package:flutter/material.dart';
import 'widgets/filter_widget.dart';

class ScreensList extends StatelessWidget {
  const ScreensList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Onboarding()),
                );
              },
              child: const Text('Onboarding'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppBottomNavBar()),
                );
              },
              child: const Text('BottomNavBar'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CatalogList()),
                );
              },
              child: const Text('Catalog'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Filter()),
                );
              },
              child: const Text('Filter'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
              child: const Text('Expandable demo'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchProduct()),
                );
              },
              child: const Text('Search'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductList()),
                );
              },
              child: const Text('ProductList'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawerPage()),
                );
              },
              child: const Text('Menu'),
            )
          ],
        ),
      ),
    );
  }
}
