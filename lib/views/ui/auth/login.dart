import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobhubv2_0/constants/app_constants.dart';
import 'package:jobhubv2_0/views/common/app_bar.dart';
import 'package:jobhubv2_0/views/common/custom_btn.dart';
import 'package:jobhubv2_0/views/common/custom_textfield.dart';
import 'package:jobhubv2_0/views/common/exports.dart';
import 'package:jobhubv2_0/views/common/height_spacer.dart';
import 'package:jobhubv2_0/views/common/reusable_text.dart';
import 'package:jobhubv2_0/views/ui/auth/signup.dart';
import 'package:jobhubv2_0/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: "Login",
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.arrow_left),
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const HeightSpacer(size: 50),
                ReusableText(
                  text: "Welcome Back!",
                  style: appStyle(30, Color(kDark.value), FontWeight.w600),
                ),
                ReusableText(
                  text: "Fill the details to login to your account",
                  style: appStyle(16, Color(kDarkGrey.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 50),
                CustomTextField(
                    validator: (email) {
                      if (email!.isEmpty || !email.contains("@")) {
                        return "Please enter a valid email";
                      } else {
                        return "";
                      }
                    },
                    controller: email,
                    hintText: "Email",
                    keyboardType: TextInputType.emailAddress),
                const HeightSpacer(size: 20),
                CustomTextField(
                  validator: (password) {
                    if (password!.isEmpty || password.length < 7) {
                      return "Please enter a valid password";
                    } else {
                      return "";
                    }
                  },
                  obscureText: loginNotifier.obscureText,
                  controller: password,
                  hintText: "Password",
                  keyboardType: TextInputType.name,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginNotifier.obscureText = !loginNotifier.obscureText;
                    },
                    child: loginNotifier.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                const HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const RegistrationPage());
                    },
                    child: ReusableText(
                      text: 'Register',
                      style: appStyle(14, Color(kDark.value), FontWeight.w500),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: "Login",
                  onTap: () {
                    Get.to(() => const MainScreen());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
