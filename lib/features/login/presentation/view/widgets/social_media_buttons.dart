import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/login/presentation/view/domain/social_media_model.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    List<SocialMediaModel> content = [
      SocialMediaModel(name: 'Google', icon: AppImages.google),
      SocialMediaModel(name: 'Facebook', icon: AppImages.facebook),
      SocialMediaModel(name: 'Apple', icon: AppImages.apple)
    ];
    return Column(
      children: List.generate(
          content.length,
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: SvgPicture.asset(content[index].icon),
                  label: Center(
                    child: Text(
                      'Continue with ${content[index].name}',
                      style: TextStyleHelper.bold16,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CutsomColors.neutralColor0,
                    elevation: 0,
                    alignment: Alignment.centerLeft,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(
                        color: CutsomColors.neutralColor200,
                      ),
                    ),
                  ),
                ),
              )),
    );
  }
}
