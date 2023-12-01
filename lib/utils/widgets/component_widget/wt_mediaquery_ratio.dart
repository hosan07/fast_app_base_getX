import 'package:baseapp_getx/index.dart';

class PercentageSizedBox extends StatelessWidget {
  final double widthFactor;
  final double heightFactor;

  PercentageSizedBox({
    required this.widthFactor,
    required this.heightFactor,
  });


  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculate the height of the box based on the provided height factor
    double boxHeight = screenHeight * heightFactor;
    double boxWidth = screenWidth * widthFactor;

    //휴대폰 비율에 사이즈 맞춤 (반응형)
    if (screenHeight > 900) {
      boxHeight = screenHeight * heightFactor * 1.10;
    } else if (screenHeight > 800) {
      boxHeight = screenHeight * heightFactor * 1.08;
    } else if (screenHeight > 700) {
      boxHeight = screenHeight * heightFactor * 1.07;
      ///아이폰 SE
    } else if (screenHeight > 600) {
      boxHeight = screenHeight * heightFactor * 1.2;
    } else if (screenHeight > 500) {
      boxHeight = screenHeight * heightFactor * 1.03;
    }

    //휴대폰 비율에 사이즈 맞춤 (반응형)
    if (screenWidth > 600) {
      boxWidth = screenWidth * widthFactor * 1.1;
    } else if (screenWidth > 500) {
      boxWidth = screenWidth * widthFactor * 1.0;
    } else if (screenWidth > 400) {
      boxWidth = screenWidth * widthFactor * 0.9;
      ///아이폰 SE
    } else if (screenWidth > 300) {
      boxWidth = screenWidth * widthFactor * 0.8;
    } else if (screenWidth > 250) {
      boxWidth = screenWidth * widthFactor * 0.7;
    } else if (screenWidth > 200) {
      boxWidth = screenWidth * widthFactor * 0.6;
    }

    return SizedBox(
      //width: screenWidth * widthFactor,
      width: boxWidth,
      height: boxHeight,
    );
  }
}