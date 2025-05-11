import 'package:flutter/material.dart';

/// Defines the colors used throughout the app
abstract class AppColors {
  /// Transparent color
  static const transparent = Color(0x00FFFFFF);

  /// Base color white
  static const white = Color(0xFFFFFFFF);

  /// Base color black
  static const black = Color(0xFF000000);

  /// Light background for scaffold
  static const scaffoldBackgroundLight = Color(0xFFFCFCFC);

  /// Dark background for scaffold
  static const scaffoldBackgroundDark = Color(0xFF2C2F35);

  /// Light background for cards
  static const cardBackgroundLight = Color(0xFFFFFFFF);

  /// Dark background for cards
  static const cardBackgroundDark = Color(0xFF45484E);

  /// Shadow color
  static const shadowColor = Color(0xFF101828);

  /// Gray 25
  static const gray25 = Color(0xFFFCFCFD);

  /// Gray 50
  static const gray50 = Color(0xFFF9FAFB);

  /// Gray 100
  static const gray100 = Color(0xFFF2F4F7);

  /// Gray 200
  static const gray200 = Color(0xFFEAECF0);

  /// Gray 300
  static const gray300 = Color(0xFFD0D5DD);

  /// Gray 400
  static const gray400 = Color(0xFF98A2B3);

  /// Gray 500
  static const gray500 = Color(0xFF667085);

  /// Gray 600
  static const gray600 = Color(0xFF475467);

  /// Gray 700
  static const gray700 = Color(0xFF344054);

  /// Gray 800
  static const gray800 = Color(0xFF1D2939);

  /// Gray 900
  static const gray900 = Color(0xFF101828);

  /// Gray True 25
  static const grayTrue25 = Color(0xFFFCFCFC);

  /// Gray True 50
  static const grayTrue50 = Color(0xFFFAFAFA);

  /// Gray True 100
  static const grayTrue100 = Color(0xFFF5F5F5);

  /// Gray True 200
  static const grayTrue200 = Color(0xFFE5E5E5);

  /// Gray True 300
  static const grayTrue300 = Color(0xFFD6D6D6);

  /// Gray True 400
  static const grayTrue400 = Color(0xFFA3A3A3);

  /// Gray True 500
  static const grayTrue500 = Color(0xFF737373);

  /// Gray True 600
  static const grayTrue600 = Color(0xFF525252);

  /// Gray True 700
  static const grayTrue700 = Color(0xFF424242);

  /// Gray True 800
  static const grayTrue800 = Color(0xFF292929);

  /// Gray True 900
  static const grayTrue900 = Color(0xFF141414);

  /// Primary 25
  static const primary25 = Color(0xFFF5F8FF);

  /// Primary 50
  static const primary50 = Color(0xFFEFF4FF);

  /// Primary 100
  static const primary100 = Color(0xFFD1E0FF);

  /// Primary 200
  static const primary200 = Color(0xFFB2CCFF);

  /// Primary 300
  static const primary300 = Color(0xFF84ADFF);

  /// Primary 400
  static const primary400 = Color(0xFF528BFF);

  /// Primary 500
  static const primary500 = Color(0xFF2970FF);

  /// Primary 600
  static const primary600 = Color(0xFF155EEF);

  /// Primary 700
  static const primary700 = Color(0xFF004EEB);

  /// Primary 800
  static const primary800 = Color(0xFF0040C1);

  /// Primary 900
  static const primary900 = Color(0xFF00359E);

  /// Error 25
  static const error25 = Color(0xFFFFFBFA);

  /// Error 50
  static const error50 = Color(0xFFFEF3F2);

  /// Error 100
  static const error100 = Color(0xFFFEE4E2);

  /// Error 200
  static const error200 = Color(0xFFFECDCA);

  /// Error 300
  static const error300 = Color(0xFFFDA29B);

  /// Error 400
  static const error400 = Color(0xFFF97066);

  /// Error 500
  static const error500 = Color(0xFFF04438);

  /// Error 600
  static const error600 = Color(0xFFD92D20);

  /// Error 700
  static const error700 = Color(0xFFB42318);

  /// Error 800
  static const error800 = Color(0xFF912018);

  /// Error 900
  static const error900 = Color(0xFF7A271A);

  /// Warning 25
  static const warning25 = Color(0xFFFFFCF5);

  /// Warning 50
  static const warning50 = Color(0xFFFFFAEB);

