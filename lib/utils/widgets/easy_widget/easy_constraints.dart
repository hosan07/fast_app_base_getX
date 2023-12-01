import 'package:baseapp_getx/index.dart';


class EasyConstraints extends StatelessWidget {
  const EasyConstraints({
    Key? key,
    this.width,
    this.height,
    AlignmentGeometry? alignment,
    this.padding,
    this.margin,
    this.border,
    this.borderColor,
    this.backgroundColor,
    this.child,
  })  : alignment = alignment ?? Alignment.centerLeft,
        super(key: key);

  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxBorder? border;
  final Color? borderColor;
  final Color? backgroundColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) => Container(
    constraints: BoxConstraints(minWidth: width ?? 0, minHeight: height ?? 0),
    decoration: borderColor != null || border != null
        ? BoxDecoration(
      color: backgroundColor,
      borderRadius: border != null ? null : BorderRadius.circular(4),
      border: border ?? Border.all(color: borderColor!),
    )
        : null,
    alignment: alignment,
    padding: padding,
    margin: margin,
    color: isTestMode
        ? WtColors.x__violet.withOpacity(0.05)
        : borderColor == null && border == null
        ? backgroundColor
        : null,
    child: isTestMode
        ? Container(
      color: WtColors.x__violet.withOpacity(0.1),
      child: child,
    )
        : child,
  );
}
