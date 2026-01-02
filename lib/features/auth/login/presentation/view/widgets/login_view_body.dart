import 'package:book_reservation_app/constant.dart';
import 'package:book_reservation_app/core/utils/validators.dart';
import 'package:book_reservation_app/core/widgets/app_button.dart';
import 'package:book_reservation_app/core/widgets/app_text_form_field.dart';
import 'package:book_reservation_app/features/auth/login/presentation/view_model/login_view_model';
import 'package:book_reservation_app/features/auth/register/presentation/view/register_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:iconsax/iconsax.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final vm = Get.put(LoginViewModel());
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();

    initValidation();
  }

  @override
  void dispose() {
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110.h,
                ),
                Text(
                  "Welcome to Bookly!",
                  style: TextStyle(
                    color: purple3,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Dive back into your reading world.",
                  style: TextStyle(
                      color: grey2,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w100),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      color: purple3,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                AppTextFormField(
                  focusNode: _emailFocus,
                  hintText: "you@example.com",
                  controller: vm.emailController,
                  errorBorderVisible: true,
                  isPrefixIcon: false,
                  onSubmitted: (value) {},
                  prefixIconData: Iconsax.sms4,
                  validator: (_) => emailError,
                  onChanged: (value) {
                    setState(() {
                      emailError = AppValidators.email(value);
                    });
                  },
                ),
                SizedBox(
                  height: 17.h,
                ),
                Text(
                  "Password",
                  style: TextStyle(
                      color: purple3,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold),
                ),
                AppTextFormField(
                  focusNode: _passwordFocus,
                  hintText: "Your password",
                  controller: vm.passwordController,
                  errorBorderVisible: true,
                  isPrefixIcon: false,
                  onSubmitted: (value) {},
                  prefixIconData: Iconsax.lock,
                  validator: (_) => passwordError,
                  onChanged: (value) {
                    setState(() {
                      passwordError = AppValidators.password(value);
                    });
                  },
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot Your Password?",
                      style: TextStyle(
                          color: purple,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700),
                    )),
                Spacer(),
                AppButton(
                  text: "Login",
                  onTap: vm.login,
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New to Bookly? ",
                      style: TextStyle(
                        color: grey2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          Get.to(RegisterView());
                        },
                        child: Text("Sign Up",
                            style: TextStyle(
                                color: purple,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500)))
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void initValidation() {
    _emailFocus.addListener(() {
      if (!_emailFocus.hasFocus) {
        setState(() {
          emailError = AppValidators.email(vm.emailController.text);
        });
      }
    });

    _passwordFocus.addListener(() {
      if (!_passwordFocus.hasFocus) {
        setState(() {
          passwordError = AppValidators.password(vm.passwordController.text);
        });
      }
    });
  }
}
