import 'package:flutter/material.dart';

///Настройки тем приложения
final lightTheme = ThemeData(
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    dense: true,
    horizontalTitleGap: 10.0,
    minLeadingWidth: 0,
    enableFeedback: true,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  iconTheme: const IconThemeData(
    color: lmPrimaryColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      primary: lmElevatedButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  canvasColor: lmPrimaryColor,
  scaffoldBackgroundColor: lmPrimaryColor,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: lmPrimaryColor,
    selectedItemColor: lmBottomBarSelectedColor,
    unselectedItemColor: lmBottomBarUnselectedColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: lmSecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: lmSecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: lmHeadline4Color,
    ),
    headline3: textBold14DarkGrey.copyWith(
      color: lmHeadline3Color,
    ),
    headline2: textBold14DarkGrey.copyWith(
      color: lmSecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: lmSecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: lmSecondaryColor,
    ),
    subtitle2: textBold14DarkGrey.copyWith(
      color: lmHeadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: lmSecondaryColor,
    ),
    bodyText2: textRegular14White,
    caption: textNormal16Black.copyWith(color: lmSecondaryColor),
    overline: textNormal10Black,
  ),
  primaryColor: lmPrimaryColor,
  primaryColorDark: lmSecondaryColor,
  backgroundColor: lmBackgroundColor,
  sliderTheme: const SliderThemeData(
    activeTrackColor: lmRangeSliderActiveColor,
    thumbColor: lmThumbColor,
    trackHeight: 2,
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: lmTextFieldCursorColor),
  toggleableActiveColor: lmToggleableActiveColor,
  unselectedWidgetColor: lmUnselectedWidgetColor,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: lmPrimaryColor,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.green.shade900,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    iconColor: lmSecondaryColor,
  ),
);

///Тёмная тема*************************************************************
final darkTheme = ThemeData(
  listTileTheme: const ListTileThemeData(
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    dense: true,
    horizontalTitleGap: 10.0,
    minLeadingWidth: 0,
    enableFeedback: true,
    textColor: _darkBlack,
    tileColor: _darkBlack,
    selectedColor: _darkBlack,
    selectedTileColor: _darkBlack,
  ),
  pageTransitionsTheme: const PageTransitionsTheme(
    builders: <TargetPlatform, PageTransitionsBuilder>{
      TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 5,
      primary: dmElevatedButtonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  ),
  canvasColor: dmPrimaryColor,
  scaffoldBackgroundColor: dmPrimaryColor,
  iconTheme: const IconThemeData(color: dmSecondaryColor),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: dmPrimaryColor,
    selectedItemColor: dmBottomBarSelectedColor,
    unselectedItemColor: dmBottomBarSelectedColor,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
  ),
  textTheme: TextTheme(
    headline6: textRegular32DarkGrey.copyWith(
      color: dmSecondaryColor,
    ),
    headline5: textRegular16Black.copyWith(
      color: dmSecondaryColor,
    ),
    headline4: textRegular14Grey.copyWith(
      color: dmHeadline4Color,
    ),
    headline3: textBold14DarkGrey.copyWith(
      color: dmHeadline3Color,
    ),
    headline2: textBold14DarkGrey.copyWith(
      color: dmSecondaryColor,
    ),
    headline1: textSubtitleRegular18Grey.copyWith(
      color: dmSecondaryColor,
    ),
    subtitle1: textNormal24Black.copyWith(
      color: dmSecondaryColor,
    ),
    subtitle2: textBold14DarkGrey.copyWith(
      color: dmHeadline4Color,
    ),
    bodyText1: textRegular14Grey.copyWith(
      color: dmSecondaryColor,
    ),
    bodyText2: textRegular14White,
    caption: textNormal16Black.copyWith(color: dmSecondaryColor),
    overline: textNormal10White,
  ),
  primaryColor: dmBlackDarkColor,
  primaryColorDark: dmSecondaryColor,
  backgroundColor: dmBlackDarkColor,
  sliderTheme: const SliderThemeData(
    activeTrackColor: dmRangeSliderActiveColor,
    thumbColor: dmThumbColor,
    trackHeight: 2,
  ),
  textSelectionTheme:
      const TextSelectionThemeData(cursorColor: dmTextFieldCursorColor),
  toggleableActiveColor: dmToggleableActiveColor,
  unselectedWidgetColor: dmUnselectedWidgetColor,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: dmSecondaryColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 73, 40, 167),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    iconColor: dmSecondaryColor,
  ),
);

