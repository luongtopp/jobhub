import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/drawer/drawer_widget.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/common/heading_widget.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/search.dart';
import 'package:jobhubv2_0/views/ui/jobs/job_page.dart';
import 'package:jobhubv2_0/views/ui/jobs/widgets/horizontal_title.dart';
import 'package:jobhubv2_0/views/ui/search/searchpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(12.h),
              child: const CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage("assets/images/user.png"),
              ),
            ),
          ],
          child: const DrawerWidget(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(children: [
              const HeightSpacer(size: 10),
              Text("Search \nFind & Apply",
                  style: appStyle(40, Color(kDark.value), FontWeight.bold)),
              const HeightSpacer(size: 40),
              SearchWidget(
                onTap: () {
                  Get.to(() => const SearchPage());
                },
              ),
              const HeightSpacer(size: 30),
              HeadingWidget(
                text: 'Popular Jobs',
                onTap: () {},
              ),
              const HeightSpacer(size: 15),
              SizedBox(
                height: height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    return JobHorizontalTile(
                      onTap: () {
                        Get.to(() => const JobPage(
                              title: 'Facebook',
                              id: '12',
                            ));
                      },
                    );
                  }),
                ),
              ),
              const HeightSpacer(size: 20),
              HeadingWidget(
                text: 'Recently Posted',
                onTap: () {},
              ),
              const HeightSpacer(size: 20),
              SizedBox(
                height: height * 0.28,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: ((context, index) {
                    // return VerticalTile(
                    //   job: null,
                    // );
                  }),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
