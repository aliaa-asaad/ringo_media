import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/features/calendar/presentation/view/screens/calendar_screen.dart';
import 'package:ringo_media/features/nav_bar/domain/nav_bar_model.dart';
import 'package:ringo_media/features/project/presentation/view/screens/project_summary_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  var currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},shape: const CircleBorder(),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset(
          AppImages.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: screens[currentIndex].route,
     // backgroundColor: Colors.white,
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: CutsomColors.neutralColor0,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 12.r,
                spreadRadius: 5,
                offset: const Offset(0, 0),
              ),
            ],
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              screens.length,
              (index) => InkWell(
                onTap:index==2?null: () {
                  setState(
                    () {
                      currentIndex = index;
                    },
                  );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: index == 2
                    ? const SizedBox()
                    : SvgPicture.asset(
                      index == currentIndex?  screens[index].filledIcon!:screens[index].icon!,
                  
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

List<CustomNavBarModel> screens = [
  CustomNavBarModel(
      filledIcon: AppImages.filledCategory,
      icon: AppImages.category,
      route: const Scaffold()),
  CustomNavBarModel(
      filledIcon: AppImages.filledFolder,
      icon: AppImages.folder,
      route: const ProjectSummaryScreen()),
  CustomNavBarModel(),
  CustomNavBarModel(
      filledIcon: AppImages.filledCalendar,
      icon: AppImages.calendar,
      route: const CalendarScreen()),
  CustomNavBarModel(
      filledIcon: AppImages.filledAvatar,
      icon: AppImages.avatar,
      route: const Scaffold()),
];
