import 'package:flutter/foundation.dart';
import 'package:baseapp_getx/pages/home/home.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl_standalone.dart';
import 'package:baseapp_getx/data.dart';
import 'package:baseapp_getx/index.dart';
import 'package:baseapp_getx/pages/login/begin.dart';
import 'package:http/http.dart' as http;


part 'main.controller.dart';
part 'main.initialize.dart';
part 'main.services.dart';

//최초 진입점
Future<void> main() async {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    log.severe(details);
  };

  //플러터 에러 처리 설정
  PlatformDispatcher.instance.onError = (error, stack) {
    log.severe('error = $error\nstack = $stack');
    return true;
  };

  // 앱 초기화
  await initialize();


  //필요한 장비 Get_put 설정
  setupServices(); // getIt services


  // 기기 선호 방향 설정(세로)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  //SharedPreferneces 초기화
  prefs = await SharedPreferences.getInstance();
  ///알림 권한
  // if(Platform.isIOS){
  //   await LocalNotification.initialize();
  // }

  // await LocalNotification.initialize();
  //알림 초기화
  // alarmRepo = Get.put(AlarmRepository(), permanent: true);

  //로깅 초기화
  initLogger();

  //앱 실행
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en', 'US'),
      Locale('ko'),
    ],
    path: 'assets/langs.csv',
    // fallbackLocale: Locale('en', 'US'),
    // startLocale: Locale('en', 'US'),
    fallbackLocale: const Locale('ko'),
    startLocale: const Locale('ko'),
    saveLocale: false,
    // useOnlyLangCode: true,
    assetLoader: CsvAssetLoader(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // 시스템 로캘 설정 - 비동기적
    Future.delayed(Duration.zero).then((_) async => Intl.systemLocale = await findSystemLocale());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  //위젯이 처음 표시될 때 API 호출
  void didChangeDependencies() {
    // greetApi 실행
    // Future.delayed(const Duration(milliseconds: 1), () => getIt<MixedApi>().greetApi());

    super.didChangeDependencies();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      //로컬라이제이션 설정
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'baseapp_getx',
      themeMode: ThemeMode.light,
      theme: mainTheme(),
      getPages: AppPages.routes,
      initialRoute: Routes.begin,
      //initialRoute: Routes.frame,
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        Get.find<MainController>().updateScreen(context);
        return ResponsiveWrapper.builder(
          //반응형 디자인 브레이크포인트 설정
          MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: Globals.textScaleFactor),
            child: child!,
          ),
          minWidth: minScreenWidth,
          maxWidth: maxScreenWidth,
          breakpoints: const [
            ResponsiveBreakpoint.resize(540, name: MOBILE),
            ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ],
          mediaQueryData: mediaQueryData = MediaQuery.of(context),
          // background: const ColoredBox(color: Color(0xFFFF0000)),
          // backgroundColor: const Color(0xFFFF0000),
        );
      },
    );
  }
}
