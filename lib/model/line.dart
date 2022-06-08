import 'dart:ui';

class Line {
  Line({
    required this.color,
    required this.strokeWidth,
    required this.strokeCap,
    Offset? initialPoint,
  }) {
    if (initialPoint != null) {
      points.add(initialPoint);
    }
  }

  /// 라인 색상
  final Color color;

  /// 라인 두께
  final double strokeWidth;

  /// 라인의 끝 부분의 형태
  final StrokeCap strokeCap;

  /// 라인 연결점
  final List<Offset> points = [];

  void add(Offset offset) {
    points.add(offset);
  }

  /// 라인을 그릴 때 사용하는 [Paint] 객체
  Paint get paint {
    return Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
  }

  /// 라인을 그려내는 함수
  void draw(Canvas canvas, Size size) {
    if (points.length == 1) {
      _drawVertices(canvas);
    } else if (points.length > 2) {
      _drawStraightLine(canvas, size);
    }
  }

  /// ### [points]의 길이가 1인 경우에 점을 그린다.
  /// 단, 이 경우에, [strokeCap]이 어떤 건지와는 무관하게 원형점을 그려내기 위해서
  /// [StrokeCap.round]로 고정한다.
  void _drawVertices(Canvas canvas) {
    canvas.drawPoints(
      PointMode.points,
      points,
      paint..strokeCap = StrokeCap.round,
    );
  }

  /// ### [points]의 길이가 2보다 큰 경우에 라인을 그린다.
  void _drawStraightLine(Canvas canvas, Size size) {
    final path = Path();
    for (int i = 0; i < points.length; i ++) {
      final p = _clipSize(points[i], size);
      if (i == 0) {
        path.moveTo(p.dx, p.dy);
      }
      else {
        path.lineTo(p.dx, p.dy);
      }
    }
    canvas.drawPath(path, paint);
  }

  Offset _clipSize(Offset offset, Size size) {
    double x = offset.dx < 0 ? 0 : offset.dx;
    x = x > size.width ? size.width : x;
    double y = offset.dy < 0 ? 0 : offset.dy;
    y = y > size.height ? size.height : y;
    return Offset(x, y);
  }
}