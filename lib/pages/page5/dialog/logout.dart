import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

showLogout() async {
  await defaultDialog(
    content: Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyText.h7m(
            '로그아웃',
            color: WtColors.b800,
            textAlign: TextAlign.center,
            leading: 0.667,
          ),
          sizedBox8,
          EasyText.s1(
            '로그아웃 하시겠습니까?',
            color: WtColors.b600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    actions: [
      EasyDialogAction(onPressed: () => closeDialogAndAllSnackbars(), child: '취소', isGray: true),
      EasyDialogAction(
        onPressed: () async {
          Get.offAllNamed(Routes.begin);
        },
        child: '확인',
      ),
    ],
  );
}

showRunningLogout() async {
  await defaultDialog(
    content: Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyText.h7m(
            '로그아웃',
            color: WtColors.b800,
            textAlign: TextAlign.center,
            leading: 0.667,
          ),
          sizedBox8,
          EasyText.s1(
            '유아용 콧물 흡입기 작동 중에 로그아웃을 진행 하시면 현재 사용 이력이 사라질 수 있습니다. 로그아웃 하시겠습니까?',
            color: WtColors.b600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    actions: [
      EasyDialogAction(onPressed: () => closeDialogAndAllSnackbars(), child: '취소', isGray: true),
      EasyDialogAction(
        onPressed: () async {
          Get.offAllNamed(Routes.begin);
        },
        child: '로그아웃',
      ),
    ],
  );
}
