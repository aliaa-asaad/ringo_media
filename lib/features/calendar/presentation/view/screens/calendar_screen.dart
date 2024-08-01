import 'package:flutter/material.dart';
import 'package:ringo_media/core/components/custom_app_bar.dart';
import 'package:ringo_media/features/calendar/presentation/view/widgets/custom_calendar_list_view.dart';
import 'package:ringo_media/features/calendar/presentation/view/widgets/custom_tab_bar.dart';
import 'package:ringo_media/features/calendar/presentation/view/widgets/schedule_tab_bar.dart';
import 'package:ringo_media/features/calendar/presentation/view/widgets/tastks_tab_bar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Calendar'),
      //backgroundColor: CutsomColors.neutralColor100,
      body: SafeArea(
        child: Column(
          children: [
            const CustomCalendarListView(),
           
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24.0,24,24,0),
                child: CustomTabBar(
                  tabController: _tabController,
                  viewsBody: const [ScheduleTabBar(), TasksTabBar()],
                  viewsTitle: const [
                    Tab(
                      text: 'Schedule',
                    ),
                    Tab(
                      text: 'Tasks',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
