import 'package:artemis_webapp/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AirWidget extends StatelessWidget {
  final Color containerColor;
  final Color textColorTitle;
  final Color textColorDescription;
  final Color textColorValueUnit;
  final String title;
  final String description;
  final double value;
  final String unit;
  final String unit1;
  final double height;
  final double width;
  final List<Color> gradientColors;

  const AirWidget({
    super.key,
    required this.containerColor,
    required this.textColorTitle,
    required this.textColorDescription,
    required this.textColorValueUnit,
    required this.title,
    required this.description,
    required this.value,
    required this.unit,
    required this.unit1,
    required this.height,
    required this.width,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: Decorations.borderRadius,
        boxShadow: [Decorations.boxShadow],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: AppTextStyles.title1
                            .copyWith(color: textColorTitle)),
                    Text(description,
                        style: AppTextStyles.description
                            .copyWith(color: textColorDescription)),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(value.toString(),
                            style: TextStyle(
                              color: textColorValueUnit,
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            )),
                        SizedBox(
                          width: 5,
                        ),
                        Text(unit,
                            style: TextStyle(
                              color: textColorValueUnit,
                              fontSize: 15,
                            )),
                      ],
                    ),
                    Text(unit1,
                        style: AppTextStyles.subtitle1
                            .copyWith(color: textColorDescription)),
                  ],
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 3,
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: LineChart(
                    mainData(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget topTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: textColorDescription,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('1:00', style: style);
        break;
      case 2:
        text = Text('2:00', style: style);
        break;
      case 3:
        text = Text('3:00', style: style);
        break;
      case 4:
        text = Text('4:00', style: style);
        break;
      case 5:
        text = Text('5:00', style: style);
        break;
      case 6:
        text = Text('6:00', style: style);
        break;
      case 7:
        text = Text('7:00', style: style);
        break;
      case 8:
        text = Text('8:00', style: style);
        break;
      case 9:
        text = Text('9:00', style: style);
        break;
      case 10:
        text = Text('10:00', style: style);
        break;
      case 11:
        text = Text('11:00', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: topTitleWidgets,
          ),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
          // ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      minX: 0,
      maxX: 12,
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 3),
            FlSpot(1, 1.2),
            FlSpot(2, 4),
            FlSpot(3, 1),
            FlSpot(4, 0.5),
            FlSpot(5, 2.5),
            FlSpot(6, 3.2),
            FlSpot(7, 4),
            FlSpot(8, 2.8),
            FlSpot(9, 5),
            FlSpot(10, 1.4),
            FlSpot(11, 5),
            FlSpot(12, 3.1),
          ],
          isCurved: true,
          color: textColorValueUnit,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: gradientColors),
          ),
        ),
      ],
    );
  }
}
