import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendarSheet extends StatefulWidget {
  const CustomCalendarSheet({super.key});

  @override
  State<CustomCalendarSheet> createState() => _CustomCalendarSheetState();
}

class _CustomCalendarSheetState extends State<CustomCalendarSheet> {
  DateTime? _selectedDay = DateTime.now();
  DateTime? _focusedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60.0, // Custom height for days of the week row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(7, (index) {
              final day = DateTime.now()
                  .subtract(Duration(days: DateTime.now().weekday - 1 - index));
              return Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  DateFormat.E('en_US').format(day)[0],
                  style: TextStyleHelper.semiBold14
                      .copyWith(color: CutsomColors.neutralColor900),
                ),
              );
            }),
          ),
        ),
        TableCalendar(
          locale: 'en_US',
          /* selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              }, */
          daysOfWeekVisible: false,
          weekNumbersVisible: false,
          currentDay: _selectedDay,
          calendarFormat: CalendarFormat.month,
          onDaySelected: (selectedDay, focusedDay) => setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          }),
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) =>
                DateFormat.E(locale).format(date)[0],
            weekdayStyle: TextStyleHelper.semiBold14
                .copyWith(color: CutsomColors.neutralColor900),
            weekendStyle: TextStyleHelper.semiBold14
                .copyWith(color: CutsomColors.neutralColor900),
          ),
          headerStyle: HeaderStyle(
            titleCentered: true,
            titleTextStyle: TextStyleHelper.bold18,
            //   .copyWith(color: CutsomColors.neutralColor900),
            formatButtonVisible: false,
            leftChevronIcon: const Icon(
              Icons.chevron_left,
              color: CutsomColors.neutralColor900,
            ),
            rightChevronIcon: const Icon(
              Icons.chevron_right,
              color: CutsomColors.neutralColor900,
            ),
          ),
          availableCalendarFormats: const {
            CalendarFormat.month: 'Month',
            //  CalendarFormat.week: 'Week',
          },
          calendarStyle: CalendarStyle(
            todayDecoration: const BoxDecoration(
              color: CutsomColors.neutralColor900,
              shape: BoxShape.circle,
            ),
            // dayTextFormatter: (date, locale) => '${date.day}',
            /* selectedDecoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ), */
            weekendTextStyle: TextStyleHelper.semiBold16
                .copyWith(color: CutsomColors.neutralColor900),
            defaultTextStyle: TextStyleHelper.semiBold16
                .copyWith(color: CutsomColors.neutralColor900),
            outsideTextStyle: TextStyleHelper.semiBold16
                .copyWith(color: CutsomColors.neutralColor500),
            //disabledTextStyle: TextStyleHelper.semiBold16.copyWith(color: CutsomColors.neutralColor900),
            //holidayTextStyle: TextStyleHelper.semiBold16.copyWith(color: CutsomColors.neutralColor900),
            //  dayTextFormatter: (date, locale) => '${date.day}',
            selectedTextStyle:
                TextStyleHelper.semiBold16.copyWith(color: Colors.white),
            todayTextStyle:
                TextStyleHelper.semiBold16.copyWith(color: Colors.white),
          ),
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2025, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ],
    );
  }
}
