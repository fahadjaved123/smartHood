import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:smart_neighbourhood/View/Community.dart';
import 'package:smart_neighbourhood/View/History_view.dart';
import 'package:smart_neighbourhood/View/Home.dart';
import 'package:smart_neighbourhood/View/Login.dart';
import 'package:smart_neighbourhood/View/Report_View.dart';
import 'package:smart_neighbourhood/View/SOS_View.dart';
import 'package:smart_neighbourhood/View/Setting_View.dart';
import 'package:smart_neighbourhood/res/Auth_helper.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_item.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_items.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_widget.dart';
import 'package:smart_neighbourhood/res/Components/NavigationBar.dart';

class Mainpage extends StatefulWidget {
  Mainpage({
    super.key,
  });

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  late double xoffset;
  late double yoffset;
  late double scalefactor;
  bool isdragging = false;
  bool isdraweropen = false;
  DrawerItem item = DrawerItems.home;
  bool login = false;
  bool isLoading = true;

  int _bottomIndex = 0; // for bottom nav
  Map<int, GlobalKey<NavigatorState>> navigatorKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
    3: GlobalKey<NavigatorState>(),
    4: GlobalKey<NavigatorState>(),
    5: GlobalKey<NavigatorState>(),
    6: GlobalKey<NavigatorState>(),
  };

  final GlobalKey<CurvedNavigationBarState> bottomNavKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    closedrawer();
    // checkLogin();
  }

  void opendrawer() {
    if (!mounted) return;
    setState(() {
      xoffset = 230;
      yoffset = 150;
      scalefactor = 0.6;
      isdraweropen = true;
    });
  }

  void Changeindex(int index) {
    bottomNavKey.currentState?.setPage(index);
    setState(() {
      _bottomIndex = index;
    });
  }

  void closedrawer() {
    if (!mounted) return;
    setState(() {
      xoffset = 0;
      yoffset = 0;
      scalefactor = 1;
      isdraweropen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(children: [buildDrawer(), buildpage()]),
      bottomNavigationBar: buildBottomNav(),
    );
  }

  Widget buildDrawer() {
    return WillPopScope(
      onWillPop: () async {
        final NavigatorState currentstate =
            navigatorKeys[_bottomIndex]!.currentState!;
        if (currentstate.canPop()) {
          currentstate.pop();
          return false;
        }
        return true;
      },
      child: SafeArea(
        child: Container(
          width: xoffset,
          child: DrawerWidget(
            onclosed: closedrawer,
            onPressed: (item) {
              setState(() {
                this.item = item;
                if (item == DrawerItems.home) {
                  _bottomIndex = 0;
                } else if (item == DrawerItems.report) {
                  _bottomIndex = 1;
                } else if (item == DrawerItems.sos) {
                  _bottomIndex = 2;
                } else if (item == DrawerItems.community) {
                  _bottomIndex = 3;
                } else if (item == DrawerItems.history) {
                  _bottomIndex = 4;
                } else if (item == DrawerItems.setting) {
                  _bottomIndex = 5;
                } else if (item == DrawerItems.logout) {
                  AuthHelper.logout(context);
                }
                bottomNavKey.currentState?.setPage(_bottomIndex);
                // final CurvedNavigationBarState? navBarState =
                //     _bottomNavigationKey.currentState;
                // navBarState?.setPage(1);
              });
              closedrawer();
            },
          ),
        ),
      ),
    );
  }

  Widget buildpage() {
    return WillPopScope(
      onWillPop: () async {
        if (isdraweropen) {
          closedrawer();
          return false;
        } else {
          return true;
        }
      },
      child: GestureDetector(
        onHorizontalDragStart: (details) => isdragging = true,
        onHorizontalDragUpdate: (details) {
          const delta = 1;
          if (!isdragging) return;
          if (details.delta.dx > delta) {
            opendrawer();
          } else if (details.delta.dx < -delta) {
            closedrawer();
          }
          isdragging = false;
        },
        onTap: () {
          closedrawer();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          transform: Matrix4.translationValues(xoffset, yoffset, 0)
            ..scale(scalefactor),
          child: AbsorbPointer(
            absorbing: isdraweropen,
            child: ClipRRect(
              borderRadius: isdraweropen
                  ? BorderRadius.circular(25)
                  : BorderRadius.circular(0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: isdraweropen
                      ? BorderRadius.circular(25)
                      : BorderRadius.circular(0),
                  color: isdraweropen ? Colors.white12 : Colors.blue,
                  border: isdraweropen
                      ? Border.all(color: Colors.white54, width: 2)
                      : Border.all(),
                ),
                child: getBottomItems(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getBottomItems() {
    return Navigator(
      transitionDelegate: DefaultTransitionDelegate(),
      key: navigatorKeys[_bottomIndex],
      onGenerateRoute: (settings) {
        Widget? page;
        switch (_bottomIndex) {
          case 0:
            page = HomePage(isopen: isdraweropen, opendrawer: opendrawer);
            break;
          case 1:
            page = ReportView(
              isopen: isdraweropen,
              opendrawer: opendrawer,
            );
            break;
          case 2:
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   showcomingsoonDialog(context);
            // });
            page = SosView(
              opendrawer: opendrawer,
              isopen: isdraweropen,
            );
            break;
          case 3:
            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   showcomingsoonDialog(context);
            // });
            page = CommunityView(opendrawer: opendrawer, isopen: isdraweropen);
            break;
          case 4:
            page = HistoryView(opendrawer: opendrawer, isopen: isdraweropen);
            break;
          case 5:
            page = SettingView(
              isopen: isdraweropen,
              opendrawer: opendrawer,
            );
          default:
            page = HomePage(
              opendrawer: opendrawer,
              isopen: isdraweropen,
            );
        }
        return MaterialPageRoute(builder: (_) => page ?? Container());
      },
    );
  }

  Widget buildBottomNav() {
    return NavigationBarWidget(
        bottomIndex: _bottomIndex,
        ontap: (i) {
          setState(() {
            _bottomIndex = i;
          });
        },
        bottomNavKey: bottomNavKey);
  }
}

// Route _buildRoute(Widget page) {
//   return PageRouteBuilder(
//     transitionDuration: const Duration(milliseconds: 300),
//     reverseTransitionDuration: const Duration(milliseconds: 250),
//     pageBuilder: (context, animation, secondaryAnimation) => page,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       final tween = Tween(
//         begin: const Offset(0.0, 0.1), // bottom se halka sa slide
//         end: Offset.zero,
//       ).chain(CurveTween(curve: Curves.easeInOut));

//       return FadeTransition(
//         opacity: animation,
//         child: SlideTransition(
//           position: animation.drive(tween),
//           child: child,
//         ),
//       );
//     },
//   );
// }
