import 'package:baseapp_getx/index.dart';

ThemeData mainTheme({Color primary = WtColors.p100}) {
  MaterialColor primarySwatch = createMaterialColor(fromColor: primary, toColor: Colors.black);

  return ThemeData(
    fontFamily: 'Pretendard',
    // fontFamily: isIOS ? 'Apple SD Gothic Neo' : null,
    // fontFamily: isIOS ? 'SF Pro' : null,
    // fontFamily: isIOS ? '.AppleSystemUIFont' : null,
    useMaterial3: false,

    primarySwatch: primarySwatch, // 메인색상
    canvasColor: WtColors.white, // 기본 배경화면 테마
    dividerColor: WtColors.b200,

    // 터치 이펙트 제거
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    hoverColor: Colors.transparent,

    colorScheme: ColorScheme(
      primary: Colors.black, //* TextFormField icon focus color
      // primaryVariant: primarySwatch[300]!,
      secondary: WtColors.white, // floating 버튼 색상
      // secondaryVariant: subColor[300]!,
      surface: WtColors.white, // card background
      background: WtColors.white,
      error: WtColors.negative,
      onPrimary: WtColors.x__grey0,
      onSecondary: WtColors.x__grey0,
      onSurface: WtColors.x__grey0, // card text, icon
      onBackground: WtColors.x__grey0,
      onError: WtColors.white,
      brightness: Brightness.light,
      shadow: WtColors.black,
    ),

    // 앱바 테마
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: WtColors.white,
        statusBarIconBrightness: Brightness.dark, //android
        statusBarBrightness: Brightness.light, //ios
      ),
      backgroundColor: WtColors.white,
      foregroundColor: WtColors.black, //?
      iconTheme: IconThemeData(color: WtColors.black), //?
      actionsIconTheme: IconThemeData(color: WtColors.black), //?
      elevation: 0,
      centerTitle: false,
      titleSpacing: 0,
    ),

    // 텍스트 테마
    textTheme: TextTheme(
      headline1: WtTextStyle.h1.black,
      headline2: WtTextStyle.h2.black,
      headline3: WtTextStyle.h3.black,
      headline4: WtTextStyle.h4.black,
      headline5: WtTextStyle.h5.black,
      headline6: WtTextStyle.h6b.black, // app bar,
      headlineLarge: WtTextStyle.h7m.x__grey0,
      subtitle1: WtTextStyle.s1.black, // text field,
      subtitle2: WtTextStyle.s2.black,
      bodyText1: WtTextStyle.b1.black,
      bodyText2: WtTextStyle.b2.black, // text,
      caption: WtTextStyle.caption.black,
      button: WtTextStyle.button.black,
      overline: WtTextStyle.overline.black,
    ),

    //* text button theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        minimumSize: const Size(52, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: WtTextStyle.h7m,
      ).copyWith(
        foregroundColor: materialStateColor(primary, WtColors.b200), //xx 임의값 b200
        overlayColor: materialSolidColor(primary.withOpacity(0.05)), //xx 임의값 0.05
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: InkHighlightFactory(),
      ),
    ),

    //* elevatedButton theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: WtColors.white,
        backgroundColor: primary,
        disabledForegroundColor: WtColors.white,
        disabledBackgroundColor: WtColors.b200,
        minimumSize: const Size(64, 56),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: WtTextStyle.h7m,
      ).copyWith(
        elevation: MaterialStateProperty.all(0.0),
        overlayColor: materialSolidColor(Colors.white12),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: InkHighlightFactory(),
      ),
    ),

    //* outlinedButton theme
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        minimumSize: const Size(50, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: WtTextStyle.x__size20B,
      ).copyWith(
        backgroundColor: materialStateColor(WtColors.x__background, WtColors.x__grey5),
        foregroundColor: materialStateColor(primary, WtColors.x__grey2),
        side: materialStateBorder(primary, WtColors.x__grey2),
        overlayColor: materialSolidColor(primary.withOpacity(0.05)),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashFactory: InkHighlightFactory(),
      ),
    ),

    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return primary;
        } else if (states.contains(MaterialState.disabled)) {
          return WtColors.x__background;
        }
        return null;
      }),
    ),

    checkboxTheme: const CheckboxThemeData(splashRadius: 0.0, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),
    radioTheme: const RadioThemeData(splashRadius: 0.0, materialTapTargetSize: MaterialTapTargetSize.shrinkWrap),

    //* bottomNavigationBar theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: WtColors.x__background, // 바텀 백그라운드 색상
      elevation: 0,
      selectedLabelStyle: WtTextStyle.x__size12M.x__indigo.h2_0,
      unselectedLabelStyle: WtTextStyle.x__size12.x__grey1.h2_0,
    ),

    //* dialog theme
    dialogTheme: DialogTheme(
      backgroundColor: WtColors.x__background,
      titleTextStyle: WtTextStyle.x__size20B.black,
      contentTextStyle: WtTextStyle.x__size14.black,
    ),

    //* snackBar theme
    snackBarTheme: SnackBarThemeData(actionTextColor: Colors.purple[200], contentTextStyle: WtTextStyle.b1.h1_4),

    //* divider theme
    dividerTheme: DividerThemeData(
      color: WtColors.b100,
      thickness: 1.0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        sizeConstraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        smallSizeConstraints: BoxConstraints.tightFor(
          width: 40.0,
          height: 40.0,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(2.0),
            )),
        elevation: 3,
        focusElevation: 4,
        highlightElevation: 4),

    //* 인풋 상자 꾸미기
    inputDecorationTheme: InputDecorationTheme(
      // 사이즈
      isDense: true,
      contentPadding: const EdgeInsets.fromLTRB(16.0, 0, 8, 9.1),

      // 배경 색상
      // filled: true,
      // fillColor: Colors.white,

      // 테두리 색상
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: WtColors.b200, strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gapPadding: 0.0),
      disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: WtColors.b50, strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gapPadding: 0.0),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: WtColors.b700, strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          gapPadding: 0.0),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: WtColors.negative, strokeAlign: BorderSide.strokeAlignCenter),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gapPadding: 0.0),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: WtColors.negative, strokeAlign: BorderSide.strokeAlignCenter, width: 1.2),
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gapPadding: 0.0),

      // 부수적인 글자 크기 & 색상
      labelStyle: WtTextStyle.s1.b500,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      floatingLabelStyle: WtTextStyle.s1.b500,
      hintStyle: WtTextStyle.s1.b300,
      helperStyle: WtTextStyle.caption.b500,
      errorStyle: WtTextStyle.caption.negative,

      prefixStyle: WtTextStyle.s1.b300,
      suffixStyle: WtTextStyle.s1.b300,
    ),
  );
}

