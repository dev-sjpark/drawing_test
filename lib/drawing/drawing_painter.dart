part of drawing;

/// ### 캔버스를 통해서 라인을 그려내는 패인터
class _DrawingPainter extends CustomPainter {
  _DrawingPainter({required this.lines});

  final List<Line> lines;

  @override
  void paint(Canvas canvas, Size size) {
    for (var line in lines) {
      line.draw(canvas, size);
    }
  }

  @override
  bool shouldRepaint(_DrawingPainter oldDelegate) => true;
}