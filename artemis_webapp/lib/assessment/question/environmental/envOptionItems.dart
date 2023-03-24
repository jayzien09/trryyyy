import 'package:artemis_webapp/assessment/question/environmental/envOptions.dart';
import 'package:artemis_webapp/assessment/scores.dart';
import 'package:artemis_webapp/constants.dart';
import 'package:flutter/material.dart';

class OptionsItem extends StatefulWidget {
  //const Options({super.key});
  int? score;
  String option1;
  String option2;
  String option3;
  String option4;

  OptionsItem(
      {this.score,
      required this.option1,
      required this.option2,
      required this.option3,
      required this.option4});

  @override
  State<OptionsItem> createState() => _OptionsItemState();
}

class _OptionsItemState extends State<OptionsItem> {
  Color colorContainer = AppColors.white;
  Color colorPressed = AppColors.blueAccent;
  Color colorDisable = AppColors.greyAccent;

  Color _colorContainer1 = AppColors.white;
  Color _colorContainer2 = AppColors.white;
  Color _colorContainer3 = AppColors.white;
  Color _colorContainer4 = AppColors.white;

  Color fontPressed = AppColors.white;
  Color fontUnpressed = AppColors.black;
  Color fontDisable = AppColors.grey;

  Color _fontColor1 = AppColors.black;
  Color _fontColor2 = AppColors.black;
  Color _fontColor3 = AppColors.black;
  Color _fontColor4 = AppColors.black;

  Border borderPressed = Border.all(color: Colors.transparent);
  Border borderUnpressed = Border.all(color: AppColors.greyAccentLine);

  Border _border1 = Border.all(color: AppColors.greyAccentLine);
  Border _border2 = Border.all(color: AppColors.greyAccentLine);
  Border _border3 = Border.all(color: AppColors.greyAccentLine);
  Border _border4 = Border.all(color: AppColors.greyAccentLine);

  Color _btnColor1 = AppColors.white;
  Color _btnColor2 = AppColors.white;
  Color _btnColor3 = AppColors.white;
  Color _btnColor4 = AppColors.white;

  BoxShadow shadowPressed = const BoxShadow(
    color: Color.fromARGB(150, 49, 49, 49),
    blurRadius: 15,
    offset: Offset(0, 5),
  );
  BoxShadow shadowUnpressed = const BoxShadow(color: Colors.transparent);

  BoxShadow _shadow1 = const BoxShadow(color: Colors.transparent);
  BoxShadow _shadow2 = const BoxShadow(color: Colors.transparent);
  BoxShadow _shadow3 = const BoxShadow(color: Colors.transparent);
  BoxShadow _shadow4 = const BoxShadow(color: Colors.transparent);

  bool _optPressed1 = false;
  bool _optPressed2 = false;
  bool _optPressed3 = false;
  bool _optPressed4 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        spacing: (MediaQuery.of(context).size.width * 0.01),
        runSpacing: 20,
        alignment: WrapAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                value = 10;
                _colorContainer1 = _optPressed1 ? colorContainer : colorPressed;
                _colorContainer2 = _optPressed1 ? colorContainer : colorDisable;
                _colorContainer3 = _optPressed1 ? colorContainer : colorDisable;
                _colorContainer4 = _optPressed1 ? colorContainer : colorDisable;

                _fontColor1 = _optPressed1 ? fontUnpressed : fontPressed;
                _fontColor2 = _optPressed1 ? fontUnpressed : fontDisable;
                _fontColor3 = _optPressed1 ? fontUnpressed : fontDisable;
                _fontColor4 = _optPressed1 ? fontUnpressed : fontDisable;

                _border1 = _optPressed1 ? borderUnpressed : borderPressed;
                _border2 = borderUnpressed;
                _border3 = borderUnpressed;
                _border4 = borderUnpressed;

                _shadow1 = _optPressed1 ? shadowUnpressed : shadowPressed;
                _shadow2 = shadowUnpressed;
                _shadow3 = shadowUnpressed;
                _shadow4 = shadowUnpressed;

                _btnColor1 = _optPressed1 ? fontPressed : fontPressed;
                _btnColor2 = _optPressed1 ? fontPressed : colorDisable;
                _btnColor3 = _optPressed1 ? fontPressed : colorDisable;
                _btnColor4 = _optPressed1 ? fontPressed : colorDisable;