/// Цвета для светлой темы
const Color lmBackgroundColor = _milkWhite,
    lmInactiveBlackColor = _lightGrey,
    lmPrimaryColor = _white,
    lmBottomBarSelectedColor = _darkBlack,
    lmBottomBarUnselectedColor = _lightBlack,
    lmSecondaryColor = _darkGrey,
    lmBackgroundBlackColor = _ferricBlack,
    lmHeadline4Color = _grey,
    lmHeadline3Color = _white,
    lmElevatedButtonColor = _green,
    lmRangeSliderActiveColor = _green,
    lmThumbColor = _white,
    lmTextFieldCursorColor = _ferricBlack,
    lmToggleableActiveColor = _green,
    lmUnselectedWidgetColor = _white;

/// Цвета для тёмной темы
const Color dmPrimaryColor = _lightBlack,
    dmBottomBarSelectedColor = _white,
    dmSecondaryColor = _white,
    dmBlackDarkColor = _darkBlack,
    dmHeadline4Color = _grey,
    dmHeadline3Color = _darkGrey,
    dmElevatedButtonColor = _green,
    dmRangeSliderActiveColor = _green,
    dmThumbColor = _white,
    dmTextFieldCursorColor = _white,
    dmToggleableActiveColor = _green,
    dmUnselectedWidgetColor = _lightBlack;

/// Цвета по умолчанию
const Color defaultIconColor = _white;

/// Палитра цветов
const Color _lightBlack = Color(0xFF2E2E2E),
    _white = Color(0xFFFFFFFF),
    _darkBlack = Color(0xFF1A1A20),
    _grey = Color(0xFF7C7E92),
    _darkGrey = Color(0xFF3B3E5B),
    _milkWhite = Color(0xFFF5F5F5),
    _lightGrey = Color.fromRGBO(124, 126, 146, 0.56),
    _ferricBlack = Color(0xFF252849),
    _green = Color(0xFF4CAF50);

///Стили текстов
const textRegular16Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w500,
  fontSize: 16,
  color: Color(0xFF3B3E5B),
);

const textBold24Black = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Color(0xFF3B3E5B),
);

const textBold14Black = TextStyle(
  fontFamily: 'Roboto-Bold',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Color(0xFF3B3E5B),
);
const textRegular14Grey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.normal,
  fontSize: 14,
  color: Color(0xFF7C7E92),
);
const textRegular14White = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w700,
  fontSize: 14,
  color: Color(0xFFFFFFFF),
);

const textRegular32DarkGrey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Color(0xFF3B3E5B),
);

const textRegular32Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Color(0xFF3B3E5B),
);

const textRegular32Yellow = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Colors.yellow,
);

const textRegular18Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: Color(0xFF252849),
);

const textBoldRegular14White = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Color(0xFFFFFFFF),
);

const textBoldRegular14Grey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Color.fromRGBO(124, 126, 146, 0.56),
);

const textSmallRegular14Grey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.normal,
  fontSize: 14,
  color: Color.fromRGBO(124, 126, 146, 0.56),
);

const textSubtitleRegular18Grey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w500,
  fontSize: 18,
  color: Color.fromRGBO(124, 126, 146, 0.56),
);

const textBold14DarkGrey = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.bold,
  fontSize: 14,
  color: Color(0xFF3B3E5B),
);

const textNormal24Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w700,
  fontSize: 24,
  color: Color(0xFF3B3E5B),
);
const textNormal16Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: Color(0xFF252849),
);
const textNormal10Black = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w900,
  fontSize: 12,
  color: Color(0xFF252849),
);

const textNormal10White = TextStyle(
  fontFamily: 'Roboto-Regular',
  fontWeight: FontWeight.w900,
  fontSize: 10,
  color: Color.fromARGB(255, 255, 255, 255),
);
