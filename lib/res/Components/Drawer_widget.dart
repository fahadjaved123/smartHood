import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_item.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_items.dart';

class DrawerWidget extends StatefulWidget {
  final ValueChanged<DrawerItem> onPressed;
  final VoidCallback onclosed;
  const DrawerWidget(
      {super.key, required this.onPressed, required this.onclosed});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
              onPressed: () {
                widget.onclosed();
              },
              icon: Icon(Icons.close)),
          buildDraweritems(context),
        ],
      )),
    );
  }

  Widget buildDraweritems(BuildContext contex) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: DrawerItems.alldraweritems.map((item) {
        return ListTile(
          contentPadding: EdgeInsets.only(top: 10, left: 20),
          title: Text(item.title,
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.bold,
                  fontSize: height * 0.020)),
          leading: Icon(
            item.icon,
            color: Colors.black54,
            size: height * 0.040,
          ),
          onTap: () => widget.onPressed(item),
        );
      }).toList(),
    );
  }
}
