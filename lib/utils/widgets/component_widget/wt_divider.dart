import 'package:baseapp_getx/index.dart';

class WtFullDivider extends StatelessWidget {
  const WtFullDivider({
    Key? key,
    this.height = 16.0,
    this.thickness = 1,
    this.color,
  }) : super(key: key);

  final double height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height,
        child: OverflowBox(
          maxWidth: MediaQuery.of(context).size.width,
          child: Divider(
            color: color,
            height: height,
            thickness: thickness,
          ),
        ),
      );
}

class WtBottomDivider extends StatelessWidget implements PreferredSizeWidget {
  const WtBottomDivider({super.key, this.child});

  final PreferredSizeWidget? child;

  @override
  Widget build(BuildContext context) {
    if (child != null) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(height: 1.0, color: WtColors.b50),
          child!,
        ],
      );
    } else {
      return Divider(height: 1.0, color: WtColors.b50);
    }
  }

  @override
  Size get preferredSize => Size.fromHeight(1.0 + (child?.preferredSize.height ?? 0.0));
}
