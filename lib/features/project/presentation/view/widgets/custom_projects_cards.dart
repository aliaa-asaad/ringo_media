import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/project/presentation/view/domain/card_model.dart';

class CustomProjectsCards extends StatelessWidget {
  const CustomProjectsCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<CardModel> content = [
      CardModel(
        icon: AppImages.clock,
        number: 10,
        title: 'Project in progress ',
        topColor: CutsomColors.additionalBlueGradientTop,
        bottomColor: CutsomColors.additionalBlueGradientBottom,
      ),
      CardModel(
        icon: AppImages.verify,
        number: 24,
        title: 'Project Completed',
        topColor: CutsomColors.additionalGreenGradientTop,
        bottomColor: CutsomColors.additionalGreenGradientBottom,
      ),
      CardModel(
        icon: AppImages.closeCircle,
        number: 5,
        title: 'Project Cancelled',
        topColor: CutsomColors.additionalRedGradientTop,
        bottomColor: CutsomColors.additionalRedGradientBottom,
      ),
    ];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        3,
        (index) => Container(
          padding: const EdgeInsets.all(16),
          height: MediaQueryHelper.width / 3 - 22,
          width: MediaQueryHelper.width / 3 - 22,
          decoration: BoxDecoration(
            /*  boxShadow: [
              BoxShadow(
                color: content[index].topColor.withOpacity(0.5),
                spreadRadius: .0,
                blurRadius: 10,
                offset: const Offset(0, 2), // changes position of shadow
              ),
            ], */
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                tileMode: TileMode.clamp,
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.0,
                  100
                ],
                colors: [
                  content[index].topColor,
                  content[index].bottomColor,
                ]),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${content[index].number}',
                    style: TextStyleHelper.bold24
                        .copyWith(color: CutsomColors.neutralColor0),
                  ),
                  SvgPicture.asset(content[index].icon)
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Expanded(
                child: Text(
                  content[index].title,
                  style: TextStyleHelper.medium12
                      .copyWith(color: CutsomColors.neutralColor0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
