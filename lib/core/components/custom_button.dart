import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';

class CustomButton extends StatelessWidget {
  final Function()? onPressed;
  final String? text;
  final Color? background;
  final Color? textColor;

  final Widget? child;
  final double? width;
  const CustomButton(
      {super.key,
      this.onPressed,
      this.text,
      this.background,
      this.textColor,
      this.child,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: onPressed,
        child: AnimatedContainer(
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          width: width ?? MediaQueryHelper.width,
          margin: EdgeInsets.symmetric(
            vertical: 8.r, /* horizontal: 16.r */
          ),
          height: 56.h,
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          /* padding: EdgeInsets.symmetric(
                            vertical: 8.r, horizontal: 32.r), */
          decoration: BoxDecoration(
              color: onPressed != null
                  ? background ?? Theme.of(context).colorScheme.primary
                  : CutsomColors.neutralColor500,
              borderRadius: BorderRadius.circular(8.r)

              /* shape: state is RegisterLoading
                              ? BoxShape.circle
                              : null, */
              ),
          duration: const Duration(seconds: 1),
          child: child ??
              Text(text!,
                  style: TextStyleHelper.bold16
                      .copyWith(color: textColor ?? Colors.white)),
        ),
      ),
    );
  }
}
