import 'package:baseapp_getx/index.dart';

//Column 클래스
class EasyColumn extends StatelessWidget {
  const EasyColumn({
    Key? key,
    this.formKey,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.bottom = true,
    this.vertical = 16.0,
    this.horizontal = 16.0,
    this.children = const <Widget>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  }) : super(key: key);

  final Key? formKey;
  final AutovalidateMode autovalidateMode;
  final bool bottom;
  final double? vertical;
  final double? horizontal;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: bottom,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              horizontal ?? 0.0, vertical ?? 0.0, horizontal ?? 0.0, bottom ? vertical ?? 0.0 : 0.0),
          child: formKey != null
              ? Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    mainAxisAlignment: mainAxisAlignment,
                    mainAxisSize: mainAxisSize,
                    crossAxisAlignment: crossAxisAlignment,
                    children: children,
                  ),
                )
              : Column(
                  mainAxisAlignment: mainAxisAlignment,
                  mainAxisSize: mainAxisSize,
                  crossAxisAlignment: crossAxisAlignment,
                  children: children,
                ),
        ),
      );
}

//스크롤뷰 클래스
class EasyScrollView extends StatefulWidget {
  const EasyScrollView({
    Key? key,
    this.formKey,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.bottom = true,
    this.controller,
    this.vertical = 16.0,
    this.horizontal = 16.0,
    this.physics,
    this.children = const <Widget>[],
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
  }) : super(key: key);

  final Key? formKey;
  final AutovalidateMode autovalidateMode;
  final bool bottom;
  final ScrollController? controller;
  final double? vertical;
  final double? horizontal;
  final ScrollPhysics? physics;
  final List<Widget> children;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  State<EasyScrollView> createState() => _EasyScrollViewState();
}

class _EasyScrollViewState extends State<EasyScrollView> {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();

    controller = widget.controller ?? ScrollController();
  }

  @override
  void dispose() {
    if (widget.controller == null) controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        bottom: widget.bottom,
        child: Form(
          key: widget.formKey,
          autovalidateMode: widget.autovalidateMode,
          child: Scrollbar(
            controller: controller,
            child: SingleChildScrollView(
              controller: controller,
              padding: EdgeInsets.fromLTRB(widget.horizontal ?? 0.0, widget.vertical ?? 0.0, widget.horizontal ?? 0.0,
                  widget.bottom ? widget.vertical ?? 0.0 : 0.0),
              physics: widget.physics,
              child: Column(
                mainAxisAlignment: widget.mainAxisAlignment,
                mainAxisSize: widget.mainAxisSize,
                crossAxisAlignment: widget.crossAxisAlignment,
                children: widget.children,
              ),
            ),
          ),
        ),
      );
}

class EasyExpanded extends StatelessWidget {
  const EasyExpanded({
    Key? key,
    this.flex = 1,
    required this.child,
    this.alignment = Alignment.topCenter,
    this.padding,
    this.margin,
  }) : super(key: key);

  final int flex;
  final Widget child;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) => Expanded(
        flex: flex,
        child: Container(
          alignment: alignment,
          padding: padding,
          margin: margin,
          color: isTestMode ? WtColors.x__indigo.withOpacity(0.05) : null,
          child: child,
        ),
      );
}
