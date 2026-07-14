import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';


class FontSize {
  FontSize._();
  static const double small = 12.0;
  static const double medium = 14.0;
  static const double title = 16.0;
  static const double heading = 18.0;
  static const double extraLarge = 24.0;
  static const double huge = 32.0;
}

class AppRadius {
  AppRadius._();
  static final small = BorderRadius.circular(2).w;
  static final medium = BorderRadius.circular(4).w;
  static final bigMedium = BorderRadius.circular(6).w;
  static final regular = BorderRadius.circular(8).w;
  static final bigRegular = BorderRadius.circular(10).w;
  static final big = BorderRadius.circular(12).w;
  static final huge = BorderRadius.circular(16).w;
  static final superHuge = BorderRadius.circular(24).w;
}

double mediumSize = 16.0;

Widget Function(BuildContext, int) appListSeparator =
    (p0, p1) => const SizedBox(height: 16);

TextStyle appText = GoogleFonts.notoSansKhmer(
  color: AppColors.primaryText,
  fontWeight: FontWeight.normal,
  fontSize: FontSize.medium,
);

void initAppOverlay() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
  ));
}
