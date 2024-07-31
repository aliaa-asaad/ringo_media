import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/components/custom_app_bar.dart';
import 'package:ringo_media/core/components/custom_button.dart';
import 'package:ringo_media/core/components/custom_form_field.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/project/presentation/view/widgets/custom_projects_cards.dart';
import 'package:ringo_media/features/project/presentation/view/widgets/productivity_bar_chart.dart';

class ProjectSummaryScreen extends StatelessWidget {
  const ProjectSummaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Project Summary',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Search',
                style: TextStyleHelper.semiBold14,
              ),
              CustomFormField(
                hintText: 'Search project here',
                keyboardType: TextInputType.text,
                controller: TextEditingController(),
                isAuth: false,
                iconWidget: SvgPicture.asset(AppImages.search),
              ),
              const SizedBox(
                height: 24,
              ),
              const CustomProjectsCards(),
              const SizedBox(
                height: 24,
              ),
              CustomButton(
                onPressed: () {},
                height: 48,
                textStyle: TextStyleHelper.bold14,
                text: 'View All Project',
                background: CutsomColors.neutralColor0,
                textColor: CutsomColors.neutralColor900,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                  height: 310,
                  // color: Colors.purple,
                  width: MediaQueryHelper.width,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Productivity',
                            style: TextStyleHelper.bold18,
                          ),
                          const Icon(Icons.more_horiz)
                        ],
                      ),
                      const SizedBox(
                        height: 36,
                      ),
                      const Expanded(child: ProductivityBarChart()),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