MaterialStateProperty<Color?>? materialStateColor(Color? normal, Color? disabled, {Color? pressed, Color? selected}) =>
    MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
        if (disabled != null && states.contains(MaterialState.disabled)) {
          return disabled;
        }
        if (pressed != null && states.contains(MaterialState.pressed)) {
          return pressed;
        }
        if (selected != null && states.contains(MaterialState.selected)) {
          return selected;
        }
        return normal;
      },
    );

MaterialStateProperty<Color?>? materialSolidColor(Color? solid) => MaterialStateProperty.all<Color?>(solid);

MaterialStateProperty<T> materialAll<T>(T all) => MaterialStateProperty.all<T>(all);

MaterialStateProperty<BorderSide?>? materialStateBorder(Color normal, Color? disabled,
    {Color? pressed, Color? selected, double width = 1.0}) =>
    MaterialStateProperty.resolveWith<BorderSide?>(
          (Set<MaterialState> states) {
        final Color borderColor;
        if (disabled != null && states.contains(MaterialState.disabled)) {
          borderColor = disabled;
        } else if (pressed != null && states.contains(MaterialState.pressed)) {
          borderColor = pressed;
        } else if (selected != null && states.contains(MaterialState.selected)) {
          borderColor = selected;
        } else {
          borderColor = normal;
        }
        return BorderSide(color: borderColor, width: width);
      },
    );
