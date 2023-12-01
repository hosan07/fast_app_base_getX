part of 'app_pages.dart';

get navigatorPage5 => Navigator(
  key: globalKeyList[Frame.page5.index],
  initialRoute: Routes.page5,
  onGenerateRoute: (settings) {
    if (settings.name == Routes.page5) {
      return GetPageRoute(
        page: () => Page5(),
        binding: Page5Binding(),
      );
    }
    return null;
  },
);
