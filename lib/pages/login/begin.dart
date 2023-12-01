import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

part 'begin.controller.dart';

class BeginPage extends StatefulWidget {
  const BeginPage({Key? key}) : super(key: key);

  @override
  State<BeginPage> createState() => _BeginPageState();
}

class _BeginPageState extends State<BeginPage> with AfterLayoutMixin<BeginPage> {
  final controller = Get.find<BeginController>();

  @override
  void afterFirstLayout(BuildContext context) async {
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => _BeginPage();
}

class _BeginPage extends EasyView<BeginController> {
  _BeginPage({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0BB5A0),
      body: Center(
        child: EasyText('스플래시', style: WtTextStyle.h1.white,),
      ),
    );
  }
}
