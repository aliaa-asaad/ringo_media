import 'package:flutter/material.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';

class CustomCalendarListView extends StatefulWidget {
  const CustomCalendarListView({super.key});

  @override
  State<CustomCalendarListView> createState() => _CustomCalendarListViewState();
}

class _CustomCalendarListViewState extends State<CustomCalendarListView> {
  DateTime selectedPreviousDate =
      DateTime.now().subtract(const Duration(days: 30));
  DateTime selectedDate = DateTime.now();
  int currentDateSelectedIndex = 0;
  ScrollController scrollController = ScrollController();
  List<String> listOfMonths = [
    "Jan",
    "Feb",
    "Mar",
    'Apr',
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  List<String> listOfDays = ["Mon", "Tue", "Wed", "Tue", "Fri", "Sat", "Sun"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Show Current Date
        Container(
          //height: 90,
          margin: const EdgeInsets.only(left: 10),
          alignment: Alignment.centerLeft,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  "${listOfMonths[selectedDate.month - 1]} ${selectedDate.year}",
                  style: TextStyleHelper.bold18),
              // const SizedBox(width: 8),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down),
              ),
              const Spacer(),
              IconButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(10, 10)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      side: BorderSide(color: CutsomColors.neutralColor200),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                icon: const Icon(Icons.keyboard_arrow_left_rounded),
                onPressed: () {
                  setState(() {
                    selectedDate =
                        selectedDate.subtract(const Duration(days: 7));
                    if (currentDateSelectedIndex == 0) {
                      scrollController.animateTo(
                        scrollController.offset - 48,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                    if (currentDateSelectedIndex > 0) {
                      currentDateSelectedIndex -= 6;
                    }
                  });
                  //Navigator.pop(context);
                },
              ),
              IconButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(10, 10)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(8)),
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      side: BorderSide(color: CutsomColors.neutralColor200),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                ),
                onPressed: () {
                  setState(() {
                    selectedDate = selectedDate.add(const Duration(days: 7));
                    currentDateSelectedIndex += 6;
                    if (currentDateSelectedIndex == 6) {
                      scrollController.animateTo(
                        scrollController.offset + 48,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      );
                    }
                  });
                },
                icon: const Icon(Icons.keyboard_arrow_right_rounded),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        // Calendar Widget
        SizedBox(
          height: 100,
          child: ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 8);
            },
            itemCount: 365,
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  setState(() {
                    currentDateSelectedIndex = index;
                    selectedDate = DateTime.now().add(Duration(days: index));
                  });
                },
                child: Container(
                  height: 68,
                  width: 48,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(1, 1),
                        blurRadius: 2,
                      ),
                    ],
                    color: currentDateSelectedIndex == index
                        ? CutsomColors.neutralColor900
                        : Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        listOfMonths[
                            DateTime.now().add(Duration(days: index)).month -
                                1],
                        style: TextStyleHelper.bold12.copyWith(
                          color: currentDateSelectedIndex == index
                              ? Colors.white
                              : CutsomColors.neutralColor500,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateTime.now()
                            .add(Duration(days: index))
                            .day
                            .toString(),
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: currentDateSelectedIndex == index
                              ? Colors.white
                              : CutsomColors.neutralColor900,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
