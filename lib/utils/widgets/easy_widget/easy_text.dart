import 'package:baseapp_getx/index.dart';

/// 기본 스타일은 WtTextStyle.b2
/// 기본 컬러값은 WtColors.black
class EasyText extends StatelessWidget {
  const EasyText(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.style,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
      }) : super(key: key);

  EasyText.s1(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = false, // s1체는 regular / semibold
      })  : style = isBold
      ? WtTextStyle.s1b
      : isMedium
      ? WtTextStyle.s1.medium
      : WtTextStyle.s1.regular,
        super(key: key);

  const EasyText.s2(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
      })  : style = WtTextStyle.s2,
        super(key: key);

  EasyText.h6m(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.h6b
      : isMedium
      ? WtTextStyle.h6m
      : WtTextStyle.h6m.regular,
        super(key: key);

  EasyText.h3(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.h3
      : isMedium
      ? WtTextStyle.h3
      : WtTextStyle.h3.regular,
        super(key: key);
  EasyText.h4(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.h4
      : isMedium
      ? WtTextStyle.h4
      : WtTextStyle.h4.regular,
        super(key: key);

  EasyText.h7m(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.h7b
      : isMedium
      ? WtTextStyle.h7m
      : WtTextStyle.h7m.regular,
        super(key: key);

  const EasyText.x__size16(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.x__size16B
      : isMedium
      ? WtTextStyle.x__size16M
      : WtTextStyle.x__size16,
        super(key: key);

  const EasyText.x__size20(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.x__size20B
      : isMedium
      ? WtTextStyle.x__size20M
      : WtTextStyle.x__size20,
        super(key: key);

  const EasyText.x__size24(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.x__size24B
      : isMedium
      ? WtTextStyle.x__size24M
      : WtTextStyle.x__size24,
        super(key: key);

  const EasyText.x__size30(
      this.data, {
        Key? key,
        this.color,
        this.border,
        this.borderColor,
        this.backgroundColor,
        this.width,
        this.height,
        this.leading,
        this.alignment,
        this.textAlign,
        this.fit,
        this.padding,
        this.margin,
        this.maxLines,
        this.overflow,
        this.onOff,
        bool isBold = false,
        bool isMedium = true,
      })  : style = isBold
      ? WtTextStyle.x__size30B
      : isMedium
      ? WtTextStyle.x__size30M
      : WtTextStyle.x__size30,
        super(key: key);

  final String? data;
  final Color? color;
  final BoxBorder? border;
  final Color? borderColor;
  final Color? backgroundColor;
  final TextStyle? style;
  final double? width;
  final double? height;
  final double? leading;
  final AlignmentGeometry? alignment;
  final TextAlign? textAlign;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? onOff;

  @override
  Widget build(BuildContext context) {
    if (fit != null) {
      return FittedBox(
          fit: fit!,
          alignment: alignment ?? Alignment.center,
          child: _constraints(context, alignment ?? Alignment.center));
    } else {
      return _constraints(context, alignment);
    }
  }

  Widget _constraints(BuildContext context, AlignmentGeometry? alignment) {
    if (width != null || height != null || alignment != null || padding != null || margin != null) {
      return EasyConstraints(
        width: width,
        height: height,
        alignment: alignment,
        padding: padding,
        margin: margin,
        border: border,
        borderColor: borderColor,
        backgroundColor: backgroundColor,
        child: _text(context, alignment),
      );
    } else {
      return _text(context, alignment);
    }
  }

  Widget _text(BuildContext context, AlignmentGeometry? alignmentGeometry) {
    Alignment? alignment = alignmentGeometry is Alignment ? alignmentGeometry : null;
    TextAlign? textAlign = this.textAlign ??
        (alignment != null
            ? (alignment.x == 0
            ? TextAlign.center
            : alignment.x > 0
            ? TextAlign.right
            : TextAlign.left)
            : null);
    TextStyle style = this.style ?? DefaultTextStyle.of(context).style;

    Text textOnly() => Text(
      data ?? '',
      style: color != null ? style.copyWith(color: color) : style,
      maxLines: maxLines,
      overflow: maxLines != null && overflow == null
          ? TextOverflow.ellipsis
          : overflow, // TextOverflow.ellipsis은 web에서 버그 발생!
      textAlign: textAlign,
      strutStyle: StrutStyle(fontSize: style.fontSize, leading: leading ?? 0.41667, height: 1.0),
    );

    return onOff != null
        ? Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: style.fontSize,
          height: style.fontSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: onOff! ? WtColors.x__join : WtColors.x__grey2,
            border: Border.all(color: WtColors.x__white, width: 2.0),
            boxShadow: [
              BoxShadow(
                  color: onOff! ? WtColors.x__join : WtColors.x__grey2,
                  spreadRadius: 0.5,
                  blurStyle: BlurStyle.outer)
            ],
          ),
        ),
        SizedBox(width: (style.fontSize ?? 14) * 0.4),
        textOnly(),
      ],
    )
        : textOnly();
  }
}
