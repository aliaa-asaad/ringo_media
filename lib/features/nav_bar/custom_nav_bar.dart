import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ringo_media/core/components/custom_button.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/images.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/calendar/presentation/view/screens/calendar_screen.dart';
import 'package:ringo_media/features/nav_bar/domain/nav_bar_model.dart';
import 'package:ringo_media/features/project/presentation/view/screens/project_summary_screen.dart';
import 'package:ringo_media/test_screen.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  CustomNavBarState createState() => CustomNavBarState();
}

class CustomNavBarState extends State<CustomNavBar> {
  var currentIndex = 1;
  /* DateTime? date;
  pickDate() async {
    showDatePicker(
      barrierDismissible: false,
      confirmText: 'Continue',
      cancelText: null,
      
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2001, 1, 1),
      lastDate: DateTime(2025, 12, 30),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        date = value;
      });
    });
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => customBottomSheet(context),
        shape: const CircleBorder(),
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
                onTap: index == 2
                    ? null
                    : () {
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
                        index == currentIndex
                            ? screens[index].filledIcon!
                            : screens[index].icon!,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> customBottomSheet(BuildContext context) {
    return showModalBottomSheet(isScrollControlled: true,
      constraints: BoxConstraints(
          minHeight: MediaQueryHelper.height * .75,
          maxHeight: MediaQueryHelper.height * .75,
          maxWidth: MediaQueryHelper.width,
          minWidth: MediaQueryHelper.width),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      context: context,
      builder: (_) => SizedBox(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  width: 50,
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      'Choose Date',
                      style: TextStyleHelper.bold16,
                    ),
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),Divider(
              color: CutsomColors.neutralColor300,
              thickness: 1,
            ),
            const CustomCalendarSheet(),
            Divider(
              color: CutsomColors.neutralColor300,
              thickness: 1,
            ),
            
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'Continue',
              ),
            ),

          ],
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
