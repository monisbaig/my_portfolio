part of 'buttons.dart';

class PortfolioButton extends StatefulWidget {
  const PortfolioButton({
    super.key,
    required this.text,
    this.onPressed,
    this.width = double.infinity,
    this.height = Sizes.buttonHeight,
    this.showSpinner = false,
    this.buttonColor = AppColor.primary,
    this.hoverColor = AppColor.primaryHover,
    this.textColor = AppColor.onPrimary,
    this.showBorder = false,
    this.icon,
    this.borderRadius = Sizes.buttonBorderRadius,
    this.textStyle,
    this.clipBottomRight = false,
  });

  final String text;
  final VoidCallback? onPressed;
  final double width;
  final double height;
  final bool showSpinner;
  final Color buttonColor;
  final Color hoverColor;
  final Color textColor;
  final bool showBorder;
  final Widget? icon;
  final double borderRadius;
  final TextStyle Function(Color textColor)? textStyle;
  final bool clipBottomRight;

  @override
  State<PortfolioButton> createState() => _PortfolioButtonState();
}

class _PortfolioButtonState extends State<PortfolioButton> {
  bool _isHovered = false;

  bool get _isEnabled => widget.onPressed != null && !widget.showSpinner;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = !_isEnabled
        ? AppColor.primaryDisabled
        : _isHovered
        ? widget.hoverColor
        : widget.buttonColor;

    final labelStyle =
        widget.textStyle?.call(widget.textColor) ??
        Styles.text15Bold(textColor: widget.textColor);

    final button = AnimatedScale(
      scale: _isHovered && _isEnabled ? 1.04 : 1,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        width: widget.width == double.infinity ? null : widget.width,
        height: widget.height,
        padding: Insets.hv1410,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: widget.clipBottomRight
              ? null
              : BorderRadius.circular(widget.borderRadius),
          border: widget.showBorder
              ? Border.all(color: AppColor.border, width: Sizes.borderWidth)
              : widget.clipBottomRight
              ? null
              : Border.all(
                  color: _isHovered && _isEnabled
                      ? widget.hoverColor
                      : widget.buttonColor.withValues(alpha: 0.6),
                  width: Sizes.borderWidth,
                ),
          boxShadow: _isHovered && _isEnabled
              ? [
                  BoxShadow(
                    color: widget.hoverColor.withValues(alpha: 0.35),
                    blurRadius: 16,
                    spreadRadius: 1,
                  ),
                ]
              : [],
        ),
        child: Center(
          child: widget.showSpinner
              ? SizedBox(
                  width: Sizes.buttonLoaderWidth,
                  height: Sizes.buttonLoaderHeight,
                  child: PortfolioIndicator(color: widget.textColor),
                )
              : widget.icon != null
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: Spacing.iconText,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    widget.icon!,
                    Flexible(
                      child: Text(
                        widget.text,
                        overflow: TextOverflow.ellipsis,
                        style: labelStyle,
                      ),
                    ),
                  ],
                )
              : Text(
                  widget.text,
                  overflow: TextOverflow.ellipsis,
                  style: labelStyle,
                ),
        ),
      ),
    );

    return MouseRegion(
      onEnter: _isEnabled ? (_) => setState(() => _isHovered = true) : null,
      onExit: _isEnabled ? (_) => setState(() => _isHovered = false) : null,
      cursor: _isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
      child: GestureDetector(
        onTap: widget.showSpinner ? null : widget.onPressed,
        child: widget.width == double.infinity
            ? SizedBox(width: double.infinity, child: button)
            : button,
      ),
    );
  }
}
