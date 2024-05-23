import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/exports.dart';
import '../../../common/height_spacer.dart';
import '../../../../constants/app_constants.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const HeightSpacer(size: 65),
            Padding(padding: EdgeInsets.all(8.h)),
            Image.asset("assets/images/page2.png"),
            const HeightSpacer(size: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Statble Yourseft \n With Your Ability",
                  style: appStyle(30, Color(kLight.value), FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                const HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.all(8.h),
                  child: Text(
                    "We help you find your dream job according to your skillset, location and preference to build your career",
                    style: appStyle(14, Color(kLight.value), FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
