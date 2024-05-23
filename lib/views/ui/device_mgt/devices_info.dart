import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/ui/device_mgt/widgets/devices_info.dart';
import 'package:provider/provider.dart';

class DeviceManagement extends StatelessWidget {
  const DeviceManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardNotifier>(context);
    String date = DateTime.now().toString();
    var loginDate = date.substring(0, 11);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: "Device Management",
          child: DrawerWidget(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  HeightSpacer(size: 50),
                  Text(
                    "You are logge in into your account on these divices",
                    style: appStyle(16, Color(kDark.value), FontWeight.normal),
                  ),
                  DevicesInfo(
                    location: 'Ha Noi',
                    device: 'Pixel 7',
                    platform: 'Android',
                    date: loginDate,
                    ipAdress: '192.168.0.1',
                  ),
                  DevicesInfo(
                    location: 'Ha Noi',
                    device: 'Pixel 3XL',
                    platform: 'Android',
                    date: loginDate,
                    ipAdress: '192.168.176.12',
                  ),
                ],
              ),
            ),
            Consumer<LoginNotifier>(
              builder: (context, loginNotifier, Widget? child) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      zoomNotifier.currentIndex = 0;
                      onBoardNotifier.isLastPage = !onBoardNotifier.isLastPage;
                      Get.to(() => const OnBoardingScreen());
                    },
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ReusableText(
                          text: "Sign out of all devices",
                          style: appStyle(
                              16, Color(kOrange.value), FontWeight.w600)),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
