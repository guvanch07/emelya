import 'package:flutter/material.dart';

class Searcher extends StatefulWidget {
  // const Searcher({ Key? key }) : super(key: key);

  // const Searcher({required this.text});

  // final String text;

  @override
  _SearcherState createState() => _SearcherState();
}

class _SearcherState extends State<Searcher> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 9.0, right: 9.0),
        height: 55.0,
        decoration: new BoxDecoration(
            color: Color(0xFFEFEFEF),
            borderRadius: new BorderRadius.all(new Radius.circular(9.0))),
        child: new Directionality(
          textDirection: TextDirection.ltr,
          child: new TextField(
            style: new TextStyle(fontSize: 15.0),
            decoration: new InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
              filled: true,
              fillColor: Color(0xFFEFEFEF),
              hintText: 'Введите название товара',
              contentPadding: const EdgeInsets.only(
                bottom: 50,
                left: 50.0,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ));
  }
}
