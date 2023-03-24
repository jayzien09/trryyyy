import 'package:artemis_webapp/constants.dart';
import 'package:artemis_webapp/telemetry/widgets/airWidget.dart';
import 'package:artemis_webapp/telemetry/widgets/infoWidget.dart';
import 'package:artemis_webapp/telemetry/widgets/tempWidget.dart';
import 'package:artemis_webapp/telemetry/widgets/otherWidget.dart';
import 'package:artemis_webapp/telemetry/widgets/waterWidget.dart';
import 'package:flutter/material.dart';

class TelemetryItems extends StatefulWidget {
  final snap;
  const TelemetryItems({required this.snap, super.key});

  @override
  State<TelemetryItems> createState() => _TelemetryItemsState();
}

class _TelemetryItemsState extends State<TelemetryItems> {
  // double soundValue = 0;
  // double lightValue = 0;
  // double humidityValue = 0;
  // double co2Value = 0;
  // double airValue = 0;
  double waterValue = 0;
  // double movementValue = 0;
  // double formaldehydeValue = 0;

  int highTemp = 50; //basis for temp gauge
  double tempValue = 57.21; //nababago to for temperature

  double waterPH = 1;

  bool hovered1 = false;
  bool hovered2 = false;
  bool hovered3 = false;
  bool hovered4 = false;
  bool hovered5 = false;
  bool hovered6 = false;
  bool hovered7 = false;
  bool hovered8 = false;
  bool hovered9 = false;
  bool hovered10 = false;
  bool hovered11 = false;

  Color hoverColorText = AppColors.white;
  Color initialColorContainer = AppColors.white;
  Color initialColorTitleIcon = AppColors.black;
  Color initialColorDescription = AppColors.grey;

  Color soundColor = AppColors.redTelemetry;
  Color humidityColor = AppColors.bluegreenTelemetry;
  Color lightColor = AppColors.yellowTelemetry;
  Color temperatureColor = AppColors.orangeTelemetry;
  Color airColor = AppColors.blueTelemetry;
  Color waterColor = AppColors.greenTelemetry;
  Color movementColor = AppColors.pinkTelemetry;
  Color formaldehydeColor = AppColors.purpleTelemetry;
  Color co2Color = AppColors.brownTelemetry;

