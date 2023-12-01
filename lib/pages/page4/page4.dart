import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

part 'page4.controller.dart';

class Page4 extends EasyView<Page4Controller> {
  Page4({super.key});

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
            padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
            child: const AppBarTitle(titleText: '화면4')),
          bottom: const WtBottomDivider()
      ),
      body: Text(''),
    );
  }
}
