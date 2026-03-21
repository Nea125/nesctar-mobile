import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


extension ContextExtension on BuildContext {
  void hideKeyboard() => FocusScope.of(this).unfocus();

  Size get mediaQuerySize => MediaQuery.of(this).size;

  double get mediaQueryWidth => MediaQuery.of(this).size.width;
  double get mediaQueryHeight => MediaQuery.of(this).size.height;

  double get smallSpacing => 4.r;
  double get mediumSpacing => 8.r;
  double get regularSpacing => 16.r;
  double get bigSpacing => 20.r;
  double get hugeSpacing => 26.r;

}

extension AppPadding on BuildContext {
  EdgeInsets get smallGap =>
      EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h);
  EdgeInsets get mediumGap =>
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h);
  EdgeInsets get regularGap =>
      EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h);
  EdgeInsets get bigGap =>
      EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h);
  EdgeInsets get hugeGap =>
      EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h);
}

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(child: this);
  }
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingSmall => EdgeInsets.all(smallSpacing);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumSpacing);
  EdgeInsets get paddingRegular => EdgeInsets.all(regularSpacing);
  EdgeInsets get paddingBig => EdgeInsets.all(bigSpacing);
  EdgeInsets get paddingHuge => EdgeInsets.all(hugeSpacing);
}
