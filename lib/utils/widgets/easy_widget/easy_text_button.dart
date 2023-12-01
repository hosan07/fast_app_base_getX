import 'package:baseapp_getx/index.dart';

part 'easy_text_button.res.dart';

//텍스트 버튼 클래스
class EasyTextButton extends StatelessWidget {
  const EasyTextButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.type = EasyButtonType.main,
    this.color,
  });

  final VoidCallback? onPressed;
  final dynamic child;
  final Color? color;
  final EasyButtonType type;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: child is Widget ? child : EasyText(child.toString(), color: color),
    );
  }

  ButtonStyle? _getButtonStyle() {
    ButtonStyle? style;
    switch (type) {
      case EasyButtonType.login:
        style = _loginButton;
        break;
      case EasyButtonType.body:
        style = _bodyButton;
        break;
      case EasyButtonType.sheet:
        style = _sheetButton;
        break;
      case EasyButtonType.agreement:
        style = _agreementButton;
        break;
      case EasyButtonType.weather:
        style = _weatherButton;
        break;
      case EasyButtonType.skip:
        style = _skipButton;
        break;
      default:
    }
    return style;
  }
}
