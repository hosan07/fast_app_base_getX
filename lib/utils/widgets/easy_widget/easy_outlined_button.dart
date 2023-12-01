import 'package:baseapp_getx/index.dart';

part 'easy_outlined_button.res.dart';

//테두리 버튼 클래스
class EasyOutlinedButton extends StatelessWidget {
  EasyOutlinedButton({
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
    return OutlinedButton(
      onPressed: onPressed,
      style: _getButtonStyle(),
      child: child is Widget ? child : EasyText(child.toString(), alignment: Alignment.center, onOff: onOff),
    );
  }

  ButtonStyle? _getButtonStyle() {
    ButtonStyle? style;
    switch (type) {
      case EasyButtonType.subRed:
        style = _subRedButton;
        break;
      case EasyButtonType.small:
        style = _smallButton;
        break;
      case EasyButtonType.base:
        style = _baseButton;
        break;

      case EasyButtonType.grayscale:
        style = _grayscaleButton;
        break;
      case EasyButtonType.test:
        style = _testButton;
        break;
      case EasyButtonType.test2:
        style = _testButton2;
        break;
      case EasyButtonType.dosage1:
        style = _dosageButton1;
        break;
      case EasyButtonType.dosage2:
        style = _dosageButton2;
        break;
      case EasyButtonType.trans:
        style = _transButton;
        break;
      case EasyButtonType.instagram:
        style = _instagramButton;
        break;
      default:
    }
    return style;
  }
}
