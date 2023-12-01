export 'dart:convert';
import 'dart:developer' as dev;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:logging/logging.dart' as logging;
import 'package:baseapp_getx/index.dart';
import 'package:flutter/foundation.dart';
import 'package:responsive_framework/responsive_framework.dart';

part 'utility.log.dart';

// 파일이 없어서 오류가 나는경우 콘솔 -> ./script -> 2 -> 파일생성(post_config.dart)
//xx import 'package:baseapp_getx/config.dart' as config;

/// 종속성 주입용 데이터
///
/// ```dart
///
/// getIt.registerSingleton<WeddingManagerNewsViewModel>(this); //생성
/// getIt.unregister<WeddingManagerNewsViewModel>(); //해제
/// getIt<WeddingManagerNewsViewModel>() //사용
///
///
/// ```
GetIt getIt = GetIt.instance;

/// 디바이스 정보 가져오기
DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

/// 디바이스 최대 가로길이
double get maxWidth => ResponsiveWrapper.of(Get.context!).scaledWidth; // Get.width;

MediaQueryData? mediaQueryData;
double get screenWidth => mediaQueryData?.size.width ?? 0.0;
double get minScreenWidth => 360.0;
double get maxScreenWidth => 1200.0;

/// 디바이스 최대 세로길이
double get maxHeight => ResponsiveWrapper.of(Get.context!).scaledHeight; // Get.height;

/// 컨텐츠 최대 세로길이
double get bodyHeight => maxHeight - kToolbarHeight - kTextTabBarHeight - safeAreaTop - safeAreaBottom;

/// 디바이스 세이프 탑영역 사이즈
double get safeAreaTop => Get.context!.mediaQueryPadding.top;

/// 디바이스 세이프 좌측영역 사이즈
double get safeAreaLeft => Get.context!.mediaQueryViewInsets.left;

/// 디바이스 세이프 바텀영역 사이즈
double get safeAreaBottom => Get.context!.mediaQueryPadding.bottom;

/// 디버그모드 확인
bool get isDebugMode => kDebugMode;

/// 테스트모드 확인
bool get isTestMode => kDebugMode && false; // 켜줄 때는 true, 꺼줄 때는 false

/// Android 운영체제 확인
bool get isAndroid => Platform.isAndroid;

/// IOS 운영체제 확인
bool get isIOS => Platform.isIOS;

/// Base64문자 -> utf8 문자로 디코딩
String base64ToString(String data) {
  return utf8.fuse(base64).decode(data);
}

/// emulator 운영체제 확인
Future<bool> get isEmulator async {
  if (isAndroid) {
    AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
    return !androidDeviceInfo.isPhysicalDevice;
  } else if (isIOS) {
    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    return !iosInfo.isPhysicalDevice;
  } else {
    return false;
  }
}

//xx final GlobalKey<FrameUserState> frameUserKey = GlobalKey<FrameUserState>();
//xx final GlobalKey<RecordScreenState> recordScreenKey = GlobalKey<RecordScreenState>();

/// 바텀 화면 변경 및 상세페이지 진입 시 사용
///
/// ```dart
///
/// changePage(1);
/// changePage(2);
/// changePage(4, pages: [const SamplePage(),const SamplePage(),const SamplePage()]);
///
///
/// ```
//xx Function(int index, {List<Widget> pages}) get bottomChangePage => frameUserKey.currentState!.bottomChangePage;

/// 퍼미션 체크
///xx
// Future<bool> get checkStoragePermission async => await Permission.storage.request().isGranted;
// Future<bool> get checkCameraPermission async => await Permission.camera.request().isGranted;
// Future<bool> get checkPhotosPermission async => await Permission.photos.request().isGranted; //ios는 isLimited도 허용해야함
// Future<bool> get checkContactsPermission async => await Permission.contacts.request().isGranted;

