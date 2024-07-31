import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:ringo_media/core/utilities/colors.dart';
import 'package:ringo_media/core/utilities/media_quary.dart';
import 'package:ringo_media/core/utilities/text_style_helper.dart';
import 'package:ringo_media/features/project/presentation/view/domain/productivity_model.dart';

class ProductivityBarChart extends StatefulWidget {
  const ProductivityBarChart({
    super.key,
  });

  @override
  State<ProductivityBarChart> createState() => _ProductivityBarChartState();
}

class _ProductivityBarChartState extends State<ProductivityBarChart> {
  int barIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<ProductivityModel> data = [
      ProductivityModel('Jan', 75),
      ProductivityModel('Feb', 88),
      ProductivityModel('Mar', 70),
      ProductivityModel('Apr', 90),
      ProductivityModel('May', 65),
      ProductivityModel('Jun', 80),
    ];

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        barTouchData: BarTouchData(
          allowTouchBarBackDraw: true,

          enabled: true,
          //  allowTouchBarBackDraw: true,handleBuiltInTouches: true,
          touchTooltipData: BarTouchTooltipData(
            //  tooltipBgColor: CutsomColors.neutralColor900,
            getTooltipColor: (barChartData) =>
                CutsomColors.neutralColor900, //fitInsideVertically: true,
            //  fitInsideHorizontally: true,

            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              /* setState(() {
                barIndex = groupIndex;
              }); */
              return BarTooltipItem(
                '${data[groupIndex].productivity.toInt()}%',
                TextStyleHelper.bold14.copyWith(color: Colors.white),
              );
            },
          ),

          touchCallback: (FlTouchEvent event, response) {
            setState(() {
              if (!event.isInterestedForInteractions ||
                  response == null ||
                  response.spot == null) {
                barIndex = -1;
                return;
              }
              barIndex = response.spot!.touchedBarGroupIndex;
            });
          },
        ),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 35,
              showTitles: true,
              interval: 10,
              getTitlesWidget: (value, meta) => Padding(
                  padding: const EdgeInsets.only(top: 12.0),
                  child: Text(
                    data[value.toInt()].month,
                    style: TextStyleHelper.medium14.copyWith(
                      color: barIndex == value.toInt()
                          ? CutsomColors.neutralColor900
                          : CutsomColors.neutralColor600,
                    ),
                  )),
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              //getTitlesWidget: (value, meta) => Text(value.toString()),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              //getTitlesWidget: (value, meta) => Text(value.toString()),
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
              //getTitlesWidget: (value, meta) => Text(value.toString()),
            ),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        gridData: const FlGridData(
          show: false,
        ),
        barGroups: data
            .asMap()
            .map(
              (index, data) => MapEntry(
                index,
                BarChartGroupData(x: index, barRods: [
                  BarChartRodData(
                      toY: data.productivity,
                      color: barIndex == index
                          ? CutsomColors.neutralColor900
                          : CutsomColors.neutralColor300,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      width: MediaQueryHelper.width / 6 - 16),
                  //    y: data.productivity,
                  /*   colors: [Colors.blue], */
                ]),
              ),
            )
            .values
            .toList(),
      ),
    );
  }
}
