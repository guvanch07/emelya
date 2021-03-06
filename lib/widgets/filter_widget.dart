import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/core/utils/toast.dart';
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
    return SingleChildScrollView(
      child: Stack(
        children: [
          ExpandableNotifier(
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
                      ],
                    ),
                  ),
                ),
                expanded: const FilterExpanded(),
                collapsed: Container(),
              ),
            ),
          ),
          Positioned(
            top: 17.5,
            right: 17,
            child: GestureDetector(
              onTap: () => showGeneralDialog(
                barrierDismissible: false,
                barrierColor: Colors.black.withOpacity(0.5),
                transitionDuration: const Duration(milliseconds: 400),
                context: context,
                pageBuilder: (context, anim1, anim2) {
                  return const SafeArea(child: SortDialog());
                },
                transitionBuilder: (context, anim1, anim2, child) {
                  return SlideTransition(
                    position: Tween(
                      begin: const Offset(0, -1),
                      end: const Offset(0, 0),
                    ).animate(anim1),
                    child: child,
                  );
                },
              ),
              child: Row(
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
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SortType {
  SortType({
    required this.id,
    required this.sortName,
  });

  final int id;
  final String sortName;

  static List<SortType> getSortTypes = [
    SortType(id: 0, sortName: 'По популярности'),
    SortType(id: 1, sortName: 'По рейтингу'),
    SortType(id: 2, sortName: 'По названию'),
    SortType(id: 3, sortName: 'Новинки'),
    SortType(id: 4, sortName: 'По возрастанию цены'),
    SortType(id: 5, sortName: 'По убыванию цены'),
  ];
}

class SortDialog extends StatefulWidget {
  const SortDialog();

  @override
  _SortDialogState createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  int _value = 1;

  void _changeSortType(int? newValue) {
    setState(() {
      _value = newValue!;
    });
  }

  void setBottomBarIndex(String sortName) {
    setState(() {
      currentSortType = sortName;
    });
  }

  var currentSortType = 'По популярности';
  int value = 0;

  @override
  Widget build(BuildContext context) {
    final bodyStyle = Theme.of(context).textTheme.bodyText1;

    return Align(
      alignment: Alignment.topRight,
      child: Card(
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: AppColors.purple,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(6),
          ),
        ),
        // insetPadding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0),
        margin: EdgeInsets.only(left: 35.w, top: 5, right: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 18,
                      ),
                      child: Text(
                        currentSortType,
                        style: bodyStyle?.copyWith(color: AppColors.purple),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 22,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/chevron_up.svg',
                      color: AppColors.purple,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1.25,
              color: AppColors.purple,
            ),
            for (int i = 0; i < SortType.getSortTypes.length; i++)
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      accentColor: AppColors.purple,
                      primaryColor: AppColors.purple,
                      unselectedWidgetColor: AppColors.purple,
                    ),
                    child: Radio(
                      value: i,
                      groupValue: _value,
                      onChanged: (int? value) {
                        setState(() {
                          _value = value!;
                          Navigator.of(context).pop();
                          setBottomBarIndex('По популярности');
                        });
                      },
                    ),
                  ),
                  Text(
                    SortType.getSortTypes[i].sortName,
                    style: bodyStyle,
                  ),
                ],
              ),
          ],
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

  @override
  Widget build(BuildContext context) {
    final divider = Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      height: 1,
      color: AppColors.dividerColor,
    );

    const largePadding = EdgeInsets.symmetric(vertical: 5, horizontal: 16);

    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: largePadding,
            child: Row(
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
          ),
          const SizedBox(
            height: 12,
          ),
          divider,
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding: largePadding,
            child: ExpandableNotifier(
              child: ScrollOnExpand(
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToExpand: true,
                    tapBodyToCollapse: true,
                    hasIcon: false,
                  ),
                  header: Row(
                    children: [
                      Text(
                        'Цена',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/icons/chevron_down.svg'),
                    ],
                  ),
                  collapsed: Container(
                    height: 25,
                  ),
                  expanded: const PricePicker(),
                ),
              ),
            ),
          ),
          divider,
          const SizedBox(
            height: 25,
          ),
          ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  tapBodyToCollapse: true,
                  hasIcon: false,
                ),
                header: Padding(
                  padding: largePadding,
                  child: Row(
                    children: [
                      Text(
                        'Вес',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 16),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/icons/chevron_down.svg'),
                    ],
                  ),
                ),
                collapsed: Container(
                  height: 25,
                ),
                expanded: WeightPicker(),
              ),
            ),
          ),
          divider,
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 5, 16, 20),
            child: Row(
              children: [
                Expanded(
                    child: AppOutlinedButton(
                        text: 'Показать 123 товаров', press: () {})),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WeightPicker extends StatelessWidget {
  WeightPicker({
    Key? key,
  }) : super(key: key);

  final List<bool> checkoxValues = [];
  bool val1 = false;
  bool val2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WeightCheckbox(
          weight: '50 г',
          //value: val1,
        ),
        WeightCheckbox(
          weight: '100 г',
          //value: val2,
        ),
        WeightCheckbox(
          weight: '200 г',
          //value: val2,
        ),
        WeightCheckbox(
          weight: '300 г',
          //value: val2,
        ),
        WeightCheckbox(
          weight: '400 г',
          //value: val2,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class WeightCheckbox extends StatefulWidget {
  const WeightCheckbox({
    Key? key,
    required this.weight,
  }) : super(key: key);

  final String weight;

  @override
  _WeightCheckboxState createState() => _WeightCheckboxState();
}

bool selected = false;

class _WeightCheckboxState extends State<WeightCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        children: [
          Checkbox(
            activeColor: Colors.transparent,
            checkColor: AppColors.purple,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: BorderSide(
                color: selected ? AppColors.purple : AppColors.purple),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            value: selected,
            onChanged: (value) {
              setState(() {
                selected = value!;
              });
            },
          ),
          Text(
            widget.weight,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

class PricePicker extends StatefulWidget {
  const PricePicker({
    Key? key,
  }) : super(key: key);

  @override
  _PricePickerState createState() => _PricePickerState();
}

class _PricePickerState extends State<PricePicker> {
  int height = 50;
  RangeValues _rangeSliderDiscreteValues = const RangeValues(40, 80);
  @override
  Widget build(BuildContext context) {
    const inputDecoration = InputDecoration(
      border: OutlineInputBorder(),
      contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      isCollapsed: true,
      fillColor: Colors.red,
      focusColor: AppColors.purple,
      hoverColor: Colors.red,
    );

    final inputTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          color: AppColors.purple,
          fontSize: 16,
        );

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'от',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                height: 30,
                width: 33.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColors.purple),
                    borderRadius: BorderRadius.all(Radius.circular(9.0))),
                child: Center(
                    child: Text(
                        _rangeSliderDiscreteValues.start.round().toString(),
                        style: TextStyle(
                            color: AppColors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.normal))),
              ),
              Text(
                'до',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                  height: 30,
                  width: 33.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.purple),
                      borderRadius: BorderRadius.all(Radius.circular(9.0))),
                  child: Center(
                    child: Text(
                      _rangeSliderDiscreteValues.end.round().toString(),
                      style: TextStyle(
                          color: AppColors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  )),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
                inactiveTrackColor: AppColors.purple,
                activeTrackColor: Colors.black,
                thumbColor: AppColors.purple,
                overlayColor: Colors.black45,
                thumbShape: RoundSliderThumbShape(enabledThumbRadius: 13.0),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 27.0)),
            child: RangeSlider(
              values: _rangeSliderDiscreteValues,
              min: 0,
              max: 100,
              onChanged: (values) {
                setState(() {
                  _rangeSliderDiscreteValues = values;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
