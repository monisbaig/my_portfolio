part of 'decoration.dart';

class PortfolioLogo extends StatefulWidget {
  const PortfolioLogo({super.key, this.size = 60, this.onTap});

  final double size;
  final VoidCallback? onTap;

  @override
  State<PortfolioLogo> createState() => _PortfolioLogoState();
}

class _PortfolioLogoState extends State<PortfolioLogo> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final size = widget.size;
    final mColor =
        _isHovered ? AppColor.primaryHover : AppColor.textPrimary;
    final bColor =
        _isHovered ? AppColor.textPrimary : AppColor.primaryHover;

    return GestureDetector(
      onTap: widget.onTap,
      behavior: HitTestBehavior.opaque,
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        cursor: SystemMouseCursors.click,
        child: SizedBox(
          width: size * 1.12,
          height: size,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                top: size * 0.02,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  style: Styles.logoMonogram(
                    fontSize: size * 0.7,
                    textColor: mColor,
                  ),
                  child: const Text('M'),
                ),
              ),
              Positioned(
                left: size * 0.3,
                top: size * 0.3,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOut,
                  style: Styles.logoMonogram(
                    fontSize: size * 0.7,
                    textColor: bColor,
                  ),
                  child: const Text('B'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
