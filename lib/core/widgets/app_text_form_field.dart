import 'package:book_reservation_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hintText;
  final String? prefixIconPath;
  final IconData? prefixIconData;
  final bool obscureText;
  final bool showSuffixIcon;
  final IconData? suffixIconData;

  final String? suffixImage;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onSuffixIconPressed;
  final bool readOnly;
  final double verticalPadding;
  final double horizontalPadding;
  final bool isPrefixIcon;
  final bool svgSuffixIcon;
  final bool errorBorderVisible;
  final List<TextInputFormatter>? inputFormatters;

  const AppTextFormField({
    super.key,
    this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    required this.hintText,
    this.prefixIconPath,
    this.prefixIconData,
    this.obscureText = false,
    this.showSuffixIcon = false,
    this.suffixIconData,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.onSuffixIconPressed,
    this.readOnly = false,
    this.verticalPadding = 16.0,
    this.horizontalPadding = 16.0,
    this.isPrefixIcon = false,
    this.svgSuffixIcon = false,
    this.suffixImage,
    this.inputFormatters,
    this.errorBorderVisible = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: obscureText,
      autofocus: true,
      autovalidateMode: AutovalidateMode.always,
      textAlignVertical: TextAlignVertical.center,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        color: purple3,
      ),
      decoration: InputDecoration(
        fillColor: white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w400,
          color: inputHint,
        ),

        contentPadding: EdgeInsets.symmetric(
          vertical: 16.h,
          horizontal: 20.w,
        ),

        prefixIcon: isPrefixIcon
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Image.asset(
                  prefixIconPath!,
                  width: 18.w,
                  height: 18.h,
                ),
              )
            : Icon(
                prefixIconData,
                color: Color(0xffD4CFDA),
                size: 20,
              ),

        // Trailing icon (suffix)
        suffixIcon: showSuffixIcon
            ? svgSuffixIcon
                ? InkWell(
                    onTap: onSuffixIconPressed,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.asset(suffixImage!),
                    ),
                  )
                : IconButton(
                    icon: Icon(
                      suffixIconData,
                      size: 18.w,
                    ),
                    onPressed: onSuffixIconPressed,
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    focusColor: Colors.transparent,
                  )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: inputStroke, // Blue border color
            width: 1.5, // Border thickness
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: purple3, // Blue border color
            width: 1.5, // Thicker border on focus
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
      ),
      validator: validator,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      inputFormatters: inputFormatters,
    );
  }
}
