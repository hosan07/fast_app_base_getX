part of 'easy_text_label_field.dart';

enum EasyInsideKind {
  prefixIcon,
  suffixIcon,
  suffixClear,
  prefixButton,
  suffixButton,
  prefixText,
  suffixText,
}

typedef BoolCallback = bool? Function();

class EasyInsideButton extends StatefulWidget {
  //* 아이콘 버튼
  const EasyInsideButton.prefixIcon({
    super.key,
    this.color,
    required this.icon,
    this.iconSize,
    required this.onPressed,
    this.focusNode,
  })  : label = null,
        text = null,
        onCleared = null,
        onTapDown = null,
        controller = null,
        kind = EasyInsideKind.prefixIcon;

  const EasyInsideButton.suffixIcon({
    super.key,
    this.color,
    required this.icon,
    this.iconSize,
    required this.onPressed,
    this.focusNode,
  })  : label = null,
        text = null,
        onCleared = null,
        onTapDown = null,
        controller = null,
        kind = EasyInsideKind.suffixIcon;

  //* 텍스트 클리어 버튼
  // controller를 넣어주면 자동삭제, 아닐시 onCleared함수 구현
  const EasyInsideButton.suffixClear({
    super.key,
    this.color,
    this.icon,
    this.iconSize,
    this.label,
    this.text,
    this.onCleared,
    this.onPressed,
    this.onTapDown,
    this.controller,
    this.focusNode,
  }) : kind = EasyInsideKind.suffixClear;

  //* 아웃라인 버튼
  const EasyInsideButton.prefixButton({
    super.key,
    this.color,
    this.label,
    this.onPressed,
    this.focusNode,
  })  : icon = null,
        iconSize = null,
        text = null,
        onCleared = null,
        onTapDown = null,
        controller = null,
        kind = EasyInsideKind.prefixButton;

  const EasyInsideButton.suffixButton({
    super.key,
    this.color,
    this.label,
    this.onPressed,
    this.focusNode,
  })  : icon = null,
        iconSize = null,
        text = null,
        onCleared = null,
        onTapDown = null,
        controller = null,
        kind = EasyInsideKind.suffixButton;

  //* 텍스트
  EasyInsideButton.prefixText({
    super.key,
    Color? color,
    this.text,
    this.onPressed,
    this.onTapDown,
    this.focusNode,
  })  : color = color ?? WtColors.b300,
        icon = null,
        iconSize = null,
        label = null,
        onCleared = null,
        controller = null,
        kind = EasyInsideKind.prefixText;

  EasyInsideButton.suffixText({
    super.key,
    Color? color,
    this.text,
    this.onPressed,
    this.onTapDown,
    this.focusNode,
  })  : color = color ?? WtColors.b300,
        icon = null,
        iconSize = null,
        label = null,
        onCleared = null,
        controller = null,
        kind = EasyInsideKind.suffixText;

  final EasyInsideKind kind;

  final Color? color;
  final dynamic icon;
  final double? iconSize;
  final dynamic label;
  final dynamic text;
  final BoolCallback? onCleared;
  final VoidCallback? onPressed;
  final void Function(TapDownDetails)? onTapDown;

  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<StatefulWidget> createState() => _EasyInsideButtonState();
}

