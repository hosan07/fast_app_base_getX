import 'package:baseapp_getx/index.dart';

part 'easy_elevated_button.res.dart';

//Elevated 버튼 클래스
class EasyElevatedButton extends StatelessWidget {
  EasyElevatedButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.type = EasyButtonType.main,
    this.onOff,
    // ignore: empty_constructor_bodies
  }) : super(key: key) {}

  final VoidCallback? onPressed;
  final dynamic child;
  final EasyButtonType type;
  final bool? onOff;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: _getButtonStyle(),
        child: child is Widget ? child : EasyText(child.toString(), alignment: Alignment.center, onOff: onOff));
  }

  ButtonStyle? _getButtonStyle() {
    ButtonStyle? style;
    switch (type) {
      case EasyButtonType.splash:
        style = _splashButton;
        break;
      case EasyButtonType.login:
        style = _loginButton;
        break;
      case EasyButtonType.loginRegular:
        style = _loginRegularButton;
        break;
      case EasyButtonType.small:
        style = _smallButton;
        break;
      case EasyButtonType.regular:
        style = _regularButton;
        break;
      case EasyButtonType.field:
        style = _fieldButton;
        break;
      case EasyButtonType.card:
        style = _cardButton;
        break;
      case EasyButtonType.cardH:
        style = _cardHButton;
        break;
      case EasyButtonType.blue:
        style = _blueButton;
        break;
      case EasyButtonType.module:
        style = _moduleButton;
        break;
      default:
    }
    return style;
  }
}
