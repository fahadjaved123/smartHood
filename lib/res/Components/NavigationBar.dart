import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_item.dart';
import 'package:smart_neighbourhood/res/Components/Nav_wiget.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';

// ignore: must_be_immutable
class NavigationBarWidget extends StatelessWidget {
  int bottomIndex;
  final ValueChanged<int> ontap;
  final GlobalKey<CurvedNavigationBarState> bottomNavKey;
  NavigationBarWidget(
      {super.key,
      required this.bottomIndex,
      required this.ontap,
      required this.bottomNavKey});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      index: bottomIndex,
      key: bottomNavKey,
      backgroundColor: Colors.transparent,
      color: Appcolors.primaryColor,
      buttonBackgroundColor:
          bottomIndex == 2 ? Colors.red : Appcolors.primaryColor,
      height: 60,
      animationDuration: const Duration(milliseconds: 300),
      onTap: ontap,
      items: [
        navItem(
            isimage: false,
            icon: Iconsax.home,
            label: "HOME",
            index: 0,
            bottomIndex: bottomIndex),
        navItem(
            isimage: false,
            icon: Iconsax.document_text,
            label: "REPORT",
            index: 1,
            bottomIndex: bottomIndex),
        navItem(
            isimage: true,
            icon: Iconsax.warning_2,
            image: "assets/Images/sos.png",
            label: "SOS",
            index: 2,
            bottomIndex: bottomIndex),
        navItem(
            isimage: false,
            icon: Iconsax.people,
            label: "COMMUNITY",
            index: 3,
            bottomIndex: bottomIndex),
        navItem(
            isimage: false,
            icon: Iconsax.clock,
            label: "HISTORY",
            index: 4,
            bottomIndex: bottomIndex),
        navItem(
            isimage: false,
            icon: Iconsax.setting,
            label: "SETTING",
            index: 5,
            bottomIndex: bottomIndex),
      ],
    );
  }
}
