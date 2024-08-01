import 'package:flutter/material.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/calendar/presentation/view/domain/calendar_model.dart';

class TasksTabBar extends StatelessWidget {
  const TasksTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    List<CalendarModel> content = [
      CalendarModel(
          title: 'Meeting Concept',
          dueDate: 'Due Date : Mon, 12 Jan 2023'),
      CalendarModel(
          title: 'Information Architecture',
          dueDate: 'Due Date : Mon, 12 Jan 2023'),
      CalendarModel(
          title: 'Monitoring Project',
          dueDate: 'Due Date : Mon, 12 Jan 2023'),
      CalendarModel(
          title: 'Daily Standup',
          dueDate: 'Due Date : Mon, 12 Jan 2023'),
      CalendarModel(
          title: 'Information Architecture',
          dueDate: 'Due Date : Mon, 12 Jan 2023'),
    ];
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
            content.length,
            (index) => Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: CutsomColors.neutralColor200,
                            offset: Offset(0, 0),
                            blurRadius: 6,
                            spreadRadius: 6)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            content[index].title!,
                            style: TextStyleHelper.medium16,
                          ),
                          Text(
                            content[index].dueDate!,
                            style: TextStyleHelper.regular12
                                .copyWith(color: CutsomColors.neutralColor600),
                          ),
                        ],
                      ),
                      Checkbox.adaptive(
                        value: true,
                        onChanged: (value) {},
                        activeColor: CutsomColors.additionalGreen,
                      )
                    ],
                  ),
                )),
      ),
    );
  }
}
