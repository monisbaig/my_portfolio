part of 'decoration.dart';

class AbstractHeroGraphic extends StatefulWidget {
  const AbstractHeroGraphic({super.key});

  @override
  State<AbstractHeroGraphic> createState() => _AbstractHeroGraphicState();
}

class _AbstractHeroGraphicState extends State<AbstractHeroGraphic>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            return CustomPaint(
              size: Size(constraints.maxWidth, constraints.maxHeight),
              painter: _RipplePainter(progress: _controller.value),
            );
          },
        );
      },
    );
  }
}

class _RipplePainter extends CustomPainter {
  _RipplePainter({required this.progress});

  final double progress;

  static const int _rippleCount = 7;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width * 0.5, size.height * 0.52);
    final maxRadius = math.max(size.width, size.height) * 0.75;

    _drawCenterGlow(canvas, center, size);
    _drawRipples(canvas, center, maxRadius);
    _drawEdgeFade(canvas, size);
  }

  void _drawCenterGlow(Canvas canvas, Offset center, Size size) {
    final glowPaint = Paint()
      ..shader = ui.Gradient.radial(
        center,
        size.width * 0.25,
        [
          AppColor.primaryHover.withValues(alpha: 0.12),
          AppColor.primary.withValues(alpha: 0.05),
          AppColor.scaffold.withValues(alpha: 0),
        ],
        [0, 0.5, 1],
      );

    canvas.drawCircle(center, size.width * 0.3, glowPaint);
  }

  void _drawRipples(Canvas canvas, Offset center, double maxRadius) {
    for (var i = 0; i < _rippleCount; i++) {
      final phase = (progress + i / _rippleCount) % 1.0;
      final radius = phase * maxRadius;
      final fade = 1 - phase;

      final strokePaint = Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1 + fade * 2.5
        ..color = AppColor.primaryHover.withValues(alpha: fade * 0.45);

      canvas.drawCircle(center, radius, strokePaint);

      if (fade > 0.15) {
        final innerPaint = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 0.8
          ..color = AppColor.primary.withValues(alpha: fade * 0.15);

        canvas.drawCircle(center, radius * 0.97, innerPaint);
      }
    }
  }

  void _drawEdgeFade(Canvas canvas, Size size) {
    final fadePaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset.zero,
        Offset(size.width * 0.45, 0),
        [
          AppColor.scaffold,
          AppColor.scaffold.withValues(alpha: 0),
        ],
      );

    canvas.drawRect(Offset.zero & size, fadePaint);
  }

  @override
  bool shouldRepaint(covariant _RipplePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