/// URL연결(인터넷,전화,문자,이메일)
///
/// ```dart
/// url:'www.naver.com', urlType:UrlType.INTERNET -> 'https://www.naver.com'
/// url:'01012345678', urlType:UrlType.TEL -> 'tel:01012345678'
/// url:'01023456789', urlType:UrlType.SMS, body:'내용 -> 'sms:01023456789?body=내용'
/// url:'www.naver.com', urlType:UrlType.EMAIL, subject:'제목', body:'내용' -> 'mailto:www.naver.com?subject=제목&body=내용'
/// ```
///
// Future<void> urlLauncher({
//   required String url,
//   required UrlType urlType,
//
//   /// 이메일 제목
//   String subject = '제목 입력부분입니다.',
//
//   /// 이메일&문자 내용
//   String body = '내용 입력부분입니다.',
// }) async {
//   switch (urlType) {
//     case UrlType.INTERNET:
//       if (url.startsWith("http://") || url.startsWith("https://")) {
//         await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
//       } else {
//         await launchUrl(Uri.parse('https://$url'));
//       }
//       break;
//     case UrlType.TEL:
//       await launchUrl(Uri.parse('tel:$url'));
//       break;
//     case UrlType.SMS:
//       await launchUrl(Uri.parse('sms:$url?body=$body')); //'sms:+39 348 060 888?body=hello%20there';
//       break;
//     case UrlType.EMAIL:
//       await launchUrl(
//           Uri.parse('mailto:$url?subject=$subject&body=$body')); //<email address>?subject=<subject>&body=<body>
//       break;
//   }
// }

/// 전역에서 사용가능
///
/// 로딩 표시
void showLoading({Color? progressIndicatorColor = WtColors.p100, Color? overlayColor, bool? nothingIndicator}) =>
    Loader.show(
      Get.overlayContext!,
      progressIndicator: nothingIndicator == true || progressIndicatorColor == null
          ? null
          : progressIndicatorColor == WtColors.white
          ? Container(
        width: 243,
        height: 238,
        decoration:
        BoxDecoration(color: WtColors.p100.withOpacity(0.85), borderRadius: BorderRadius.circular(8.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            EasyCircularIndicator(color: progressIndicatorColor),
            sizedBox16,
            DefaultTextStyle(
              style: WtTextStyle.h6m.b50,
              child: const EasyText('전송 중'),
            ),
          ],
        ),
      )
          : EasyCircularIndicator(color: progressIndicatorColor),
      overlayColor: nothingIndicator == true ? Colors.transparent : overlayColor,
    );

/// 전역에서 사용가능
///
/// 로딩 숨기기
void hideLoading() => Loader.hide();

/// 메시지 - 다이얼로그
///
///  * [title], 메시지 제목
///  * [content], 메시지 내용
///  * [actions], 버튼
///
Future<bool?> defaultDialog({
  dynamic title,
  dynamic content,
  List<Widget>? actions,
  bool barrierDismissible = true,
  bool large = false,
}) {
  return Get.dialog(
    barrierDismissible: barrierDismissible,
    WillPopScope(
      onWillPop: () async {
        return barrierDismissible;
      },
      child: AlertDialog(
        title: title is Widget
            ? Container(
          color: Color(0xFFF9FFFB), // #F3F9FF
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: title,
          ),
        )
            : title is String
            ? Container(
          color: const Color(0xFFE4F1FE), // #F3F9FF
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: EasyText.h6m(title, color: WtColors.b800, textAlign: TextAlign.center),
          ),
        )
            : null,
        content: content is Widget
            ? Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content,
            ),
          ),
        )
            : content is String
            ? Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: EasyText.s1(content, color: WtColors.b600, textAlign: TextAlign.center),
          ),
        )
            : sizedBox0,
        actions: actions != null
            ? [
          Container(
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: WtColors.b100)),
                  ),
                  height: 56,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: actions
                        .asMap()
                        .entries
                        .map((e) => Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(
                            left: e.key != 0 ? BorderSide(color: WtColors.b100, width: .5) : BorderSide.none,
                            right: e.key != actions.length - 1 ? BorderSide(color: WtColors.b100, width: .5) : BorderSide.none,
                          ),
                        ),
                        child: e.value,
                      ),
                    ))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ]
            : null,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        actionsPadding: EdgeInsets.zero,
        insetPadding: EdgeInsets.symmetric(horizontal: large ? 16.0 : 32.0, vertical: 24.0),
        clipBehavior: Clip.antiAliasWithSaveLayer,
      ),
    ),
  );
}

void closeDialogAndAllSnackbars({bool topmost = false}) {
  Get.closeAllSnackbars();
  bool first = true;
  Get.until((route) {
    if (Get.isDialogOpen!) {
      if (topmost) {
        if (first) {
          first = false;
          return false;
        }
      } else {
        return false;
      }
    }
    return true;
  });
}

