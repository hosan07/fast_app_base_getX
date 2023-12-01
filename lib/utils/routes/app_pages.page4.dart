part of 'app_pages.dart';

final navigatorPage4 = Navigator(
  key: globalKeyList[Frame.page4.index],
  initialRoute: Routes.page4,
  onGenerateRoute: (settings) {
    if (settings.name == Routes.page4) {
      return GetPageRoute(
        page: () => Page4(),
        binding: Page4Binding(),
      );
    }
  },
);
