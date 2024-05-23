import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../common/exports.dart';
import '../../../common/height_spacer.dart';
import '../../../../constants/app_constants.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kDarkPurple.value),
        child: Column(
          children: [
            const HeightSpacer(size: 70),
            Image.asset("assets/images/page1.png"),
            const HeightSpacer(size: 40),
            Column(
              children: [
                ReusableText(
                    text: "Find Your Dream Job",
                    style: appStyle(30, Color(kLight.value), FontWeight.w500)),
                const HeightSpacer(size: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Text(
                    "We help you find your dream job according to your skillset, location and preference to build your career",
                    style: appStyle(14, Color(kLight.value), FontWeight.normal),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
