import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/calendar/presentation/view/domain/schedule_model.dart';

class ScheduleTabBar extends StatelessWidget {
  const ScheduleTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<ScheduleModel> content = [
      ScheduleModel(
          title: 'Sprint Review Period 02 in May 2022',
          rightColor: CutsomColors.additionalPurple,
          leftColor: CutsomColors.additionalPurple.withOpacity(.5)),
      ScheduleModel(
          title: 'Daily Standup',
          rightColor: CutsomColors.additionalRedGradientTop,
          leftColor: CutsomColors.additionalRedGradientBottom),
      ScheduleModel(
          title: 'Meeting with Client',
          leftColor: CutsomColors.additionalGreenGradientTop,
          rightColor:
              CutsomColors.additionalGreenGradientBottom.withOpacity(.5)),
      ScheduleModel(
          title: 'Daily Standup',
          leftColor: CutsomColors.additionalRedGradientTop,
          rightColor: CutsomColors.additionalRedGradientBottom.withOpacity(.5)),
    ];

    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          4,
          (index) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('${index + 9}:00'),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      color: CutsomColors.neutralColor200,
                      width: MediaQueryHelper.width - 100,
                      height: 2,
                    ),
                    index == 1
                        ? const SizedBox(
                            height: 64,
                          )
                        : Container(
                            height: 64,
                            width: MediaQueryHelper.width - 118,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: content[index].rightColor,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 6,
                                  decoration: BoxDecoration(
                                    color: content[index].leftColor,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      bottomLeft: Radius.circular(8),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Text(content[index].title,
                                              style:
                                                  TextStyleHelper.semiBold14),
                                        ),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImages.clock,
                                              color:
                                                  CutsomColors.neutralColor600,
                                            ),
                                            Text(
                                              '${index + 9}:00 - ${index + 10}:00',
                                              style: TextStyleHelper.medium12
                                                  .copyWith(
                                                color: CutsomColors
                                                    .neutralColor600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
