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
      width: 155.0,
      height: 40.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0), color: Color(0xFFEFEFEF)),
      child: Row(
        children: <Widget>[
          _counter != 0
              ? IconButton(
                  alignment: Alignment.center,
                  icon: Icon(Icons.remove),
                  color: Color(0xFFAC4AEB),
                  onPressed: () => setState(() => _counter--),
                )
              : Container(),
          Expanded(
              child: Center(
            child: Text(
              '$_counter шт',
              style: TextStyle(
                color: Color(0xFFAC4AEB),
              ),
            ),
          )),
          IconButton(
              alignment: Alignment.center,
              icon: Icon(Icons.add),
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
    return Container(
      width: 90,
      height: 30.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: <Widget>[
          _counter != 0
              ? IconButton(
                  icon: Icon(
                    Icons.remove_circle,
                    color: Colors.purple,
                    size: 35,
                  ),
                  color: Color(0xFFAC4AEB),
                  onPressed: () => setState(() => _counter--),
                )
              : Container(),
          Text(
            ' $_counter ',
            style: TextStyle(
              color: Color(0xFFAC4AEB),
            ),
          ),
          IconButton(
              icon: Icon(
                Icons.add_circle,
                color: Colors.purple,
                size: 35,
              ),
              color: Color(0xFFAC4AEB),
              onPressed: () => setState(() => _counter++)),
        ],
      ),
    );
  }
}
