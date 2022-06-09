part of drawing;

/// 색상 선택하는 다이얼로그
void _showColorPicker({
  required Color pickerColor,
  required void Function(Color) onColorChange,
}) {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),

            // palette
            ColorPicker(
              pickerColor: pickerColor,
              onColorChanged: onColorChange,
              enableAlpha: true,
              labelTypes: const [
                ColorLabelType.hsl,
                ColorLabelType.rgb,
                ColorLabelType.hex,
              ],
              displayThumbColor: true,
              paletteType: PaletteType.hsl,
            ),

            // 확인 버튼
            Center(
              child: GestureDetector(
                onTap: () {
                  Get.until((route) => !(Get.isDialogOpen ?? false));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(
                      color: Colors.black[60],
                    ),
                  ),
                  child: Text(
                    '확인',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black[80],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierColor: Colors.transparent,
    barrierDismissible: false,
  );
}

/// 라인의 두께를 지정하는 슬라이더를 표시하는 다이얼로그
void _showStrokeWidthSlider({
  required double value,
  required void Function(double) onChanged,
}) {
  Get.dialog(
    Dialog(
      insetPadding: const EdgeInsets.all(24),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Slider(
              value: value,
              onChanged: onChanged,
              min: 1.0,
            ),

            GestureDetector(
              onTap: () {
                Get.until((route) => !(Get.isDialogOpen ?? false));
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                    color: Colors.black[60],
                  ),
                ),
                child: Text(
                  '확인',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black[80],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    barrierColor: Colors.transparent,
    barrierDismissible: false,
  );
}