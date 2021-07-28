import 'package:emelya/constants/app_colors.dart';
import 'package:emelya/widgets/filter_widget.dart';
import 'package:emelya/widgets/text_form_field.dart/feedback_fields.dart';
import 'package:emelya/widgets/topScreen.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'catalog.dart';
import 'item_selector.dart';

class CotologView extends StatelessWidget {
  const CotologView({Key? key}) : super(key: key);
  static const largePadding = EdgeInsets.symmetric(horizontal: 140);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: <Widget>[
              TopScreen(),
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 15),
                child: Text(
                  'Наш каталог товаров',
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 110, bottom: 5),
                child: Text(
                  'АДРЕС ВАШЕГО ДОМА',
                  style: kStyleTitleh2,
                ),
              ),
              FeedFields(
                text: 'Введите адрес',
                icon: Icon(Icons.search, color: Colors.grey, size: 30),
                width: 370,
                height: 55,
              ),
              SizedBox(
                height: 8,
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
                          Center(
                            child: Text(
                              'Каталог',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  ?.copyWith(fontSize: 16),
                            ),
                          ),
                          const Spacer(),
                          SvgPicture.asset('assets/icons/chevron_down.svg'),
                        ],
                      ),
                    ),
                    collapsed: Container(
                      height: 25,
                    ),
                    expanded: ItemSelector(),
                  ),
                ),
              ),
              Text(
                'ТОП ПОПУЛЯРНЫХ ТОВАРОВ',
                style: kStyleTitleh2,
              ),
              Filter(),
              Container(
                  height: 400, width: double.infinity, child: CatalogList()),
            ],
          ),
        ),
      ),
    );
  }
}
