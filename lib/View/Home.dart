import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_menu_widget.dart';
import 'package:smart_neighbourhood/res/Constants/App_colors.dart';
import 'package:smart_neighbourhood/res/Constants/App_textStyle.dart';

class HomePage extends StatefulWidget {
  final VoidCallback opendrawer;
  final bool isopen;
  const HomePage({
    super.key,
    required this.isopen,
    required this.opendrawer,
  });

  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: AppTextStyle.heading(25, fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
        backgroundColor: Appcolors.primaryColor,
        elevation: 0,
        leading: DrawerMenuWidget(
          isdraweropen: widget.isopen,
          onPressed: widget.opendrawer,
        ),
        actions: [
          IconButton(
            icon: Icon(Iconsax.notification, color: Colors.white, size: 28),
            onPressed: () async {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        "assets/Images/6596121.png",
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Current Address',
                            style: AppTextStyle.heading(15,
                                color: Colors.black,
                                fontWeight: FontWeight.w900),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '142-Jhumar Fasialabad',
                            style: AppTextStyle.heading(
                              15,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            'Trust Score : 5.5',
                            style: AppTextStyle.heading(
                              15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.05),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                border: Border.all(color: Colors.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.09),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Is There Any Emergency?",
                    style: AppTextStyle.heading(
                      15,
                      fontWeight: FontWeight.w900,
                      color: Colors.red,
                    ),
                  ),
                  Icon(
                    Iconsax.danger,
                    size: 28,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
