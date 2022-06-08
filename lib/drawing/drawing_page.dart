library drawing;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../extensions.dart';
import '../model/line.dart';

part './drawing_painter.dart';
part './drawing_controller.dart';
part './control_panel.dart';

class DrawingPage extends GetView<DrawingController> {
  const DrawingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        endDrawerEnableOpenDragGesture: false,
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onScaleStart: controller.onScaleStart,
                onScaleUpdate: controller.onScaleUpdate,
                onScaleEnd: controller.onScaleEnd,
                child: GetBuilder<DrawingController>(
                  id: _DrawingRefreshId.painter,
                  builder: (controller) {
                    return CustomPaint(
                      foregroundPainter: _DrawingPainter(
                        lines: controller.lines,
                      ),
                      child: Container(color: Colors.transparent,),
                    );
                  },
                ),
              ),

              _backBtn(context),
            ],
          ),
        ),
      ),
    );
  }

  /// 페이지에 사용되는 뒤로가기 버튼
  Widget _backBtn(BuildContext context) => Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black[50],
      ),
    ),
  );
}