/// 팝업
///
/// ‼️ 포지션이 안맞는 경우 동작하는 위젯을 Builder로 감싸줘야함.
Future<T?> defaultMenu<T>({
  BuildContext? context,
  required List<PopupMenuEntry<T>> items,
  RelativeRect? initPosition,
  double elevation = 8.0,
  Color? color,
  T? initialValue,
  String? semanticLabel,
  ShapeBorder? shape,
  bool useRootNavigator = false,
}) {
  RenderBox box = (context ?? Get.context!).findRenderObject() as RenderBox;
  Offset position = box.localToGlobal(Offset.zero);

  return showMenu<T>(
    context: context ?? Get.context!,
    position: initPosition ??
        RelativeRect.fromLTRB(
            position.dx, position.dy + 50, 0.0, 0.0), //position where you want to show the menu on screen
    items: items,
    elevation: elevation,
    color: color,
    initialValue: initialValue,
    semanticLabel: semanticLabel,
    shape: shape ??
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
    useRootNavigator: useRootNavigator,
  );
}

/// 메시지 - Show Modal Bottom Sheet
Future<T?> defaultModalBottomSheet<T>({
  BuildContext? context,
  required Widget widget,
  Color? backgroundColor,
  double? elevation,
  ShapeBorder? shape,
  Clip? clipBehavior,
  BoxConstraints? constraints,
  Color? barrierColor,
  bool isScrollControlled = false,
  double? heightFactor,
  bool useRootNavigator = false,
  bool isDismissible = true,
  bool enableDrag = true,
  RouteSettings? routeSettings,
  AnimationController? transitionAnimationController,
}) {
  return showModalBottomSheet(
    context: context ?? Get.context!,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: heightFactor,
        child: SafeArea(
          top: false,
          left: false,
          right: false,
          bottom: true,
          child: widget,
        ),
      );
    },
    backgroundColor: backgroundColor,
    elevation: elevation,
    shape: shape ??
        const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            )),
    clipBehavior: clipBehavior,
    constraints: constraints,
    barrierColor: barrierColor,
    isScrollControlled: heightFactor != null ? true : isScrollControlled,
    useRootNavigator: useRootNavigator,
    isDismissible: isDismissible,
    enableDrag: enableDrag,
    routeSettings: routeSettings,
    transitionAnimationController: transitionAnimationController,
  );
}

/// 스낵바
defaultSnackbar(dynamic title, dynamic message,
    {bool bottom = true, bool? long, Widget? mainButton, Color? backgroundColor}) async {
  await Get.closeCurrentSnackbar(); //!
  Get.showSnackbar(GetSnackBar(
    animationDuration: const Duration(milliseconds: 550),
    titleText: title == null
        ? null
        : title is Widget
        ? title
        : EasyText(title.toString(), style: WtTextStyle.h7m.white),
    messageText: message == null
        ? const SizedBox.shrink()
        : message is Widget
        ? message
        : EasyText(message.toString(), style: WtTextStyle.b1.white),
    maxWidth: 600,
    backgroundColor: backgroundColor ?? WtColors.d900,
    // margin: Get.currentRoute == Routes.frame
    //     ? const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, kBottomNavigationBarHeight + 8.0)
    //     : const EdgeInsets.all(8.0),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    borderRadius: 8.0,
    duration: mainButton != null
        ? null
        : Duration(
        seconds: long == true
            ? 5
            : long == false
            ? 1
            : 3),
    snackPosition: bottom ? SnackPosition.BOTTOM : SnackPosition.TOP,
    mainButton: mainButton,
  ));
}

severeSnackbar(dynamic title, dynamic message, {bool bottom = true, bool? long, Widget? mainButton}) =>
    defaultSnackbar(title, message,
        bottom: bottom,
        long: long,
        mainButton: mainButton,
        backgroundColor: Color.lerp(WtColors.negative, WtColors.black, 0.5));

