import 'package:baseapp_getx/index.dart';

class AppBarTitle extends StatelessWidget {
  final String titleText;

  const AppBarTitle({required this.titleText});

  @override
  Widget build(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    double scaledFontSize = 22 * scaleFactor;

    return Padding(
      padding: EdgeInsets.all(7),
      child: Text(
        titleText,
        style: TextStyle(
          fontSize: scaledFontSize,
          fontWeight: FontWeight.w700,
          letterSpacing: -1,
        ),
      ),
    );
  }
}
