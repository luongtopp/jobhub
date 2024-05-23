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
import 'package:jobhubv2_0/views/ui/auth/login.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signupNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              text: "Sign up",
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
                  text: "Hello Welcome!",
                  style: appStyle(30, Color(kDark.value), FontWeight.w600),
                ),
                ReusableText(
                  text: "Fill the details to signup for an account",
                  style: appStyle(16, Color(kDarkGrey.value), FontWeight.w600),
                ),
                const HeightSpacer(size: 50),
                CustomTextField(
                    validator: (email) {
                      if (email!.isEmpty) {
                        return "Please enter your name";
                      } else {
                        return "";
                      }
                    },
                    controller: name,
                    hintText: "Full name",
                    keyboardType: TextInputType.name),
                const HeightSpacer(size: 20),
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
                    if (signupNotifier.passwordValidator(password!)) {
                      return "Please enter avalid password with at least on uppercase, on lowercase, one digit, a special character length of 8 characters";
                    }
                    return null;
                  },
                  obscureText: signupNotifier.obscureText,
                  controller: password,
                  hintText: "Password",
                  keyboardType: TextInputType.name,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      signupNotifier.obscureText = !signupNotifier.obscureText;
                    },
                    child: signupNotifier.obscureText
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                  ),
                ),
                const HeightSpacer(size: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => const LoginPage());
                    },
                    child: ReusableText(
                      text: 'Login',
                      style: appStyle(14, Color(kDark.value), FontWeight.w500),
                    ),
                  ),
                ),
                const HeightSpacer(size: 50),
                CustomButton(
                  text: "Sign up",
                  onTap: () {},
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
