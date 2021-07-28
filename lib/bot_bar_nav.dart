// import 'package:emelya/screens/catalog/catalog.dart';
// import 'package:emelya/screens/catalog/cotolog_view.dart';
// import 'package:emelya/screens/menu.dart/menu_list.dart';
// import 'package:emelya/screens/order.dart/order_list.dart';
// import 'package:emelya/screens/personal_account.dart/user_account_view.dart';
// import 'package:emelya/screens/search.dart';
// import 'package:emelya/screens_list.dart';
// import 'package:emelya/widgets/buttons/basket_button.dart';
// import 'package:emelya/widgets/filter_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sizer/sizer.dart';
// //import 'package:google_fonts/google_fonts.dart';
// import 'constants/app_colors.dart';
// import 'main.dart';

// class BottomBarNav extends StatefulWidget {
//   const BottomBarNav({Key? key}) : super(key: key);

//   @override
//   _BottomBarNavState createState() => _BottomBarNavState();
// }

// class _BottomBarNavState extends State<BottomBarNav> {
//   int currentIndex = 3;

//   var pages = [DrawerPage(), SearchProduct(), UserAccount(), CotologView()];
//   var _appPageController = PageController();

//   void setBottomBarIndex(int index) {
//     //log('bnb setted to $index');
//     setState(() {
//       currentIndex = index;
//     });
//     _appPageController.animateToPage(index,
//         duration: Duration(milliseconds: 400), curve: Curves.ease);

//     @override
//     Widget build(BuildContext context) {
//       final Size size = MediaQuery.of(context).size;
//       return Container(
//         width: size.width,
//         height: 90 + xOffset,
//         child: Stack(children: [
//           CustomPaint(
//             size: Size(size.width, 90),
//             painter: BNBCustomPainter(),
//           ),
//           Row(
//             children: [
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     GestureDetector(
//                       onTap: () => {
//                         setBottomBarIndex(0),
//                       },
//                       child: BottomBarButton(
//                         text: 'Меню',
//                         icon: 'menu',
//                         space: 12,
//                         position: 0,
//                         selected: currentIndex,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 1.w,
//                     ),
//                     GestureDetector(
//                       onTap: () => setBottomBarIndex(1),
//                       child: BottomBarButton(
//                         text: 'Поиск',
//                         icon: 'search',
//                         space: 10,
//                         position: 1,
//                         selected: currentIndex,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 1.w,
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 width: 20.w,
//               ),
//               Expanded(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     SizedBox(
//                       width: 1.w,
//                     ),
//                     GestureDetector(
//                       onTap: () => setBottomBarIndex(2),
//                       child: BottomBarButton(
//                         text: 'Кабинет',
//                         icon: 'profile',
//                         space: 10,
//                         position: 2,
//                         selected: currentIndex,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 1.w,
//                     ),
//                     GestureDetector(
//                       onTap: () => setBottomBarIndex(3),
//                       child: BottomBarButton(
//                         text: 'Каталог',
//                         icon: 'catalog',
//                         space: 10,
//                         position: 3,
//                         selected: currentIndex,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//           GestureDetector(
//             onTap: () {
//               OrderList();
//             },
//             child: Positioned(
//               left: 35.w,
//               bottom: 5,
//               child: Container(
//                 height: 5,
//                 width: 30.w,
//                 decoration: BoxDecoration(
//                   color: AppColors.white.withOpacity(0.4),
//                   borderRadius: const BorderRadius.all(
//                     Radius.circular(100),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           const Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 20),
//               child: SizedBox(
//                 height: 120,
//                 width: 90,
//                 child: BasketButton(),
//               ),
//             ),
//           ),
//         ]
//             //const Filter(),
//             ),
//       );
//       //     ],
//       //   ),
//       // );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }
