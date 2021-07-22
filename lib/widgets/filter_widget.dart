import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/widgets/buttons/outlined_button.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';

class Filter extends StatelessWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: ExpandableNotifier(
          child: ScrollOnExpand(
            child: ExpandablePanel(
              theme: const ExpandableThemeData(
                headerAlignment: ExpandablePanelHeaderAlignment.center,
                tapBodyToExpand: true,
                tapBodyToCollapse: true,
                hasIcon: false,
              ),
              header: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 17, 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/icons/filter.svg'),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Фильтр',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'По популярности',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          SvgPicture.asset('assets/icons/chevron_down.svg'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              expanded: const FilterExpanded(),
              collapsed: Container(),
            ),
          ),
        ),
      ),
    );
  }
}

class FilterExpanded extends StatefulWidget {
  const FilterExpanded({
    Key? key,
  }) : super(key: key);

  @override
  _FilterExpandedState createState() => _FilterExpandedState();
}

class _FilterExpandedState extends State<FilterExpanded> {
  // RangeValues _currentRangeValues = const RangeValues(5, 25);

  RangeValues values = RangeValues(0, 50);
  RangeLabels labels = RangeLabels('0', "50");
  bool _value = false;
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 25),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Фильтр',
                  style: Theme.of(context).textTheme.headline2,
                ),
                const SizedBox(
                  width: 12,
                ),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.black),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(180)),
                    ),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/cancel.svg',
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Сбросить',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 1,
              color: AppColors.dividerColor,
            ),
            const SizedBox(
              height: 25,
            ),
            // const Text('aboba'),
            ExpandableNotifier(
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Text(
                    'Цена',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                    height: 120,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Text('от'),
                            Container(
                              width: 130,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFAC4AEB),
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                  child: Text(
                                '5',
                                style: TextStyle(
                                    color: Color(0xFFAC4AEB),
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal),
                              )),
                            ),
                            Text('до'),
                            Container(
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Color(0xFFAC4AEB),
                                  ),
                                  borderRadius: BorderRadius.circular(6)),
                              child: Center(
                                  child: Text(
                                '50',
                                style: TextStyle(
                                    color: Color(0xFFAC4AEB),
                                    fontSize: 19,
                                    fontWeight: FontWeight.normal),
                              )),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbColor: Color(0xFFAC4AEB),
                          ),
                          child: RangeSlider(
                            min: 0,
                            max: 50,
                            values: values,
                            inactiveColor: Colors.black,
                            activeColor: Color(0xFFAC4AEB),
                            labels: labels,

                            // RangeLabels(
                            //   _currentRangeValues.start.round().toString(),
                            //   _currentRangeValues.end.round().toString(),
                            // ),
                            onChanged: (value) {
                              print("START: ${value.start}, End: ${value.end}");
                              setState(() {
                                values = value;
                                labels = RangeLabels(
                                    "${value.start.toInt().toString()}\$",
                                    "${value.start.toInt().toString()}\$");
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 1,
              color: AppColors.dividerColor,
            ),
            const SizedBox(
              height: 25,
            ),
            // const Text('aboba'),
            ExpandableNotifier(
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Text(
                    'Вес',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  collapsed: Container(),
                  expanded: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            CheckBoxButton(
                              radius: BorderRadius.all(Radius.circular(9)),
                              press: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                              },
                              child: Icon(
                                _isSelected ? Icons.check : null,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '50г',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CheckBoxButton(
                              radius: BorderRadius.all(Radius.circular(9)),
                              press: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                              },
                              child: Icon(
                                _isSelected ? Icons.check : null,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '100г',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CheckBoxButton(
                              radius: BorderRadius.all(Radius.circular(9)),
                              press: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                              },
                              child: Icon(
                                _isSelected ? Icons.check : null,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '200г',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CheckBoxButton(
                              radius: BorderRadius.all(Radius.circular(9)),
                              press: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                              },
                              child: Icon(
                                _isSelected ? Icons.check : null,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '300г',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            CheckBoxButton(
                              radius: BorderRadius.all(Radius.circular(9)),
                              press: () {
                                setState(() {
                                  _isSelected = !_isSelected;
                                });
                              },
                              child: Icon(
                                _isSelected ? Icons.check : null,
                                color: AppColors.purple,
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Text(
                              '400г',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.normal),
                            )
                          ],
                        ),
                        Center(
                          child: AppOutlinedButton(
                            press: () {},
                            text: '     Показать 125 товаров      ',
                            borderRadius: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
