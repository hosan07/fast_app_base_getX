import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';

class CustomDialog {
  static Future<void> showMedicineInfo({
    required BuildContext context,
    required List<String> contents,
    required String title,
    required String imagePath,
  }) async {
    List<Widget> rows = [];
    for (int i = 0; i < contents.length; i++) {
      rows.add(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE0F6E8),
                ),
                child: Center(
                  child: EasyText(
                    '${i + 1}',
                    style: WtTextStyle.captionb.p100,
                  ),
                ),
              ),
              PercentageSizedBox(widthFactor: 0.03, heightFactor: 0.0),
              Flexible(
                child: EasyText(
                  contents[i],
                  color: Color(0xFF2E2E2E),
                  textAlign: TextAlign.start,
                  style: WtTextStyle.s2,
                  leading: 0.667,
                )
              ),
            ],
          ),
        ),
      );
    }
    await defaultDialog(
      title: Column(
        children: [
          Image.asset(
            imagePath,
            width: 110,
            height: 110,
          ),
          PercentageSizedBox(widthFactor: 0.0, heightFactor: 0.01),
          EasyText(
            title,
            color: Color(0xFF333333),
            textAlign: TextAlign.center,
            style: WtTextStyle.h7b,
            leading: 0.667,
          ),
        ],
      ),
      content: Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rows,
          ),
        ),
      ),
      actions: [
        EasyDialogAction(
          onPressed: () {
            closeDialogAndAllSnackbars();
            Get.back();
          },
          child: EasyText(
            '확인',
            style: WtTextStyle.h7b.black,
          ),
          isGray: true,
        ),
      ],
    );
  }
}

