import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

showPage2NetworkCheck() async {
  hideLoading();
  await defaultDialog(
    barrierDismissible: true,
    content: Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EasyText.h7m(
            '연결 확인',
            color: WtColors.b800,
            textAlign: TextAlign.center,
            leading: 0.667,
          ),
          sizedBox8,
          EasyText.s1(
            '인터넷 연결 상태를 확인한 후 다시 시도해 주세요.',
            color: WtColors.b600,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
    actions: [
      EasyDialogAction(
        onPressed: () {
          closeDialogAndAllSnackbars();
          //Get.offAllNamed(Routes.frame);
        },
        child: '확인',
      ),
    ],
  );
}


