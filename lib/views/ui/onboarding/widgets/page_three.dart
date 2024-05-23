import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhubv2_0/views/common/custom_btn.dart';
import 'package:jobhubv2_0/views/common/custom_outline_btn.dart';
import 'package:jobhubv2_0/views/ui/auth/login.dart';
import 'package:jobhubv2_0/views/ui/auth/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/exports.dart';
import '../../../common/height_spacer.dart';
import '../../../../constants/app_constants.dart';

class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        color: Color(kLightBlue.value),
        child: Column(
          children: [
            Image.asset("assets/images/page3.png"),
            const HeightSpacer(size: 20),
            ReusableText(
                text: "Welcome To JobHub",
                style: appStyle(30, Color(kLight.value), FontWeight.w600)),
            const HeightSpacer(size: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0.w),
              child: Text(
                "We help you find your dream job according to your skillset, location and preference to build your career",
                style: appStyle(14, Color(kLight.value), FontWeight.normal),
                textAlign: TextAlign.center,
              ),
            ),
            const HeightSpacer(size: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomOutlineBtn(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => const LoginPage());
                  },
                  text: "Login",
                  width: width * 0.4,
                  height: height * 0.06,
                  color: Color(kLight.value),
                ),
                GestureDetector(
                  onTap: () async {
                    final SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('entrypoint', true);
                    Get.to(() => const RegistrationPage());
                  },
                  child: Container(
                    width: width * 0.4,
                    height: height * 0.06,
                    decoration: BoxDecoration(
                      color: Color(kLight.value),
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                    alignment: Alignment.center,
                    child: ReusableText(
                      text: "Sign Up",
                      style: appStyle(
                        16,
                        Color(kLightBlue.value),
                        FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const HeightSpacer(size: 20),
            ReusableText(
              text: 'Continue as guest',
              style: appStyle(
                16,
                Color(kLight.value),
                FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
