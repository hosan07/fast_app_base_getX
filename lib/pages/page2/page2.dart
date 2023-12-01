import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';
import '../home/home.dart';
part 'page2.controller.dart';

class Page2 extends EasyView<Page2Controller> {
  Page2({super.key});

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Padding(
              padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
              child: const AppBarTitle(titleText: '화면2')),
          //title: Text('d'),
          bottom: const WtBottomDivider()),
      body: Text(''),
    );
  }
}