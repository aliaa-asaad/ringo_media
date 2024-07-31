import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';

class CustomFormField extends StatefulWidget {
  final String? hintText;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool isAuth;
  final Color? fillColor;
  final String icon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final Widget? iconWidget;
  final Color? hintColor;
  const CustomFormField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.isPassword = false,
    required this.controller,
    this.icon = '',
    this.validator,
    this.isAuth = true,
    this.fillColor,
    this.iconWidget,
    this.hintColor,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  bool passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: TextInputAction.next,
      obscureText: widget.isPassword ? passwordVisible : false,
      controller: widget.controller,
      enabled: true,
      style: TextStyleHelper.semiBold16.copyWith(
          //   height: 1.1.h,
          ) /* TextStyle(
        height: 1.1.h,
        fontSize: 16.sp,
      ) */
      ,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        // errorStyle: TextStyleHelper.caption11,
        fillColor: widget.fillColor ?? Colors.white,
        filled: true,
        suffixIcon: widget.isAuth
            ? widget.isPassword
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },
                    icon: passwordVisible
                        ? SvgPicture.asset(
                            AppImages.invisiblePassword,
                            // height: MediaQueryHelper.height * .02,
                          )
                        : SvgPicture.asset(
                            AppImages.visiblePassword,
                            // height: MediaQueryHelper.height * .02,
                          ),
                  )
                : const SizedBox()
            : Padding(
                padding: EdgeInsets.all(12.0.r),
                child: widget.iconWidget,
              ),
        /*  prefixIcon: widget.isAuth
            ? Padding(
                padding: EdgeInsets.all(12.0.r),
                child: SvgPicture.asset(
                  widget.icon,
                  height: MediaQueryHelper.height * .02,
                ),
              )
            : null,
        */
        hintStyle: TextStyleHelper.regular16,
        hintText: widget.hintText,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            //  style: BorderStyle.none,
            color: Theme.of(context).colorScheme.primary,
          ),
          /* borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.green,
          ), */
          /*  borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ), */
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            // style: BorderStyle.none,
            color: Theme.of(context).colorScheme.primary,
          ),
          /* borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.green,
          ), */
          /*  borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ), */
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            //  style: BorderStyle.none,
            color: Theme.of(context).colorScheme.primary,
          ),
          /* borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.green,
          ), */
          /*  borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ), */
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            //     style: BorderStyle.none,
            color: CutsomColors.neutralColor200,
          ),
          /* borderSide: BorderSide(
            style: BorderStyle.solid,
            color: Colors.green,
          ), */
          /*  borderRadius: BorderRadius.all(
            Radius.circular(16.0.r),
          ), */
        ),
      ),
    );
  }
}
