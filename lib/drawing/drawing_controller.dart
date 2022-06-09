part of drawing;

class DrawingController extends GetxController {

  /// [Get.find]의 shortCut
  static DrawingController? get to {
    if (Get.isFindable<DrawingController>()) {
      return Get.find<DrawingController>();
    }
    return null;
  }

  /// 라인의 끝 모양
  StrokeCap strokeCap = StrokeCap.round;

  /// 라인의 두께
  double strokeWidth = 3;

  /// 선 색상
  Color color = Colors.black[40];

  /// 현재 선택된 메인 패널 아이템의 인덱스
  ControlPanelType? selectedPanelIndex;

  /// 실제로 그려질 라인 목록
  final List<Line> lines = [];

  /// 스케일 제스처 시작시 호출되는 콜백
  void onScaleStart(ScaleStartDetails details) {
    if (details.pointerCount == 1) {
      final initialOffset = details.localFocalPoint;
      lines.add(Line(
        color: color,
        strokeWidth: strokeWidth,
        strokeCap: strokeCap,
        initialPoint: initialOffset
      ));
      update([_DrawingRefreshId.painter]);
    }
  }

  /// 스케일 제스처의 변경 이벤트 콜백
  void onScaleUpdate(ScaleUpdateDetails details) {
    if (details.pointerCount == 1) {
      final last = lines.last;
      last.add(details.localFocalPoint);
      update([_DrawingRefreshId.painter]);
    }
  }

  /// 스케일 제스처 종료 이벤트 콜백
  void onScaleEnd(ScaleEndDetails details) {

  }

  void onTapMainPanelItem(ControlPanelType type) {
    switch (type) {
      case ControlPanelType.color:
        _showColorPicker(
          pickerColor: color,
          onColorChange: (c) {
            color = c;
            update([_DrawingRefreshId.mainPanel]);
          },
        );
        break;
      case ControlPanelType.width:
        _showStrokeWidthSlider(
          value: strokeWidth,
          onChanged: (value) {},
        );
        break;
      case ControlPanelType.capType:
        // TODO: Handle this case.
        break;
    }
  }

}

/// 컨트롤 패널에 들어갈 아이템의 종류
enum ControlPanelType {
  /// 색상
  color,

  /// 굵기
  width,

  /// 끝점 형태
  capType,
}

/// 업데이트를 위해 사용하는 id
enum _DrawingRefreshId {
  /// 실제 canvas가 위치한 부분
  painter,

  /// 주요 메인 패널
  mainPanel,
}