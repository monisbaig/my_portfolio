part of 'banners.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final titleSize = _titleSize(width) * 0.82;
    final secondarySize = titleSize * 0.92;
    final contentWidth = width < 700 ? width - 48 : width * 0.58;

    return Padding(
      padding: Insets.sectionTop(width),
      child: SizedBox(
        width: contentWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                  PortfolioConfig.name,
                  style: Styles.heroName(),
                )
                .animate()
                .fadeIn(duration: 600.ms, delay: 200.ms)
                .slideY(begin: 0.2, end: 0),
            Spacing.largeMediumGap,
            _HighlightedTitle(
              text: PortfolioConfig.roleHighlight,
              fontSize: titleSize,
            )
                .animate()
                .fadeIn(duration: 700.ms, delay: 350.ms)
                .slideX(begin: -0.08, end: 0),
            Spacing.smallGap,
            Text(
                  PortfolioConfig.roleSecondary,
                  style: Styles.displayHeavy(
                    fontSize: secondarySize,
                    height: 1,
                  ),
                )
                .animate()
                .fadeIn(duration: 700.ms, delay: 500.ms)
                .slideY(begin: 0.15, end: 0),
            Spacing.extraLargeGap,
            Text(
                  PortfolioConfig.introduction,
                  style: Styles.text16Regular(
                    textColor: AppColor.textSecondary,
                  ).copyWith(height: 1.6),
                )
                .animate()
                .fadeIn(duration: 700.ms, delay: 650.ms)
                .slideY(begin: 0.1, end: 0),
            Spacing.extraLargeGap,
            Text(
              PortfolioConfig.skillsHeading,
              style: Styles.text16Semibold(textColor: AppColor.textPrimary),
            ),
            Spacing.mediumGap,
            _SkillsList(width: contentWidth),
          ],
        ),
      ),
    );
  }

  double _titleSize(double width) {
    if (width > 1400) return 108;
    if (width > 1100) return 92;
    if (width > 800) return 72;
    if (width > 600) return 52;
    return 40;
  }
}

class _SkillsList extends StatelessWidget {
  const _SkillsList({required this.width});

  final double width;

  int _columnCount(double width) {
    if (width > 700) return 3;
    if (width > 480) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final skills = PortfolioConfig.skills;
    final columnCount = _columnCount(width);
    final itemsPerColumn = (skills.length / columnCount).ceil();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(columnCount, (columnIndex) {
        final start = columnIndex * itemsPerColumn;
        final end = (start + itemsPerColumn).clamp(0, skills.length);
        final columnSkills = skills.sublist(start, end);

        return Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: columnSkills
                .map((skill) => _SkillItem(label: skill))
                .toList(),
          ),
        );
      }),
    );
  }
}

class _SkillItem extends StatelessWidget {
  const _SkillItem({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.oB12,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const _TriangleBullet(),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              label,
              style: Styles.text14Regular(textColor: AppColor.textSecondary),
            ),
          ),
        ],
      ),
    );
  }
}

class _TriangleBullet extends StatelessWidget {
  const _TriangleBullet();

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(9, 10),
      painter: _TriangleBulletPainter(),
    );
  }
}

class _TriangleBulletPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColor.primaryHover
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.4
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _HighlightedTitle extends StatelessWidget {
  const _HighlightedTitle({
    required this.text,
    required this.fontSize,
  });

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final textStyle = Styles.displayHeavy(
      fontSize: fontSize,
      textColor: AppColor.onPrimary,
      height: 0.95,
    );

    return Container(
      padding: Insets.highlightTitle(fontSize),
      color: AppColor.primaryHover,
      child: Text(text, style: textStyle),
    );
  }
}
