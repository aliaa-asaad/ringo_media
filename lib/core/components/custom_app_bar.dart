import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({
    super.key, required this.title,
  });
  @override
  Size get preferredSize {
    return const Size.fromHeight(80);
    //  return Size.fromHeight(bottom == null ? kToolbarHeight : kToolbarHeight + bottom!.preferredSize.height);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 80,
       elevation: 0,scrolledUnderElevation: 0,
      backgroundColor: CutsomColors.neutralColor100,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1.0), 
        child: Container(
          color: CutsomColors.neutralColor200,
          height: 1.0,
        ),
      ),
      leading: IconButton(
        icon: SvgPicture.asset(AppImages.menu),
        onPressed: () {
          //Navigator.pop(context);
        },
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: IconButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all(
                const RoundedRectangleBorder(
                  side: BorderSide(color: CutsomColors.neutralColor200),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
            icon: SvgPicture.asset(AppImages.notification),
            onPressed: () {
              //Navigator.pop(context);
            },
          ),
        ),
      ],
      title: Text(
        title,
        style: TextStyleHelper.bold16,
      ),
    );
  }
}
