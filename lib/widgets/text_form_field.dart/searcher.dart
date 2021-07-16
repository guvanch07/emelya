import 'package:flutter/material.dart';

class Searcher extends StatelessWidget {
  // const Searcher({ Key? key }) : super(key: key);

  const Searcher({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xFFEFEFEF), borderRadius: BorderRadius.circular(6.0)),
        child: Row(
          children: [
            Icon(Icons.search),
            TextField(
              decoration: InputDecoration(
                hintText: text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
