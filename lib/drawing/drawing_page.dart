library drawing;

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SafeArea(
                bottom: false,
                child: Stack(
                  children: [
                    _canvas,

                    _backBtn,
                  ],
                ),
              ),
            ),

            _controlPanel,
          ],
        ),
      ),
    );
  }

  /// 그림을 그릴 도화지 부분
  Widget get _canvas => GestureDetector(
    onScaleStart: controller.onScaleStart,
    onScaleUpdate: controller.onScaleUpdate,
    onScaleEnd: controller.onScaleEnd,
    child: GetBuilder<DrawingController>(
      id: _DrawingRefreshId.painter,
      builder: (controller) {
        return CustomPaint(
          isComplex: true,
          willChange: true,
          foregroundPainter: _DrawingPainter(
            lines: controller.lines,
          ),
          child: Container(color: Colors.transparent,),
        );
      },
    ),
  );

  /// 페이지에 사용되는 뒤로가기 버튼
  Widget get _backBtn => Align(
    alignment: Alignment.topLeft,
    child: IconButton(
      onPressed: () => Get.back(),
      icon: Icon(
        Icons.arrow_back_ios_new,
        color: Colors.black[50],
      ),
    ),
  );

  /// 컨트롤 패널
  Widget get _controlPanel => Container(
    decoration: BoxDecoration(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      color: Colors.white,
      boxShadow: [BoxShadow(
        color: Colors.black[20],
        blurRadius: 5,
      )]
    ),
    padding: EdgeInsets.fromLTRB(
      24, 12, 24, Get.mediaQuery.viewPadding.bottom + 12,
    ),
    child: GetBuilder<DrawingController>(
      id: _DrawingRefreshId.mainPanel,
      builder: (controller) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => controller.onTapMainPanelItem(ControlPanelType.color),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: controller.color,
                borderRadius: BorderRadius.circular(40),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