  @override
  Widget build(BuildContext context) {
    if (tempValue > highTemp) {
      temperatureColor = AppColors.redTelemetry;
    } else {
      temperatureColor = AppColors.orangeTelemetry;
    }
    return Wrap(
      spacing: 20,
      runSpacing: 20,
      alignment: WrapAlignment.start,
      children: [
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered10 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered10 = false;
            });
          },
          child: InfoWidget(
            width: 230,
            height: 230,
            containerColor:
                hovered10 ? initialColorTitleIcon : initialColorContainer,
            textColorTitle: hovered10 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered10 ? hoverColorText : initialColorDescription,
            title: 'Welcome',
            description:
                'All IoT devices are currently online. (If 1 device is offline, this text will change)',
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered1 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered1 = false;
            });
          },
          child: OtherWidget(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 230,
            containerColor: hovered1 ? soundColor : initialColorContainer,
            textColorTitle: hovered1 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered1 ? hoverColorText : initialColorDescription,
            textColorValue: hovered1 ? hoverColorText : soundColor,
            textColorUnit: hovered1 ? hoverColorText : soundColor,
            title: 'Ambient Sound',
            description: 'Decibels',
            value: widget.snap['ambientSound'],
            unit: 'dB',
            icon: Icon(
              Icons.wifi_tethering_outlined,
              size: 30,
              color: hovered1 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
          //),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered2 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered2 = false;
            });
          },
          child: OtherWidget(
            width: 230,
            height: 230,
            containerColor: hovered2 ? humidityColor : initialColorContainer,
            textColorTitle: hovered2 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered2 ? hoverColorText : initialColorDescription,
            textColorValue: hovered2 ? hoverColorText : humidityColor,
            textColorUnit: hovered2 ? hoverColorText : humidityColor,
            title: 'Humidity',
            description: 'Absolute Humidity',
            value: widget.snap['ambientHumidity'],
            unit: '%',
            icon: Icon(
              Icons.water_drop_outlined,
              size: 30,
              color: hovered2 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered3 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered3 = false;
            });
          },
          child: OtherWidget(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 230,
            containerColor: hovered3 ? lightColor : initialColorContainer,
            textColorTitle: hovered3 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered3 ? hoverColorText : initialColorDescription,
            textColorValue: hovered3 ? hoverColorText : lightColor,
            textColorUnit: hovered3 ? hoverColorText : lightColor,
            title: 'Ambient Light',
            description: 'Lumens',
            value: widget.snap['ambientLight'],
            unit: 'lm',
            icon: Icon(
              Icons.wb_incandescent_outlined,
              size: 30,
              color: hovered3 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered4 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered4 = false;
            });
          },
          child: AirWidget(
            width: MediaQuery.of(context).size.width * 0.26,
            height: 280,
            containerColor: hovered4 ? airColor : initialColorContainer,
            textColorTitle: hovered4 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered4 ? hoverColorText : initialColorDescription,
            textColorValueUnit: hovered4 ? hoverColorText : airColor,
            title: 'CO2 Emissions',
            description: 'Carbon Dioxide',
            value: widget.snap['ambientCO2'],
            unit: 'ppm',
            unit1: 'Parts Per Million',
            gradientColors: [
              hovered4
                  ? initialColorContainer.withOpacity(0.5)
                  : airColor.withOpacity(0.5),
              hovered4
                  ? initialColorContainer.withOpacity(0.4)
                  : airColor.withOpacity(0.4),
              hovered4
                  ? initialColorContainer.withOpacity(0.3)
                  : airColor.withOpacity(0.3),
              hovered4
                  ? initialColorContainer.withOpacity(0.2)
                  : airColor.withOpacity(0.2),
              hovered4
                  ? initialColorContainer.withOpacity(0.1)
                  : airColor.withOpacity(0.1),
              hovered4
                  ? initialColorContainer.withOpacity(0.05)
                  : airColor.withOpacity(0.05),
              Colors.transparent
            ],
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered5 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered5 = false;
            });
          },
          child: WaterWidget(
            width: 280,
            height: 280,
            containerColor: hovered5 ? waterColor : initialColorContainer,
            textColorTitle: hovered5 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered5 ? hoverColorText : initialColorDescription,
            textColorValue: hovered5 ? hoverColorText : waterColor,
            textColorUnit: hovered5 ? hoverColorText : waterColor,
            title: 'Water Quality',
            description: 'Acidity',
            value: waterValue,
            unit: 'pH',
            liquidColor: hovered5
                ? AppColors.greyAccentLine
                : AppColors.black.withOpacity(0.5),
            liquidColorBackground:
                hovered5 ? hoverColorText : AppColors.greenTelemetry,
            liquidValue: 'Neutral',
            liquidValueColor:
                hovered5 ? AppColors.greenTelemetry : hoverColorText,
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered6 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered6 = false;
            });
          },
          child: TempWidget(
            width: 280,
            height: 280,
            containerColor: hovered6 ? temperatureColor : initialColorContainer,
            textColorTitle: hovered6 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered6 ? hoverColorText : initialColorDescription,
            textColorValue: hovered6 ? hoverColorText : temperatureColor,
            textColorUnit: hovered6 ? hoverColorText : temperatureColor,
            title: 'Temperature',
            description: 'Degrees Celsius',
            value: widget.snap['ambientTemperature'],
            exceedValue: highTemp,
            unit: '°',
            tempBarColor: hovered6 ? hoverColorText : temperatureColor,
            tempBackgroundColor:
                hovered6 ? AppColors.greyAccentLine : AppColors.greyAccent,
            tempBarTextColor: hovered6 ? temperatureColor : hoverColorText,
            tempExceedsColor:
                hovered6 ? AppColors.white : AppColors.redTelemetry,
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered7 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered7 = false;
            });
          },
          child: OtherWidget(
            width: 250,
            height: 250,
            containerColor: hovered7 ? co2Color : initialColorContainer,
            textColorTitle: hovered7 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered7 ? hoverColorText : initialColorDescription,
            textColorValue: hovered7 ? hoverColorText : co2Color,
            textColorUnit: hovered7 ? hoverColorText : co2Color,
            title: 'Air Quality',
            description: 'Particulate Matter',
            value: widget.snap['ambientParticulates'],
            unit: 'ppm',
            icon: Icon(
              Icons.air,
              size: 30,
              color: hovered7 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered8 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered8 = false;
            });
          },
          child: OtherWidget(
            width: 250,
            height: 250,
            containerColor: hovered8 ? movementColor : initialColorContainer,
            textColorTitle: hovered8 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered8 ? hoverColorText : initialColorDescription,
            textColorValue: hovered8 ? hoverColorText : movementColor,
            textColorUnit: hovered8 ? hoverColorText : movementColor,
            title: 'Movement',
            description: 'Acceleration',
            value: widget.snap['motionDetect'],
            unit: 'm/s2',
            icon: Icon(
              Icons.speed_rounded,
              size: 30,
              color: hovered8 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered9 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered9 = false;
            });
          },
          child: OtherWidget(
            width: 250,
            height: 250,
            containerColor:
                hovered9 ? formaldehydeColor : initialColorContainer,
            textColorTitle: hovered9 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered9 ? hoverColorText : initialColorDescription,
            textColorValue: hovered9 ? hoverColorText : formaldehydeColor,
            textColorUnit: hovered9 ? hoverColorText : formaldehydeColor,
            title: 'Formaldehyde',
            description: 'Parts Per Million',
            value: widget.snap['ambientFormaldehyde'],
            unit: 'ppm',
            icon: Icon(
              Icons.filter_drama_rounded,
              size: 30,
              color: hovered9 ? hoverColorText : initialColorTitleIcon,
            ),
          ),
        ),
        MouseRegion(
          onEnter: (value) {
            setState(() {
              hovered11 = true;
            });
          },
          onExit: (value) {
            setState(() {
              hovered11 = false;
            });
          },
          child: InfoWidget(
            width: MediaQuery.of(context).size.width * 0.15,
            height: 250,
            containerColor:
                hovered11 ? initialColorTitleIcon : initialColorContainer,
            textColorTitle: hovered11 ? hoverColorText : initialColorTitleIcon,
            textColorDescription:
                hovered11 ? hoverColorText : initialColorDescription,
            title: 'Summary Report',
            description:
                'The current average status for all the telemetry sensors is in good condition (?)',
          ),
        ),
      ],
    );
  }
}
