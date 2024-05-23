import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/app_style.dart';
import 'package:jobhubv2_0/views/common/custom_outline_btn.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';

class JobPage extends StatefulWidget {
  const JobPage({super.key, required this.title, required this.id});

  final String title;
  final String id;
  @override
  State<JobPage> createState() => _JobPageState();
}

class _JobPageState extends State<JobPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          text: widget.title,
          actions: [Icon(Entypo.bookmark)],
          child: GestureDetector(
            onTap: () => Get.back(),
            child: Icon(CupertinoIcons.arrow_left),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
        ),
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  width: width,
                  height: height * 0.27,
                  color: Color(kLightGrey.value),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      const HeightSpacer(size: 10),
                      ReusableText(
                          text: "Senior Flutter Developer",
                          style: appStyle(
                              22, Color(kDark.value), FontWeight.w600)),
                      const HeightSpacer(size: 5),
                      ReusableText(
                          text: "New York",
                          style: appStyle(
                              16, Color(kDarkGrey.value), FontWeight.normal)),
                      const HeightSpacer(size: 15),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 50.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomOutlineBtn(
                                width: width * 0.26,
                                color2: Color(kLight.value),
                                text: "Full - time",
                                color: Color(kOrange.value)),
                            Row(
                              children: [
                                ReusableText(
                                    text: "10k",
                                    style: appStyle(22, Color(kDark.value),
                                        FontWeight.w600)),
                                SizedBox(
                                  width: width * 0.2,
                                  child: ReusableText(
                                      text: "/monthly",
                                      style: appStyle(22, Color(kDark.value),
                                          FontWeight.w600)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const HeightSpacer(size: 20),
                ReusableText(
                    text: "Job Description",
                    style: appStyle(22, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(size: 10),
                Text(desc,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: appStyle(
                        16, Color(kDarkGrey.value), FontWeight.normal)),
                const HeightSpacer(size: 20),
                ReusableText(
                    text: "Requirements",
                    style: appStyle(22, Color(kDark.value), FontWeight.w600)),
                const HeightSpacer(size: 10),
                SizedBox(
                  height: height * 0.6,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: requirements.length,
                    itemBuilder: (context, index) {
                      final req = requirements[index];
                      String bullet = '\u2022';

                      return Text(
                        "$bullet $req\n",
                        maxLines: 4,
                        textAlign: TextAlign.justify,
                        style: appStyle(
                            16, Color(kDarkGrey.value), FontWeight.normal),
                      );
                    },
                  ),
                ),
                const HeightSpacer(size: 20),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.h),
                child: CustomOutlineBtn(
                  width: width,
                  height: height * 0.06,
                  text: "Apply Now",
                  color: Color(kLight.value),
                  color2: Color(kOrange.value),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
