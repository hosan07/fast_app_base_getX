import 'package:baseapp_getx/index.dart';

class EasyDialogAction extends StatelessWidget {
  const EasyDialogAction({
    super.key,
    required this.onPressed,
    required this.child,
    this.isGray = false,
    this.isNegative = false,
  });

  final VoidCallback? onPressed;
  final dynamic child;
  final bool isGray;
  final bool isNegative;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: isNegative ? WtColors.negative : (isGray ? WtColors.b400 : WtColors.b900),
        shape: const RoundedRectangleBorder(),
        textStyle: WtTextStyle.h7b,
      ).copyWith(
        overlayColor: materialSolidColor(WtColors.b50),
      ),
      child: child is Widget ? child : EasyText(child.toString()),
    );
  }
}
