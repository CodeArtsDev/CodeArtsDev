import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CaComparisionBarChartValue {
  double value1;
  double value2;
  String title;

  CaComparisionBarChartValue(this.value1, this.value2, this.title);
}

class CaComparisionBarChart extends StatelessWidget {
  final List<CaComparisionBarChartValue> values;
  late double? maxY;
  late double? minY;
  String Function(double value) yLabelProvider;

  CaComparisionBarChart(this.values,
      {required this.yLabelProvider, this.maxY, this.minY, Key? key})
      : super(key: key) {
    _initializeMaxValues();
  }

  _initializeMaxValues() {
    if (maxY == null) {
      maxY = 0;
      for (var value in values) {
        maxY = value.value1 > maxY! ? value.value1 : maxY;
      }
    }

    if (minY == null) {
      minY = 0;
      for (var value in values) {
        minY = value.value2 > minY! ? value.value2 : minY;
      }
    }

    if (maxY! > minY!) {
      minY = maxY;
    } else {
      maxY = minY;
    }

    minY = -minY!;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 10),
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxY,
              minY: minY,
              barTouchData: BarTouchData(
                enabled: false,
                touchTooltipData: BarTouchTooltipData(
                  tooltipBgColor: Colors.transparent,
                  tooltipPadding: const EdgeInsets.all(0),
                  getTooltipItem: (
                    BarChartGroupData group,
                    int groupIndex,
                    BarChartRodData rod,
                    int rodIndex,
                  ) {
                    return BarTooltipItem(
                      rod.fromY.round().toString(),
                      const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 0),
                    );
                  },
                ),
              ),
              titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 10),
                    margin: 5,
                    getTitles: (double value) {
                      return values[value.round()].title;
                    },
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTextStyles: (context, value) => const TextStyle(
                        color: Color(0xff7589a2),
                        fontWeight: FontWeight.bold,
                        fontSize: 7),
                    margin: 5,
                    interval: maxY! / 4,
                    getTitles: yLabelProvider,
                  ),
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false)),
              borderData: FlBorderData(
                show: false,
              ),
              gridData: FlGridData(show: false),
              barGroups: _getChartBars(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _getChartBars() {
    List<BarChartGroupData> chartBars = [];
    for (var i = 0; i < values.length; i++) {
      var chartBar = BarChartGroupData(
        barsSpace: -5,
        x: i,
        barRods: [
          BarChartRodData(
              width: 5,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              toY: values[i].value1,
              colors: [Colors.greenAccent]),
          BarChartRodData(
              width: 5,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4)),
              toY: -values[i].value2,
              colors: [Colors.redAccent])
        ],
        // showingTooltipIndicators: [0],
      );

      chartBars.add(chartBar);
    }
    return chartBars;
  }
}
