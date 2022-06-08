import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ColorTransparents on Color {
  /// short cut of [withOpacity]
  ///
  /// value means percent of opacity. so, value has to be int value between
  /// 0 and 100. or value become boundary value.
  Color operator [](int value) {
    if (value > 100) {
      value = 100;
    } else if (value < 0) {
      value = 0;
    }
    return withOpacity(value / 100);
  }
}

extension GetShortCut on GetInterface {
  bool isFindable<T extends GetLifeCycle> () {
    return Get.isPrepared() || Get.isRegistered();
  }
}