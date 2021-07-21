import 'package:emelya/constants/app_colors.dart';
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
      height: 1,
      color: AppColors.dividerColor,
    );

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
                  header: Text(
                    'Цена',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  collapsed: Container(
                    height: 25,
                  ),
                  expanded: const PricePicker(),
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
                  header: Text(
                    'Вес',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  collapsed: Container(),
                  expanded: const WeightPicker(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WeightPicker extends StatelessWidget {
  const WeightPicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                side: const BorderSide(color: AppColors.purple),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
                value: false,
                onChanged: (onChanged) {},
              ),
              Text(
                '50 г',
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
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
