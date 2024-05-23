import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/ui/search/widgets/custom_field.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(kOrange.value),
        iconTheme: IconThemeData(
          color: Color(kLight.value),
        ),
        title: CustomField(
          controller: search,
          hintText: 'Search for a job',
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {});
            },
            child: const Icon(
              AntDesign.search1,
              color: Colors.white,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/optimized_search.png"),
              ReusableText(
                  text: "Start Search For Jobs",
                  style: appStyle(24, Color(kDark.value), FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}
