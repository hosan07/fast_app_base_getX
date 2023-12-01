import 'package:flutter/cupertino.dart';
import 'package:baseapp_getx/index.dart';

class TimePickerData {
  DateTime time;
  RxBool exist = false.obs;
  TimePickerData({required this.time});
}

class TimePicker extends StatefulWidget {
  const TimePicker({super.key, required this.data});

  final TimePickerData data;

  @override
  TimePickerState createState() => TimePickerState();
}

class TimePickerState extends State<TimePicker> with TickerProviderStateMixin {
  late final TextEditingController _textController;
  final FocusNode _focusNode = FocusNode();
  final expansion = false.obs;
  // final collapse = true.obs;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _textController =
        TextEditingController(text: widget.data.exist.isTrue ? widget.data.time.toTimestampString1() : null);

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        expansion(true);

        if (_overlayEntry == null) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context).insert(_overlayEntry!);
        }
        _controller.forward();
      } else {
        expansion(false);

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
    _textController.dispose();
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
          offset: const Offset(0.0, 47.0),
          child: GestureDetector(
            onTap: () {},
            child: SizeTransition(
              sizeFactor: _animation,
              axis: Axis.vertical,
              axisAlignment: 1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 216,
                    child: CupertinoTheme(
                      data: CupertinoThemeData(
                        brightness: Brightness.dark,
                        textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: WtTextStyle.h5.b800,
                        ),
                      ),
                      child: CupertinoDatePicker(
                        initialDateTime: widget.data.time,
                        mode: CupertinoDatePickerMode.time,
                        dateOrder: DatePickerDateOrder.ymd,
                        onDateTimeChanged: (dateTime) {
                          widget.data.time = dateTime;
                          widget.data.exist(true);
                          _textController.text = dateTime.toTimestampString1();
                        },
                      ),
                    ),
                  ),
                  sizedBox12,
                  EasyElevatedButton(
                      onPressed: () {
                        expansion(false);
                        _controller.reverse();
                      },
                      type: EasyButtonType.regular,
                      child: '선택하기'),
                  sizedBox10,
                  sizedBox4,
                  const Divider(height: 2),
                ],
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1.0),
          WtTextFormField(
            controller: _textController,
            focusNode: _focusNode,
            readOnly: true,
            style: WtTextStyle.s1.b800,
            decoration: InputDecoration(
              hintText: '선택해 주세요',
              hintStyle: WtTextStyle.s1.b800,
              suffixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 64),
              suffixIcon: Obx(
                () => AnimatedRotation(
                  turns: expansion.isTrue ? 0.5 : 0.0,
                  curve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 220),
                  child: SvgPicture.asset('assets/svg/ic_down_arrow.svg'),
                ),
              ),
              contentPadding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 12.0),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
            isClearButton: false,
            onTap: () {
              if (_focusNode.hasFocus) {
                if (expansion.isTrue) {
                  expansion(false);
                  _controller.reverse();
                } else {
                  expansion(true);
                  if (_overlayEntry == null) {
                    _overlayEntry = _createOverlayEntry();
                    Overlay.of(context).insert(_overlayEntry!);
                  }
                  _controller.forward();
                }
              }
            },
          ),
          Divider(height: 1.0, color: WtColors.b400),
          Obx(
            () => AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 330),
              height: expansion.isTrue ? 300.0 : 0.0,
              child: sizedBox0,
            ),
          ),
        ],
      ),
    );
  }
}
