
import 'package:baseapp_getx/index.dart';

import 'package:http/http.dart' as http;

import '../home/home.dart';
part 'page3.controller.dart';

class Page3 extends EasyView<Page3Controller> {
  final Page3Controller controller = Get.put(Page3Controller());

  @override
  Widget render(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
          child: const AppBarTitle(titleText: '화면3'),
        ),
        bottom: const WtBottomDivider(),
      ),
      body: Text(''),
    );
  }
}