/// 이미지 가지고오기(단일모드)
///
/// ImageSource.camera : 사진
///
/// ImageSource.gallery : 갤러리
///
// Future<String?> getImagePath({
//   required ImageSource imageSource,
//   int aspectRatioX = 1,
//   int aspectRatioY = 1,
//   bool useCrop = false,
//   double? maxResize,
// }) async {
//   String? filePath;
//   XFile? pickedFile;
//
//   if (await Permission.storage.request().isGranted) {
//     if (imageSource == ImageSource.gallery) {
//       pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.gallery,
//         maxWidth: maxResize,
//         maxHeight: maxResize,
//         imageQuality: 90,
//       );
//     } else {
//       pickedFile = await ImagePicker().pickImage(
//         source: ImageSource.camera,
//         maxWidth: maxResize,
//         maxHeight: maxResize,
//         imageQuality: 90,
//       );
//     }
//
//     if (pickedFile != null) {
//       filePath = pickedFile.path;
//       log.info('compress file size : ${await pickedFile.length()}');
//
//       //xx if (useCrop) {
//       //   String imagePath = await WtImageCropPage(
//       //     file: File(pickedFile.path),
//       //     aspectRatio: aspectRatioX / aspectRatioY,
//       //   ).getData() as String;
//
//       //   filePath = imagePath;
//       // } else {
//       //   filePath = pickedFile.path;
//       // }
//
//       // if (minResize != null) {
//       //   var file = await FlutterImageCompress.compressAndGetFile(
//       //     filePath,
//       //     '$filePath.webp',
//       //     minWidth: minResize,
//       //     minHeight: minResize,
//       //     quality: 90,
//       //     format: CompressFormat.webp,
//       //   );
//       //   filePath = file?.absolute.path ?? filePath;
//       //   log.info('compress file size : ${file?.lengthSync()}');
//       // }
//     }
//   }
//
//   return filePath;
// }

/// 이미지 프로필 위젯
/// 경로에 맞게 프로필 이미지 가지고 오기
///
/// Example
/// ```
/// value : 'assets/images/profile_image.jpg'
/// ```
///
// Widget getIconWidget(
//     dynamic value, {
//       double size = 40,
//       Color? color,
//       ImageShape? imageShape = ImageShape.SQUARE,
//     }) {
//   if (value == null || value == '') {
//     return _errorBuilderProfileWidget(size, size, imageShape);
//   }
//
//   if (value is String) {
//     if (value.startsWith('assets') && value.endsWith('.svg')) {
//       return _setImage(
//         imageShape: imageShape,
//         width: size,
//         height: size,
//         child: SvgPicture.asset(
//           value,
//           color: color,
//         ),
//       );
//     } else if (value.contains('http') || value.contains('https')) {
//       return _setImage(
//         imageShape: imageShape,
//         width: size,
//         height: size,
//         child: Image.network(
//           value,
//           color: color,
//         ),
//       );
//     } else {
//       return _setImage(
//         imageShape: imageShape,
//         width: size,
//         height: size,
//         child: Image.asset(
//           value,
//           color: color,
//           errorBuilder: (context, error, stackTrace) => _errorBuilderProfileWidget(size, size, imageShape),
//         ),
//       );
//     }
//   } else {
//     return value;
//   }
// }

/// 이미지 위젯
///
/// 경로에 맞게 이미지 위젯 가지고 오기
///
/// Example
/// ```
/// value : 'assets/images/background.jpg'
/// ```
///
// Widget getImageWidget(
//     dynamic value, {
//       BoxFit boxFit = BoxFit.fill,
//       double? width,
//       double? height,
//       bool showCameraIcon = false,
//       bool showBorder = true,
//       ImageShape? imageShape = ImageShape.SQUARE,
//     }) {
//   if (value == null || value == '') {
//     return _setImage(
//       imageShape: imageShape,
//       width: width,
//       height: height,
//       color: WtColors.x__grey5,
//       showBorder: showBorder,
//       child: showCameraIcon
//           ? Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Icon(WtIcons.camera, color: WtColors.x__grey2),
//             const SizedBox(
//               height: 8,
//             ),
//             Text('이미지 등록', style: WtTextStyle.x__size12.x__grey1),
//           ],
//         ),
//       )
//           : _errorBuilderImageWidget(width, height, imageShape),
//     );
//   }
//
//   if (value is String) {
//     if (value.contains('assets')) {
//       if (value.contains('svg')) {
//         return _setImage(
//           imageShape: imageShape,
//           width: width,
//           height: height,
//           showBorder: showBorder,
//           child: SvgPicture.asset(
//             value,
//             fit: boxFit,
//           ),
//         );
//       } else {
//         return _setImage(
//           imageShape: imageShape,
//           width: width,
//           height: height,
//           showBorder: showBorder,
//           child: Image.asset(
//             value,
//             fit: boxFit,
//             errorBuilder: (context, error, stackTrace) => _errorBuilderImageWidget(width, height, imageShape),
//           ),
//         );
//       }
//     } else if (value.contains('/data') ||
//         value.contains('storage') ||
//         value.contains('file:') ||
//         value.contains('/private')) {
//       return _setImage(
//         imageShape: imageShape,
//         width: width,
//         height: height,
//         showBorder: showBorder,
//         child: Image.file(
//           File(value),
//           fit: boxFit,
//           errorBuilder: (context, error, stackTrace) => _errorBuilderImageWidget(width, height, imageShape),
//         ),
//       );
//     } else {
//       return _setImage(
//         imageShape: imageShape,
//         width: width,
//         height: height,
//         showBorder: showBorder,
//         child: Image.network(
//           value,
//           fit: boxFit,
//           errorBuilder: (context, error, stackTrace) => _errorBuilderImageWidget(width, height, imageShape),
//         ),
//       );
//     }
//   } else {
//     return value;
//   }
// }

