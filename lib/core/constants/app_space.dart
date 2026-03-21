import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

///by default  12
class AppSpace extends SizedBox {
  final double? x;
  final double? y;

  ///by default 16
  AppSpace.x({
    super.key,
    this.x,
    this.y,
  }) : super(width: x?.w ?? 16.w);

  ///by default  16
  AppSpace.y({
    super.key,
    this.y,
    this.x,
  }) : super(height: y?.h ?? 16.h);
}
