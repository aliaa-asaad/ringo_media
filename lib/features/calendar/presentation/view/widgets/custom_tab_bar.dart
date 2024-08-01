import 'package:flutter/material.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<Widget> viewsBody;
  final List<Tab> viewsTitle;

  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.viewsBody,
    required this.viewsTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 40,
        child: TabBar(
          unselectedLabelColor: CutsomColors.neutralColor500,
          indicatorWeight: 2,
          labelColor: CutsomColors.neutralColor900, isScrollable: false,
          labelStyle: TextStyleHelper.bold18,
          controller: tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          physics: const NeverScrollableScrollPhysics(),
          indicatorColor: CutsomColors.neutralColor900,
          // labelColor: Colors.white,
          //  unselectedLabelColor: Colors.grey.shade900,
          tabs: viewsTitle,
        ),
      ),
      Expanded(
        child: TabBarView(
          physics: const BouncingScrollPhysics(),
          controller: tabController,
          children: viewsBody,
        ),
      ),
    ]);
  }
}