  /// Warning 100
  static const warning100 = Color(0xFFFEF0C7);

  /// Warning 200
  static const warning200 = Color(0xFFFEDF89);

  /// Warning 300
  static const warning300 = Color(0xFFFEC84B);

  /// Warning 400
  static const warning400 = Color(0xFFFDB022);

  /// Warning 500
  static const warning500 = Color(0xFFF79009);

  /// Warning 600
  static const warning600 = Color(0xFFDC6803);

  /// Warning 700
  static const warning700 = Color(0xFFB54708);

  /// Warning 800
  static const warning800 = Color(0xFF93370D);

  /// Warning 900
  static const warning900 = Color(0xFF7A2E0E);

  /// Success 25
  static const success25 = Color(0xFFF6FEF9);

  /// Success 50
  static const success50 = Color(0xFFECFDF3);

  /// Success 100
  static const success100 = Color(0xFFD1FADF);

  /// Success 200
  static const success200 = Color(0xFFA6F4C5);

  /// Success 300
  static const success300 = Color(0xFF6CE9A6);

  /// Success 400
  static const success400 = Color(0xFF32D583);

  /// Success 500
  static const success500 = Color(0xFF12B76A);

  /// Success 600
  static const success600 = Color(0xFF039855);

  /// Success 700
  static const success700 = Color(0xFF027A48);

  /// Success 800
  static const success800 = Color(0xFF05603A);

  /// Success 900
  static const success900 = Color(0xFF054F31);

  /// Blue 25
  static const blue25 = Color(0xFFF5FAFF);

  /// Blue 50
  static const blue50 = Color(0xFFEFF8FF);

  /// Blue 100
  static const blue100 = Color(0xFFD1E9FF);

  /// Blue 200
  static const blue200 = Color(0xFFB2DDFF);

  /// Blue 300
  static const blue300 = Color(0xFF84CAFF);

  /// Blue 400
  static const blue400 = Color(0xFF53B1FD);

  /// Blue 500
  static const blue500 = Color(0xFF2E90FA);

  /// Blue 600
  static const blue600 = Color(0xFF1570EF);

  /// Blue 700
  static const blue700 = Color(0xFF175CD3);

  /// Blue 800
  static const blue800 = Color(0xFF1849A9);

  /// Blue 900
  static const blue900 = Color(0xFF194185);

  /// Blue Dark 25
  static const blueDark25 = Color(0xFFF5F8FF);

  /// Blue Dark 50
  static const blueDark50 = Color(0xFFEFF4FF);

  /// Blue Dark 100
  static const blueDark100 = Color(0xFFD1E0FF);

  /// Blue Dark 200
  static const blueDark200 = Color(0xFFB2CCFF);

  /// Blue Dark 300
  static const blueDark300 = Color(0xFF84ADFF);

  /// Blue Dark 400
  static const blueDark400 = Color(0xFF528BFF);

  /// Blue Dark 500
  static const blueDark500 = Color(0xFF2970FF);

  /// Blue Dark 600
  static const blueDark600 = Color(0xFF155EEF);

  /// Blue Dark 700
  static const blueDark700 = Color(0xFF004EEB);

  /// Blue Dark 800
  static const blueDark800 = Color(0xFF0040C1);

  /// Blue Dark 900
  static const blueDark900 = Color(0xFF00359E);

  /// Green 25
  static const green25 = Color(0xFFF6FEF9);

  /// Green 50
  static const green50 = Color(0xFFEDFCF2);

  /// Green 100
  static const green100 = Color(0xFFD3F8DF);

  /// Green 200
  static const green200 = Color(0xFFAAF0C4);

  /// Green 300
  static const green300 = Color(0xFF73E2A3);

  /// Green 400
  static const green400 = Color(0xFF3CCB7F);

  /// Green 500
  static const green500 = Color(0xFF16B364);

  /// Green 600
  static const green600 = Color(0xFF099250);

  /// Green 700
  static const green700 = Color(0xFF087443);

  /// Green 800
  static const green800 = Color(0xFF095C37);

  /// Green 900
  static const green900 = Color(0xFF084C2E);

  /// Indigo 25
  static const indigo25 = Color(0xFFF5F8FF);

  /// Indigo 50
  static const indigo50 = Color(0xFFEEF4FF);

