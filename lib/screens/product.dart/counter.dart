import 'package:emelya/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterPc extends StatefulWidget {
  const CounterPc({Key? key}) : super(key: key);

  @override
  _CounterPcState createState() => _CounterPcState();
}

class _CounterPcState extends State<CounterPc> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      width: 155.0,
      height: 32.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Color(0xFFEFEFEF)),
      child: Row(
        children: <Widget>[
          _counter != 0
              ? IconButton(
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.remove,
                    size: 18,
                  ),
                  color: Color(0xFFAC4AEB),
                  onPressed: () => setState(() => _counter--),
                )
              : Container(),
          Expanded(
              child: Center(
            child: Text(
              '$_counter шт',
              style: TextStyle(
                  color: Color(
                    0xFFAC4AEB,
                  ),
                  fontFamily: 'Arial',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400),
            ),
          )),
          IconButton(
              alignment: Alignment.center,
              icon: Icon(
                Icons.add,
                size: 18,
              ),
              color: Color(0xFFAC4AEB),
              onPressed: () => setState(() => _counter++)),
        ],
      ),
    );
  }
}

class CountOrder extends StatefulWidget {
  const CountOrder({Key? key}) : super(key: key);

  @override
  _CountOrderState createState() => _CountOrderState();
}

class _CountOrderState extends State<CountOrder> {
  @override
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        _counter != 0
            ? IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.purple,
                  size: 24,
                ),
                color: Color(0xFFAC4AEB),
                onPressed: () => setState(() => _counter--),
              )
            : Container(),
        Text(
          ' $_counter ',
          style: TextStyle(
            color: Color(0xFFAC4AEB),
            fontSize: 14,
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.add_circle,
              color: Colors.purple,
              size: 24,
            ),
            color: Color(0xFFAC4AEB),
            onPressed: () => setState(() => _counter++)),
      ],
    );
  }
}
