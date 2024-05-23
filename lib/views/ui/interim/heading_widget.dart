import 'package:flutter/material.dart';
import 'package:jobhubv2_0/views/common/exports.dart';

class HeadingWidget extends StatelessWidget {
  const HeadingWidget({super.key, required this.onTap, required this.text});
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ReusableText(
            text: text,
            style: appStyle(20, Color(kDark.value), FontWeight.w600)),
        GestureDetector(
          onTap: onTap,
          child: ReusableText(
              text: "View all",
              style: appStyle(18, Color(kOrange.value), FontWeight.w500)),
        )
      ],
    );
  }
}
