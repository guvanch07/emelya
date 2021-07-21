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

class FilterExpanded extends StatelessWidget {
  const FilterExpanded({
    Key? key,
  }) : super(key: key);

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
          value: val1,
        ),
        WeightCheckbox(
          weight: '100 г',
          value: val2,
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }
}

class WeightCheckbox extends StatelessWidget {
  const WeightCheckbox({
    Key? key,
    required this.weight,
    required this.value,
  }) : super(key: key);

  final String weight;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        children: [
          Checkbox(
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            side: const BorderSide(color: AppColors.purple),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(6)),
            ),
            value: value,
            onChanged: (onChanged) {},
          ),
          Text(
            weight,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

class PricePicker extends StatelessWidget {
  const PricePicker({
    Key? key,
  }) : super(key: key);

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
                child: TextFormField(
                  decoration: inputDecoration,
                  keyboardType: TextInputType.text,
                  style: inputTextStyle,
                ),
              ),
              Text(
                'до',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(
                height: 30,
                width: 33.w,
                child: TextFormField(
                  decoration: inputDecoration,
                  keyboardType: TextInputType.text,
                  style: inputTextStyle,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Slider(
            value: 0,
            onChanged: (value) {},
            activeColor: AppColors.purple,
          ),
        ],
      ),
    );
  }
}
