import 'package:baseapp_getx/index.dart';
import 'package:flutter/cupertino.dart' hide RefreshCallback;


class EasyCupertinoSwitch extends StatelessWidget {
  const EasyCupertinoSwitch({super.key, required this.onChanged, required this.value});

  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: WtColors.p100,
      thumbColor: WtColors.white,
      trackColor: WtColors.b500,
      value: value,
      onChanged: onChanged == null ? null : (value) => onChanged!(value),
    );
  }
}
