import 'package:baseapp_getx/index.dart';

class WtRadioButton<T> extends StatefulWidget {
  WtRadioButton({
    Key? key,
    this.title,
    this.horizontalTitleGapWidget,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    this.reverse = false,
  }) : super(key: key ?? GlobalKey<WtRadioButtonState>());

  /// 라디오버튼 타이틀
  final Widget? title;

  /// 버튼-타이틀간 간격 위젯
  final Widget? horizontalTitleGapWidget;

  /// 라디오버튼 값
  final T value;

  /// 라디오버튼 그룹값
  final T? groupValue;

  /// 라디오버튼 변경 이벤트
  final ValueChanged<T?>? onChanged;

  final bool reverse;

  @override
  State<WtRadioButton<T>> createState() => WtRadioButtonState<T>();
}

class WtRadioButtonState<T> extends State<WtRadioButton<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 40,
      child: FittedBox(
        fit: BoxFit.cover,
        child: Radio<T>(
          value: widget.value,
          groupValue: widget.groupValue,
          onChanged: widget.onChanged,
          fillColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return widget.value == widget.groupValue ? WtColors.l400 : WtColors.b200;
              }
              if (states.contains(MaterialState.selected)) {
                return WtColors.p100;
              }
              return WtColors.b500;
            },
          ),
        ),
      ),
    );
  }
}
