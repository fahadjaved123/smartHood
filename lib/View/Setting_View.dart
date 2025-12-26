import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_menu_widget.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class SettingView extends StatefulWidget {
  final VoidCallback opendrawer;
  final bool isopen;
  const SettingView(
      {super.key, required this.isopen, required this.opendrawer});

  @override
  State<SettingView> createState() => _HomeState();
}

class _HomeState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Appcolors.primaryColor,
        leading: DrawerMenuWidget(
          isdraweropen: widget.isopen,
          onPressed: widget.opendrawer,
        ),
        title: Text(
          "Setting",
          style: AppTextStyle.heading(25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
    );
  }
}
