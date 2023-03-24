import 'package:artemis_webapp/config/responsive.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class _LineChart extends StatelessWidget {
  const _LineChart({required this.isShowingMainData});

  final bool isShowingMainData;

  @override
  Widget build(BuildContext context) {
    return LineChart(
      sampleData1,
      //isShowingMainData ? sampleData1 : sampleData2,
      swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  LineChartData get sampleData1 => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1,
        minX: 0,
        maxX: 11,
        maxY: 100,
        minY: 0,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: AppColors.greyAccent,
        ),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
        lineChartBarData1_3,
      ];

  LineTouchData get lineTouchData2 => LineTouchData(
        enabled: false,
      );

  FlTitlesData get titlesData2 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: bottomTitles,
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: leftTitles(),
        ),
      );

  Widget leftTitleWidgets(double value, TitleMeta meta) {
    var style = AppTextStyles.body1.copyWith(
      color: AppColors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 10,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0';
        break;
      case 20:
        text = '20';
        break;
      case 40:
        text = '40';
        break;
      case 60:
        text = '60';
        break;
      case 80:
        text = '80';
        break;
      case 100:
        text = '100';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.center);
  }

  SideTitles leftTitles() => SideTitles(
        getTitlesWidget: leftTitleWidgets,
        showTitles: true,
        interval: 1,
        reservedSize: 40,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = AppTextStyles.body1.copyWith(
      color: AppColors.grey,
      fontWeight: FontWeight.w500,
      fontSize: 10,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = Text('JAN',
            style: AppTextStyles.body1.copyWith(
              color: AppColors.grey,
              fontWeight: FontWeight.w500,
              fontSize: 10,
            ));
        break;
      case 1:
        text = Text('FEB', style: style);
        break;
      case 2:
        text = Text('MAR', style: style);
        break;
      case 3:
        text = Text('APR', style: style);
        break;
      case 4:
        text = Text('MAY', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 6:
        text = Text('JUL', style: style);
        break;
      case 7:
        text = Text('AUG', style: style);
        break;
      case 8:
        text = Text('SEP', style: style);
        break;
      case 9:
        text = Text('OCT', style: style);
        break;
      case 10:
        text = Text('NOV', style: style);
        break;
      case 11:
        text = Text('DEC', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(
        show: false,
        border: const Border(
          bottom: BorderSide(color: Color(0xff4e4965), width: 4),
          left: BorderSide(color: Colors.transparent),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  //Environmental Data
  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        color: Colors.green,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 90),
          FlSpot(1, 60),
          FlSpot(2, 15),
          FlSpot(3, 40),
          FlSpot(4, 74),
          FlSpot(5, 25),
          FlSpot(6, 34),
          FlSpot(7, 82),
          FlSpot(8, 30),
          FlSpot(9, 78),
          FlSpot(10, 16),
          FlSpot(11, 22),
        ],
      );

  //Social Data
  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        color: AppColors.redTelemetry,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(0, 0),
          FlSpot(1, 0),
          FlSpot(2, 0),
          FlSpot(3, 26),
          FlSpot(4, 70),
          FlSpot(5, 48),
          FlSpot(6, 96),
          FlSpot(7, 28),
          FlSpot(8, 40),
          FlSpot(9, 28),
          FlSpot(10, 60),
          FlSpot(11, 0),
        ],
      );

  //Governance Data
  LineChartBarData get lineChartBarData1_3 => LineChartBarData(
        isCurved: true,
        color: AppColors.blue,
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(0, 68),
          FlSpot(1, 0),
          FlSpot(2, 89),
          FlSpot(3, 67),
          FlSpot(4, 18),
          FlSpot(5, 39),
          FlSpot(6, 38),
          FlSpot(7, 28),
          FlSpot(8, 48),
          FlSpot(9, 13),
          FlSpot(10, 78),
          FlSpot(11, 95),
        ],
      );
}

class LineChartSample1 extends StatefulWidget {
  const LineChartSample1({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  late bool isShowingMainData;

  @override
  void initState() {
    super.initState();
    isShowingMainData = true;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        padding: const EdgeInsets.only(
          right: 15.0,
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // const SizedBox(
                //   height: 37,
                // ),
                // const Text(
                //   'Monthly Assessment',
                //   style: TextStyle(
                //     color: Colors.black,
                //     fontSize: 32,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 2,
                //   ),
                //   textAlign: TextAlign.center,
                // ),
                const SizedBox(
                  height: 80,
                ),
                Expanded(
                  child: _LineChart(isShowingMainData: isShowingMainData),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Statistics', style: AppTextStyles.title),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // IconButton(
                        //   icon: Icon(
                        //     Icons.refresh,
                        //     color: Colors.black
                        //         .withOpacity(isShowingMainData ? 1.0 : 0.5),
                        //   ),
                        //   onPressed: () {
                        //     setState(() {
                        //       isShowingMainData = !isShowingMainData;
                        //     });
                        //   },
                        // ),
                        Image(
                          image:
                              AssetImage('assets/icons/Environmental-Line.png'),
                          height: 30,
                          width: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20),
                          child:
                              Text('Environmental', style: AppTextStyles.body1),
                        ),
                        Image(
                          image: AssetImage('assets/icons/Social-Line.png'),
                          height: 30,
                          width: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20),
                          child: Text('Social', style: AppTextStyles.body1),
                        ),
                        Image(
                          image: AssetImage('assets/icons/Governance-Line.png'),
                          height: 30,
                          width: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0, right: 20),
                          child: Text('Governance', style: AppTextStyles.body1),
                        ),
                      ],
                    ),
                    if (Responsive.isDesktop(context) ||
                        Responsive.isTablet(context))
                      Padding(
                        padding: EdgeInsets.only(right: 0),
                        child: Text('Monthly Assessment',
                            style: AppTextStyles.body1),
                      ),
                  ],
                ),
                if (Responsive.isMobile(context))
                  Center(
                    child:
                        Text('Monthly Assessment', style: AppTextStyles.body1),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
