import 'package:baseapp_getx/index.dart';

//아이콘 버튼 클래스
class EasyIconButton extends StatelessWidget {
  const EasyIconButton({
    Key? key,
    required this.onPressed,
    this.title,
    this.titleStyle,
    this.content,
    this.contentStyle,
    this.buttonSize = 48.0,
    required this.icon,
    this.rightText = true,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? title;
  final TextStyle? titleStyle;
  final String? content;
  final TextStyle? contentStyle;
  final double buttonSize;
  final Widget icon;
  final bool rightText;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: onPressed,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!rightText) _text(),
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: buttonSize, minWidth: buttonSize),
              child: Center(child: icon),
            ),
            if (rightText) _text(),
          ],
        ),
      );

  _text() => title != null ? EasyText(title, style: titleStyle) : sizedBox0;
}