class _EasyInsideButtonState extends State<EasyInsideButton> {
  @override
  void initState() {
    super.initState();

    if (widget.kind == EasyInsideKind.suffixClear && widget.focusNode != null) {
      widget.focusNode?.addListener(() {
        if (mounted) setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.kind) {
    //* 아이콘 버튼
      case EasyInsideKind.prefixIcon:
      case EasyInsideKind.suffixIcon:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.kind == EasyInsideKind.prefixIcon) sizedBox8,
            // 아이콘
            IconButton(
              onPressed: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
              icon: widget.icon is Widget
                  ? widget.icon
                  : Icon(widget.icon, color: WtColors.x__grey1, size: widget.iconSize ?? 24),
              style: _iconButtonStyle,
            ),
            sizedBox8,
          ],
        );

    //* 아웃라인 버튼
      case EasyInsideKind.prefixButton:
      case EasyInsideKind.suffixButton:
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.kind == EasyInsideKind.prefixButton) sizedBox8,
            // 버튼
            OutlinedButton(
              child: widget.label is Widget
                  ? widget.label
                  : Text(
                widget.label as String,
              ),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(WtTextStyle.x__size12),
                minimumSize: MaterialStateProperty.all(Size.zero),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8, vertical: 4)),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                foregroundColor: materialStateColor(WtColors.x__grey0, WtColors.x__grey3),
                side: materialStateBorder(WtColors.x__grey3, WtColors.x__grey4),
              ),
              onPressed: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
            ),
            sizedBox8,
          ],
        );

    //* 텍스트
      case EasyInsideKind.prefixText:
      case EasyInsideKind.suffixText:
        return Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: widget.kind == EasyInsideKind.prefixText ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            if (widget.kind == EasyInsideKind.prefixText) sizedBox8,
            // 텍스트
            GestureDetector(
              onTap: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
              onTapDown: widget.onTapDown,
              child: widget.text is Widget
                  ? widget.text
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: EasyText(
                  widget.text as String,
                  color: widget.color,
                  style: WtTextStyle.s1,
                ),
              ),
            ),
            sizedBox8,
          ],
        );

    //* 텍스트 클리어 버튼
      case EasyInsideKind.suffixClear:
        return widget.controller == null
            ? _clearWidget
            : ValueListenableBuilder(
          valueListenable: widget.controller!,
          builder: (BuildContext context, dynamic value, Widget? child) {
            return _clearWidget;
          },
        );
    }
  }

  Widget get _clearWidget {
    if (_editableText == false && widget.icon == null && widget.label == null && widget.text == null) {
      return const SizedBox.shrink();
    } else {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.text != null) ...[
            // 텍스트
            GestureDetector(
              onTap: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
              onTapDown: widget.onTapDown,
              child: widget.text is Widget
                  ? widget.text
                  : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: EasyText(
                  widget.text as String,
                  color: widget.color,
                  style: WtTextStyle.s1,
                ),
              ),
            ),
            if (_editableText)
              SizedBox(
                height: 16,
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: WtColors.b100,
                ),
              ),
          ],
          // 클리어 버튼
          if (_editableText)
            IconButton(
              onPressed: () {
                widget.focusNode?.requestFocus();
                //* onCleared에서 true를 리턴해야 텍스트를 지웁니다.
                if (widget.onCleared == null || widget.onCleared!() != false) {
                  widget.controller?.clear();
                }
              },
              icon: SvgPicture.asset('assets/svg/mark_x.svg'),
              style: _iconButtonStyle,
            ),
          if (widget.icon != null) ...[
            if (_editableText)
              SizedBox(
                height: 16,
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: WtColors.b100,
                ),
              ),
            IconButton(
              onPressed: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
              icon: widget.icon is Widget
                  ? widget.icon
                  : Icon(widget.icon, color: WtColors.x__grey1, size: widget.iconSize ?? 24),
              style: _iconButtonStyle,
            ),
          ],
          if (widget.label != null) ...[
            if (_editableText) ...[
              SizedBox(
                height: 16,
                child: VerticalDivider(
                  width: 1,
                  thickness: 1,
                  color: WtColors.b100,
                ),
              ),
              const SizedBox(width: 2),
            ],
            // 버튼
            OutlinedButton(
              child: widget.label is Widget ? widget.label : Text(widget.label as String),
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(WtTextStyle.x__size12),
                minimumSize: MaterialStateProperty.all(Size.zero),
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 8, vertical: 6)),
                shape: MaterialStateProperty.all(const StadiumBorder()),
                foregroundColor: materialStateColor(WtColors.x__grey0, WtColors.x__grey3),
                side: materialStateBorder(WtColors.x__grey3, WtColors.x__grey4),
              ),
              onPressed: widget.onPressed == null
                  ? null
                  : () {
                widget.focusNode?.requestFocus();
                widget.onPressed!();
              },
            ),
          ],
          sizedBox8,
        ],
      );
    }
  }

  bool get _editableText => widget.controller?.text.isNotEmpty == true && widget.focusNode?.hasFocus == true;

  ButtonStyle get _iconButtonStyle => IconButton.styleFrom(
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    minimumSize: const Size(32, 32),
    padding: EdgeInsets.zero,
    splashFactory: InkHighlightFactory(),
  );
}