  /// Indigo 100
  static const indigo100 = Color(0xFFE0EAFF);

  /// Indigo 200
  static const indigo200 = Color(0xFFC7D7FE);

  /// Indigo 300
  static const indigo300 = Color(0xFFA4BCFD);

  /// Indigo 400
  static const indigo400 = Color(0xFF8098F9);

  /// Indigo 500
  static const indigo500 = Color(0xFF6172F3);

  /// Indigo 600
  static const indigo600 = Color(0xFF444CE7);

  /// Indigo 700
  static const indigo700 = Color(0xFF3538CD);

  /// Indigo 800
  static const indigo800 = Color(0xFF2D31A6);

  /// Indigo 900
  static const indigo900 = Color(0xFF2D3282);

  /// Orange 25
  static const orange25 = Color(0xFFFEFAF5);

  /// Orange 50
  static const orange50 = Color(0xFFFEF6EE);

  /// Orange 100
  static const orange100 = Color(0xFFFDEAD7);

  /// Orange 200
  static const orange200 = Color(0xFFF9DBAF);

  /// Orange 300
  static const orange300 = Color(0xFFF7B27A);

  /// Orange 400
  static const orange400 = Color(0xFFF38744);

  /// Orange 500
  static const orange500 = Color(0xFFEF6820);

  /// Orange 600
  static const orange600 = Color(0xFFE04F16);

  /// Orange 700
  static const orange700 = Color(0xFFB93815);

  /// Orange 800
  static const orange800 = Color(0xFF932F19);

  /// Orange 900
  static const orange900 = Color(0xFF772917);

  /// Orange Dark 25
  static const orangeDark25 = Color(0xFFFFF9F5);

  /// Orange Dark 50
  static const orangeDark50 = Color(0xFFFFF4ED);

  /// Orange Dark 100
  static const orangeDark100 = Color(0xFFFFE6D5);

  /// Orange Dark 200
  static const orangeDark200 = Color(0xFFFFD6AE);

  /// Orange Dark 300
  static const orangeDark300 = Color(0xFFFF9C66);

  /// Orange Dark 400
  static const orangeDark400 = Color(0xFFFF692E);

  /// Orange Dark 500
  static const orangeDark500 = Color(0xFFFF4405);

  /// Orange Dark 600
  static const orangeDark600 = Color(0xFFE62E05);

  /// Orange Dark 700
  static const orangeDark700 = Color(0xFFBC1B06);

  /// Orange Dark 800
  static const orangeDark800 = Color(0xFF97180C);

  /// Orange Dark 900
  static const orangeDark900 = Color(0xFF771A0D);

  /// Yellow 25
  static const yellow25 = Color(0xFFFEFDF0);

  /// Yellow 50
  static const yellow50 = Color(0xFFFEFBE8);

  /// Yellow 100
  static const yellow100 = Color(0xFFFEF7C3);

  /// Yellow 200
  static const yellow200 = Color(0xFFFEEE95);

  /// Yellow 300
  static const yellow300 = Color(0xFFFDE272);

  /// Yellow 400
  static const yellow400 = Color(0xFFFAC515);

  /// Yellow 500
  static const yellow500 = Color(0xFFEAAA08);

  /// Yellow 600
  static const yellow600 = Color(0xFFCA8504);

  /// Yellow 700
  static const yellow700 = Color(0xFFA15C07);

  /// Yellow 800
  static const yellow800 = Color(0xFF854A0E);

  /// Yellow 900
  static const yellow900 = Color(0xFF713B12);

  /// Purple 25
  static const purple25 = Color(0xFFFAFAFF);

  /// Purple 50
  static const purple50 = Color(0xFFF4F3FF);

  /// Purple 100
  static const purple100 = Color(0xFFEBE9FE);

  /// Purple 200
  static const purple200 = Color(0xFFD9D6FE);

  /// Purple 300
  static const purple300 = Color(0xFFBDB4FE);

  /// Purple 400
  static const purple400 = Color(0xFF9B8AFB);

  /// Purple 500
  static const purple500 = Color(0xFF7A5AF8);

  /// Purple 600
  static const purple600 = Color(0xFF6938EF);

  /// Purple 700
  static const purple700 = Color(0xFF5925DC);

  /// Purple 800
  static const purple800 = Color(0xFF4A1FB8);

  /// Purple 900
  static const purple900 = Color(0xFF3E1C96);
}
