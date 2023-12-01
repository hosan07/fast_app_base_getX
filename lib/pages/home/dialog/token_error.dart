import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

showTokenError() async {
  await defaultDialog(
    barrierDismissible: false,
    content: Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyText.h7m(
            '재 로그인 안내',
            color: WtColors.b800,
            textAlign: TextAlign.center,
            leading: 0.667,
          ),
          sizedBox8,
          EasyText.s1(
            '로그인 시간이 만료 되어 재 로그인 해주세요.',
            color: WtColors.b600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    actions: [
      EasyDialogAction(
        onPressed: () async {
          Get.offAllNamed(Routes.begin);
        },
        child: '확인',
      ),
    ],
  );
}

