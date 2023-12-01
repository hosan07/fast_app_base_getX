import 'package:baseapp_getx/index.dart';


class ArrowTile extends StatelessWidget {
  const ArrowTile(
      {super.key,
      required this.title,
      this.subtitle,
      this.trailing,
      this.isNext = true,
      this.onTap,
      this.switchValue,
      this.onSwitchChanged});

  final String title;
  final Widget? subtitle;
  final Widget? trailing;
  final bool isNext;
  final GestureTapCallback? onTap;
  final bool? switchValue;
  final ValueChanged<bool>? onSwitchChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
            // tileColor: WtColors.b50,
            dense: true,
            minVerticalPadding: switchValue != null ? 0.0 : 16.9,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0 /* 16.9 */),
            title: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (switchValue != null) const SizedBox(height: 16.9),
                      EasyText.h7m(
                        title,
                        color: WtColors.b700,
                        leading: 0.4,
                        maxLines: 1,
                      ),
                      if (subtitle != null) ...[
                        sizedBox8,
                        subtitle!,
                      ],
                      if (switchValue != null) const SizedBox(height: 16.9),
                    ],
                  ),
                ),
                if (trailing != null) trailing!,
                if (isNext) ...[
                  if (trailing == null) sizedBox8,
                  SvgPicture.asset('assets/svg/ic_right_arrow.svg', color: onTap == null ? WtColors.b200 : null),
                ] else if (switchValue != null)
                  EasyCupertinoSwitch(onChanged: onSwitchChanged, value: switchValue!)
                else
                  sizedBox24,
              ],
            ),
            onTap: onTap),
        const Divider(height: 4, indent: 16, endIndent: 16),
      ],
    );
  }
}
