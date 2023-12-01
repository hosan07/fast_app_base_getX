part of 'app_pages.dart';

final navigatorPage2 = Navigator(
  key: globalKeyList[Frame.page2.index],
  initialRoute: Routes.page2,
  onGenerateRoute: (settings) {
    if (settings.name == Routes.page2) {
      return GetPageRoute(
        page: () => Page2(),
        binding: Page2Binding(),
      );
    }
  },
);
