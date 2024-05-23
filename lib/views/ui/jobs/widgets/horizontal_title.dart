import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/common/width_spacer.dart';

class JobHorizontalTile extends StatelessWidget {
  const JobHorizontalTile({super.key, this.onTap});

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          width: width * 0.7,
          height: height * 0.27,
          color: Color(kLightGrey.value),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/Facebook.png")),
                  const WidthSpacer(width: 15),
                  ReusableText(
                      text: "Facebook",
                      style: appStyle(26, Color(kDark.value), FontWeight.w600)),
                ],
              ),
              const HeightSpacer(size: 15),
              ReusableText(
                  text: "Senior Flutter Developer",
                  style: appStyle(20, Color(kDark.value), FontWeight.w600)),
              ReusableText(
                  text: "Washington DC",
                  style: appStyle(15, Color(kDarkGrey.value), FontWeight.w600)),
              const HeightSpacer(size: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ReusableText(
                          text: "15k",
                          style: appStyle(
                              23, Color(kDark.value), FontWeight.w600)),
                      ReusableText(
                          text: "/monthly",
                          style: appStyle(
                              23, Color(kDarkGrey.value), FontWeight.w600)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Color(kLight.value),
                    child: const Icon(Ionicons.chevron_forward),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