                _optPressed1 = !_optPressed1;
                _optPressed2 = false;
                _optPressed3 = false;
                _optPressed4 = false;
              });
              print("Option 1 Value: $value");
            },
            child: InfoCard(
              btnColor: _btnColor1,
              fontColor: _fontColor1,
              color: _colorContainer1,
              border: _border1,
              boxShadow: _shadow1,
              label: widget.option1,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                value = 20;
                _colorContainer1 = _optPressed2 ? colorContainer : colorDisable;
                _colorContainer2 = _optPressed2 ? colorContainer : colorPressed;
                _colorContainer3 = _optPressed2 ? colorContainer : colorDisable;
                _colorContainer4 = _optPressed2 ? colorContainer : colorDisable;

                _fontColor1 = _optPressed2 ? fontUnpressed : fontDisable;
                _fontColor2 = _optPressed2 ? fontUnpressed : fontPressed;
                _fontColor3 = _optPressed2 ? fontUnpressed : fontDisable;
                _fontColor4 = _optPressed2 ? fontUnpressed : fontDisable;

                _border1 = borderUnpressed;
                _border2 = _optPressed2 ? borderUnpressed : borderPressed;
                _border3 = borderUnpressed;
                _border4 = borderUnpressed;

                _shadow1 = shadowUnpressed;
                _shadow2 = _optPressed2 ? shadowUnpressed : shadowPressed;
                _shadow3 = shadowUnpressed;
                _shadow4 = shadowUnpressed;

                _btnColor1 = _optPressed2 ? fontPressed : colorDisable;
                _btnColor2 = _optPressed2 ? fontPressed : fontPressed;
                _btnColor3 = _optPressed2 ? fontPressed : colorDisable;
                _btnColor4 = _optPressed2 ? fontPressed : colorDisable;

                _optPressed1 = false;
                _optPressed2 = !_optPressed2;
                _optPressed3 = false;
                _optPressed4 = false;
              });
              print("Option 2 Value: $value");
            },
            child: InfoCard(
              btnColor: _btnColor2,
              fontColor: _fontColor2,
              color: _colorContainer2,
              border: _border2,
              boxShadow: _shadow2,
              label: widget.option2,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                value = 30;
                _colorContainer1 = _optPressed3 ? colorContainer : colorDisable;
                _colorContainer2 = _optPressed3 ? colorContainer : colorDisable;
                _colorContainer3 = _optPressed3 ? colorContainer : colorPressed;
                _colorContainer4 = _optPressed3 ? colorContainer : colorDisable;

                _fontColor1 = _optPressed3 ? fontUnpressed : fontDisable;
                _fontColor2 = _optPressed3 ? fontUnpressed : fontDisable;
                _fontColor3 = _optPressed3 ? fontUnpressed : fontPressed;
                _fontColor4 = _optPressed3 ? fontUnpressed : fontDisable;

                _border1 = borderUnpressed;
                _border2 = borderUnpressed;
                _border3 = _optPressed3 ? borderUnpressed : borderPressed;
                _border4 = borderUnpressed;

                _shadow1 = shadowUnpressed;
                _shadow2 = shadowUnpressed;
                _shadow3 = _optPressed3 ? shadowUnpressed : shadowPressed;
                _shadow4 = shadowUnpressed;

                _btnColor1 = _optPressed3 ? fontPressed : colorDisable;
                _btnColor2 = _optPressed3 ? fontPressed : colorDisable;
                _btnColor3 = _optPressed3 ? fontPressed : fontPressed;
                _btnColor4 = _optPressed3 ? fontPressed : colorDisable;

                _optPressed1 = false;
                _optPressed2 = false;
                _optPressed3 = !_optPressed3;
                _optPressed4 = false;
              });
              print("Option 3 Value: $value");
            },
            child: InfoCard(
              btnColor: _btnColor3,
              fontColor: _fontColor3,
              color: _colorContainer3,
              border: _border3,
              boxShadow: _shadow3,
              label: widget.option3,
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                value = 40;
                _colorContainer1 = _optPressed4 ? colorContainer : colorDisable;
                _colorContainer2 = _optPressed4 ? colorContainer : colorDisable;
                _colorContainer3 = _optPressed4 ? colorContainer : colorDisable;
                _colorContainer4 = _optPressed4 ? colorContainer : colorPressed;

                _fontColor1 = _optPressed4 ? fontUnpressed : fontDisable;
                _fontColor2 = _optPressed4 ? fontUnpressed : fontDisable;
                _fontColor3 = _optPressed4 ? fontUnpressed : fontDisable;
                _fontColor4 = _optPressed4 ? fontUnpressed : fontPressed;

                _border1 = borderUnpressed;
                _border2 = borderUnpressed;
                _border3 = borderUnpressed;
                _border4 = _optPressed4 ? borderUnpressed : borderPressed;

                _shadow1 = shadowUnpressed;
                _shadow2 = shadowUnpressed;
                _shadow3 = shadowUnpressed;
                _shadow4 = _optPressed4 ? shadowUnpressed : shadowPressed;

                _btnColor1 = _optPressed4 ? fontPressed : colorDisable;
                _btnColor2 = _optPressed4 ? fontPressed : colorDisable;
                _btnColor3 = _optPressed4 ? fontPressed : colorDisable;
                _btnColor4 = _optPressed4 ? fontPressed : fontPressed;

                _optPressed1 = false;
                _optPressed2 = false;
                _optPressed3 = false;
                _optPressed4 = !_optPressed4;
              });
              print("Option 4 Value: $value");
            },
            child: InfoCard(
              btnColor: _btnColor4,
              fontColor: _fontColor4,
              color: _colorContainer4,
              border: _border4,
              boxShadow: _shadow4,
              label: widget.option4,
            ),
          ),
        ],
      ),
    );
  }
}
