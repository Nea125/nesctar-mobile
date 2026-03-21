import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nestar_mobile/core/constants/app_size.dart';
import 'package:nestar_mobile/core/constants/app_colors.dart';

class AppText extends Text {
  final Color? color;
  final FontWeight fontWeight;
  final double fontSize;
  final TextOverflow? textOverflow;
  final int? maxLine;
  final TextAlign? align;
  final TextDecoration? decoration;

  AppText.heading(super.data,
      {super.key,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.bold,
      this.fontSize = FontSize.heading,
      this.maxLine,
      this.textOverflow,
      this.decoration,
      this.align})
      : super(
            textAlign: align ?? TextAlign.left,
            maxLines: maxLine,
            overflow: textOverflow,
            style: GoogleFonts.notoSansKhmer(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              decoration: decoration,
              decorationColor: color,
            ));

  AppText.title(super.data,
      {super.key,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.w700,
      this.fontSize = FontSize.title,
      this.maxLine,
      this.textOverflow,
      this.decoration,
      this.align})
      : super(
            textAlign: align ?? TextAlign.left,
            maxLines: maxLine,
            overflow: textOverflow,
            style: GoogleFonts.notoSansKhmer(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              decoration: decoration,
              decorationColor: color,
            ));

  AppText.medium(super.data,
      {super.key,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.w400,
      this.fontSize = FontSize.medium,
      this.maxLine,
      this.textOverflow,
      this.decoration,
      this.align})
      : super(
            textAlign: align ?? TextAlign.left,
            maxLines: maxLine,
            overflow: textOverflow,
            style: GoogleFonts.notoSansKhmer(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
              decoration: decoration,
              decorationColor: color,
            ));

  AppText.small(super.data,
      {super.key,
      this.color = AppColors.primaryText,
      this.fontWeight = FontWeight.w400,
      this.fontSize = FontSize.small,
      this.maxLine,
      this.textOverflow,
      this.decoration,
      this.align})
      : super(
          textAlign: align ?? TextAlign.start,
          maxLines: maxLine,
          overflow: textOverflow,
          style: GoogleFonts.notoSansKhmer(
            color: color,
            fontWeight: fontWeight,
            fontSize: fontSize,
            decoration: decoration,
            decorationColor: color,
          ),
        );
}
