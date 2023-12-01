import 'package:baseapp_getx/index.dart';

class MenuPickerData {
  late final RxString item;
  MenuPickerData(String item) {
    this.item = RxString(item);
  }
}

class MenuPicker extends StatefulWidget {
  const MenuPicker({super.key, required this.data, required this.list});

  final MenuPickerData data;
  final List<String> list;

  @override
  MenuPickerState createState() => MenuPickerState();
}

class MenuPickerState extends State<MenuPicker> with TickerProviderStateMixin {
  late final TextEditingController controller;
  final FocusNode _focusNode = FocusNode();

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.data.item.value);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        if (_overlayEntry == null) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry!);
        }
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    _controller = AnimationController(
      duration: const Duration(milliseconds: 330),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _overlayEntry?.remove();
          _overlayEntry = null;
        }
      });
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    _focusNode.dispose();
    _controller.dispose();

    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height),
          child: Container(
            decoration: BoxDecoration(
              color: WtColors.white,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(width: 1, color: WtColors.b100),
            ),
            child: SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: 1,
              child: DefaultTextStyle(
                style: WtTextStyle.b1.b700,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: widget.list.map((item) {
                    return GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        widget.data.item(controller.text = item);
                        _controller.reverse();
                      },
                      child: EasyText(item, height: 48, alignment: Alignment.center),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: WtTextFormField(
        controller: controller,
        focusNode: _focusNode,
        readOnly: true,
        style: WtTextStyle.s1.b800,
        strutStyle: StrutStyle(fontSize: WtTextStyle.s1.fontSize, leading: 0.0, height: 1.41667),
        decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 48),
            suffixIcon: SvgPicture.asset(
              'assets/svg/mark_below.svg',
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0)),
        isClearButton: false,
        onTap: () {
          if (_focusNode.hasFocus) {
            if (_controller.isCompleted) {
              _controller.reverse();
            } else {
              if (_overlayEntry == null) {
                _overlayEntry = _createOverlayEntry();
                Overlay.of(context).insert(_overlayEntry!);
              }
              _controller.forward();
            }
          }
        },
      ),
    );
  }
}
