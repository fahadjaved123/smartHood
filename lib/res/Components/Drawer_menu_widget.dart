import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerMenuWidget extends StatefulWidget {
  final VoidCallback onPressed;
  bool isdraweropen;
  DrawerMenuWidget(
      {super.key, required this.onPressed, required this.isdraweropen});

  @override
  State<DrawerMenuWidget> createState() => _DrawerMenuWidgetState();
}

class _DrawerMenuWidgetState extends State<DrawerMenuWidget>
    with TickerProviderStateMixin {
  late AnimationController _container;
  @override
  void initState() {
    _container =
        AnimationController(vsync: this, duration: Duration(milliseconds: 400));
    super.initState();
  }

  @override
  void dispose() {
    _container.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        widget.onPressed();
        _container.forward();
      },
      icon: AnimatedContainer(
        transform: widget.isdraweropen
            ? (Matrix4.translationValues(30, 7, 0)..scale(0.6))
            : (Matrix4.translationValues(0, 0, 0)..scale(1.0)),
        duration: Duration(milliseconds: 500),
        child: Image.asset(
          "assets/Images/menus.png",
          color: Colors.white,
          width: 50,
          height: 50,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
