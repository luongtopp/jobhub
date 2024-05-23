import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobhubv2_0/models/response/bookmarks/bookmark.dart';
import 'package:jobhubv2_0/views/common/width_spacer.dart';
import 'package:jobhubv2_0/views/ui/auth/profile.dart';
import 'package:jobhubv2_0/views/ui/bookmarks/bookmark.dart';
import 'package:jobhubv2_0/views/ui/chat/chatpage.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_screen.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/ui/device_mgt/devices_info.dart';
import 'package:jobhubv2_0/views/ui/homepage.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: DrawerScreen(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          mainScreen: currentScreen(),
          borderRadius: 30,
          showShadow: true,
          angle: 0.0,
          slideWidth: 250,
          menuBackgroundColor: Color(kLightBlue.value),
        );
      },
    );
  }

  currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const ChatsPage();
      case 2:
        return const BookMarkPage();
      case 3:
        return const DeviceManagement();
      case 4:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  Widget drawerItem(IconData icon, String text, int index, Color color) {
    return GestureDetector(
      onTap: null,
      child: Container(
        margin: EdgeInsets.only(
          left: 20.w,
          bottom: 40.h,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            const WidthSpacer(
              width: 12,
            ),
            ReusableText(
                text: text, style: appStyle(12, color, FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
