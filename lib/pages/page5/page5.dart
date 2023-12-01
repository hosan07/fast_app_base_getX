import 'package:baseapp_getx/index.dart';

import 'dialog/logout.dart';

//import 'dialog/logout.dart';
part 'page5.controller.dart';

class Page5 extends EasyView<Page5Controller> {
  Page5({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context) => Scaffold(
        appBar: AppBar(
            title: Padding(
                padding: EdgeInsets.symmetric(vertical: 00.0, horizontal: 20.0),
                child: const AppBarTitle(titleText: '화면5')),
            //title: Text('d'),
            bottom: const WtBottomDivider()),
        body: EasyScrollView(
          horizontal: null,
          vertical: null,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.03),
            _title('나의 정보'),
            //ArrowTile(title: '내 프로필', onTap: () => Get.toNamed(Routes.moreProfile)),
            ArrowTile(title: '내 프로필', onTap: null),
            ArrowTile(title: '비밀번호 변경', onTap: null),
            ArrowTile(title: '서브계정 관리', onTap: null),
            ArrowTile(
                title: '로그아웃',
                onTap: () {
                  showLogout();
                }),
          ],
        ),
      );
  //더보기 리스트 제목
  _title(String title) => EasyConstraints(
        height: 32.0,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: WtColors.white, width: 14.0))),
          child: EasyText.h7m(
            title,
            isBold: true,
          ),
        ),
      );
}
