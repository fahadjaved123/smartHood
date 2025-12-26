import 'package:iconsax/iconsax.dart';
import 'package:smart_neighbourhood/res/Components/Drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(icon: Iconsax.home, title: "HOME");
  static const report =
      DrawerItem(icon: Iconsax.document_text, title: "REPORT");
  static const sos = DrawerItem(icon: Iconsax.warning_2, title: "SOS");
  static const community = DrawerItem(icon: Iconsax.people, title: "COMMUNITY");
  static const history = DrawerItem(icon: Iconsax.clock, title: "HISTORY");
  static const logout = DrawerItem(icon: Iconsax.logout, title: "LOGOUT");
  static const setting = DrawerItem(icon: Iconsax.setting, title: "SETTING");

  static final List<DrawerItem> alldraweritems = [
    home,
    report,
    sos,
    community,
    history,
    setting,
    logout
  ];
}
