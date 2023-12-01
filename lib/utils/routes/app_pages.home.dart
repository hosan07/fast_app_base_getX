part of 'app_pages.dart';

final navigatorHome = Navigator(
  key: globalKeyList[Frame.home.index],
  initialRoute: Routes.home,
  onGenerateRoute: (settings) {
    if (settings.name == Routes.home) {
      return GetPageRoute(
        page: () => HomePage(),
        binding: HomeBinding(),
      );
    }
  },
);