// BorderRadius _borderRadius(ImageShape imageShape) {
//   if (imageShape == ImageShape.CIRCLE) {
//     return BorderRadius.circular(50);
//   } else if (imageShape == ImageShape.LEAF) {
//     return const BorderRadius.only(
//       topLeft: Radius.circular(5),
//       topRight: Radius.circular(10),
//       bottomLeft: Radius.circular(10),
//       bottomRight: Radius.circular(5),
//     );
//   } else if (imageShape == ImageShape.ONLY_SQUARE) {
//     return BorderRadius.circular(0);
//   } else {
//     return BorderRadius.circular(4);
//   }
// }
//
// Widget _setImage({
//   required Widget child,
//   ImageShape? imageShape,
//   double? width,
//   double? height,
//   Color? color,
//   bool showBorder = false,
// }) {
//   if (imageShape == null) return child;
//
//   return Container(
//     width: width,
//     height: height,
//     decoration: BoxDecoration(
//       color: color,
//       borderRadius: _borderRadius(imageShape),
//       border: showBorder ? Border.all(width: 0.5, color: const Color.fromRGBO(45, 45, 45, 0.10)) : null,
//     ),
//     child: ClipRRect(
//       borderRadius: _borderRadius(imageShape),
//       child: child,
//     ),
//   );
// }
//
// ///이미지 가져오기 오류시 불러올 이미지
// Widget _errorBuilderProfileWidget(
//     double? width,
//     double? height,
//     ImageShape? imageShape,
//     ) {
//   return _setImage(
//     imageShape: imageShape,
//     width: width,
//     height: height,
//     child: SvgPicture.asset(thumbnail),
//   );
// }
//
// ///이미지 가져오기 오류시 불러올 이미지
// Widget _errorBuilderImageWidget(
//     double? width,
//     double? height,
//     ImageShape? imageShape,
//     ) {
//   return const Center(
//     child: Icon(WtIcons.error),
//   );
// }

/// 경로에 맞게 이미지정보 가지고 오기
///
/// Example
/// ```
/// value : 'assets/images/background.jpg'
/// ```
///
ImageProvider? getImage(dynamic value) {
  if (value is String) {
    if (value.contains('assets')) {
      return AssetImage(value);
    } else if (value.contains('storage') || value.contains('file:')) {
      return FileImage(File(value));
    } else {
      return NetworkImage(value);
    }
  } else {
    if (value is File) {
      return FileImage(value);
    } else {
      return value;
    }
  }
}

/// 디바이스 및 패키지정보 시작
/// android 또는 ios기기의 device id 가져오기
Future<String?> getDeviceId() async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  if (Platform.isAndroid) {
    var androidInfo = await deviceInfo.androidInfo;
    return androidInfo.id;
  } else if (Platform.isIOS) {
    var iosInfo = await deviceInfo.iosInfo;
    return iosInfo.identifierForVendor;
  } else if (Platform.isMacOS) {
    var macosInfo = await deviceInfo.macOsInfo;
    return macosInfo.systemGUID;
  }
  return null;
}

/// 디바이스에 설치된 패키지 버전정보를 가져오기
Future<String> getPackageVersion() async => (await PackageInfo.fromPlatform()).version;

/// 디바이스에 설치된 패키지 앱이름를 가져오기
Future<String> getPackageAppName() async => (await PackageInfo.fromPlatform()).appName;

void focusOut() {
  FocusManager.instance.primaryFocus!.unfocus();
}

/// 조회 쿼리 로그 출력여부
//xx bool get showSelectQuery => config.showSelectQuery;

/// 생성,수정 쿼리 로그 출력여부
//xx bool get showMutationQuery => config.showMutationQuery;
