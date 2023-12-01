import 'package:baseapp_getx/index.dart';

class ItemPickerData {
  String item;
  RxBool exist = false.obs;
  ItemPickerData({this.item = ''});
}

class ItemPicker extends StatefulWidget {
  const ItemPicker({super.key, required this.data, required this.list});

  final ItemPickerData data;
  final List<String> list;

  @override
  ItemPickerState createState() => ItemPickerState();
}

class ItemPickerState extends State<ItemPicker> with TickerProviderStateMixin {
  late final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final expansion = false.obs;
  final collapse = true.obs;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: widget.data.exist.isTrue ? widget.data.item : null);
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        expansion(true);
        collapse(false);
      } else {
        expansion(false);
        collapse(false);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      onFocusChange: (value) {},
      focusNode: _focusNode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Divider(height: 1.0),
          WtTextFormField(
            controller: _controller,
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
                  collapse(false);
                } else {
                  expansion(true);
                  collapse(false);
                }
              }
            },
          ),
          Divider(height: 1.0, color: WtColors.b400),
          Obx(
            () => AnimatedContainer(
              curve: Curves.fastOutSlowIn,
              duration: const Duration(milliseconds: 330),
              height: expansion.isTrue ? widget.list.length * 50.0 : 0.0,
              child: _drawItems(),
              onEnd: () {
                log.finest('collapse is ${!expansion.value}');
                collapse(!expansion.value);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawItems() {
    return Obx(
      () => collapse.isTrue
          ? sizedBox0
          : ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.list.length,
              itemBuilder: (context, index) {
                var item = widget.list[index];
                return GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    _controller.text = widget.data.item = item;
                    widget.data.exist(true);
                    expansion(false);
                    collapse(false);
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: EasyText.s1(item,
                            color: widget.data.item == item ? WtColors.p100 : WtColors.b700, height: 48.0),
                      ),
                      const Divider(height: 2),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
