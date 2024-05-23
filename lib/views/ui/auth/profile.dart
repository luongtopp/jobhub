import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/common/width_spacer.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: CustomAppBar(
          text: "Profile",
          child: DrawerWidget(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              width: width,
              height: height * 0.12,
              color: Color(kLight.value),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRect(
                        child: CachedNetworkImage(
                          width: 80.w,
                          height: 100.h,
                          imageUrl:
                              'https://images.viblo.asia/20a0dfe2-6e93-46e4-84a6-0a891dd73136.JPG',
                        ),
                      ),
                    ],
                  ),
                  const WidthSpacer(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ReusableText(
                          text: "Jonh Doe",
                          style: appStyle(
                              20, Color(kDark.value), FontWeight.w600)),
                      Row(
                        children: [
                          Icon(MaterialIcons.location_pin,
                              color: Color(kDarkGrey.value)),
                          const WidthSpacer(width: 5),
                          ReusableText(
                              text: "Washington DC",
                              style: appStyle(
                                  16, Color(kDarkGrey.value), FontWeight.w600)),
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(Feather.edit, size: 18),
                  )
                ],
              ),
            ),
            const HeightSpacer(size: 20),
            Stack(
              children: [
                Container(
                  width: width,
                  height: height * 0.12,
                  color: Color(kLightGrey.value),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 12.w),
                        width: 60.w,
                        height: 70.h,
                        color: Color(kLight.value),
                        child: const Icon(
                          FontAwesome5Regular.file_pdf,
                          color: Colors.red,
                          size: 40,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ReusableText(
                              text: "Resume from JobHub",
                              style: appStyle(
                                  18, Color(kDark.value), FontWeight.w500)),
                          ReusableText(
                              text: "JobHub Resume",
                              style: appStyle(
                                  16, Color(kDarkGrey.value), FontWeight.w500)),
                        ],
                      ),
                      const WidthSpacer(width: 1),
                    ],
                  ),
                ),
                Positioned(
                  top: 2.h,
                  right: 5.h,
                  child: ReusableText(
                      text: "Edit",
                      style:
                          appStyle(16, Color(kOrange.value), FontWeight.w500)),
                )
              ],
            ),
            const HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: height * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ReusableText(
                    text: "andre@dbtech.com",
                    style: appStyle(16, Color(kDark.value), FontWeight.w600)),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              padding: EdgeInsets.only(left: 8.w),
              width: width,
              height: height * 0.06,
              color: Color(kLightGrey.value),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/icons/usa.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                    ReusableText(
                        text: "+136543764386487",
                        style:
                            appStyle(16, Color(kDark.value), FontWeight.w600)),
                  ],
                ),
              ),
            ),
            const HeightSpacer(size: 20),
            Container(
              color: Color(kLightGrey.value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.h),
                    child: ReusableText(
                        text: "Skills",
                        style:
                            appStyle(16, Color(kDark.value), FontWeight.w600)),
                  ),
                  HeightSpacer(size: 3.h),
                  SizedBox(
                    height: height * 0.5,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
                      child: ListView.builder(
                        itemCount: skills.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          final skill = skills[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              width: width,
                              height: height * 0.06,
                              color: Color(kLight.value),
                              child: ReusableText(
                                text: skill,
                                style: appStyle(
                                    16, Color(kDark.value), FontWeight.normal),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
