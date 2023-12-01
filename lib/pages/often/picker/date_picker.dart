import 'package:flutter/cupertino.dart';
import 'package:baseapp_getx/index.dart';

class DatePickerData {
  DateTime fromDate;
  DateTime toDate;
  DateTime? minimumDate;
  DateTime? maximumDate;
  DatePickerData({required this.fromDate, required this.toDate, this.minimumDate, this.maximumDate});
}

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.data, required this.isTo});

  final Rx<DatePickerData> data;
  final bool isTo;

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> with TickerProviderStateMixin {
  late final TextEditingController _textController;
  final FocusNode _focusNode = FocusNode();
  final expansion = false.obs;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();

  late final AnimationController _controller;
  late final Animation<double> _animation;

  late final LightSubscription<DatePickerData> _subscription;
  DateTime get date => widget.isTo ? widget.data.value.toDate : widget.data.value.fromDate;
  set date(DateTime date) => widget.isTo ? (widget.data.value.toDate = date) : (widget.data.value.fromDate = date);
  DateTime get minDate => widget.isTo ? widget.data.value.fromDate : widget.data.value.minimumDate!;
  DateTime get maxDate => widget.isTo ? DateTime.now() : widget.data.value.toDate;

  @override
  void initState() {
    super.initState();

    _textController = TextEditingController(text: date.toFullDateString4());
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        expansion(true);

        if (_overlayEntry == null) {
          _overlayEntry = _createOverlayEntry();
          Overlay.of(context)?.insert(_overlayEntry!);
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

    _subscription = widget.data.subject.listen((_) {
      _textController.text = date.toFullDateString4();
    });
  }

  @override
  void dispose() {
    _subscription.cancel();

    _textController.dispose();
    _focusNode.dispose();

    _controller.dispose();

    super.dispose();
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offsetX = screenWidth > maxScreenWidth ? (screenWidth - maxScreenWidth) * 0.5 : 0.0;
    var offset = renderBox.globalToLocal(Offset(offsetX, renderBox.localToGlobal(Offset(0.0, size.height)).dy));

    return OverlayEntry(
      builder: (context) => Positioned(
        width: maxWidth - 32.0,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(offset.dx + 16, offset.dy),
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
                    child: CupertinoDatePicker(
                      initialDateTime: date,
                      minimumDate: minDate,
                      maximumDate: maxDate,
                      mode: CupertinoDatePickerMode.date,
                      dateOrder: DatePickerDateOrder.ymd,
                      onDateTimeChanged: (dateTime) {
                        date = dateTime;
                        _textController.text = dateTime.toFullDateString4();
                      },
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
          WtTextFormField(
            controller: _textController,
            focusNode: _focusNode,
            readOnly: true,
            style: WtTextStyle.s1.b800,
            strutStyle: StrutStyle(fontSize: WtTextStyle.s1.fontSize, leading: 0.0, height: 1.41667),
            decoration: InputDecoration(
              prefixIconConstraints: const BoxConstraints(minHeight: 24, minWidth: 48),
              prefixIcon: SvgPicture.asset('assets/svg/mark_calendar.svg'),
              contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
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
                    Overlay.of(context)?.insert(_overlayEntry!);
                  }
                  _controller.forward();
                }
              }
            },
          ),
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
