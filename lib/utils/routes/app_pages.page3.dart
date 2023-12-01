part of 'app_pages.dart';

final navigatorPage3 = Navigator(
  key: globalKeyList[Frame.page3.index],
  initialRoute: Routes.page3,
  onGenerateRoute: (settings) {
    if (settings.name == Routes.page3) {
      return GetPageRoute(
        page: () => Page3(),
        binding: Page3Binding(),
      );
    }
  },
);
