part of 'inputs.dart';

enum PortfolioTextFieldVariant { filled, underline }

class PortfolioTextField extends StatefulWidget {
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final int? maxLength;
  final Widget? prefix;
  final Widget? suffix;
  final String? hintText;
  final bool obscureText;
  final int? errorMaxLines;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final Color? textColor;
  final String? initialValue;
  final double? borderRadius;
  final TextStyle? hintStyle;
  final FocusNode? focusNode;
  final bool showPasswordToggle;
  final EdgeInsets? contentPadding;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Function()? onEditingComplete;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Color borderColor;
  final Color fillColor;
  final String? fieldHeading;
  final bool autofocus;
  final bool expands;
  final PortfolioTextFieldVariant variant;

  const PortfolioTextField({
    super.key,
    this.onTap,
    this.prefix,
    this.suffix,
    this.hintText,
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
    this.focusNode,
    this.hintStyle,
    this.onChanged,
    this.validator,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.initialValue,
    this.borderRadius,
    this.keyboardType,
    this.errorMaxLines,
    this.enabled = true,
    this.contentPadding,
    this.inputFormatters,
    this.readOnly = false,
    this.expands = false,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.obscureText = false,
    this.showPasswordToggle = false,
    this.textAlign = TextAlign.start,
    this.textColor = AppColor.textSecondary,
    this.textInputAction = TextInputAction.go,
    this.borderColor = AppColor.border,
    this.fillColor = AppColor.surface,
    this.fieldHeading,
    this.autofocus = false,
    this.variant = PortfolioTextFieldVariant.filled,
  });

  @override
  State<PortfolioTextField> createState() => _PortfolioTextFieldState();
}

class _PortfolioTextFieldState extends State<PortfolioTextField> {
  bool _obscureText = false;

  bool get _isUnderline => widget.variant == PortfolioTextFieldVariant.underline;

  @override
  void initState() {
    if (widget.showPasswordToggle || widget.obscureText) {
      _obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: widget.fieldHeading != null ? Spacing.fieldLabel : 0,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (widget.fieldHeading != null)
          Text(
            widget.fieldHeading!,
            style: _isUnderline
                ? Styles.text14Regular(textColor: AppColor.textSecondary)
                : Styles.text14Regular(),
          ),
        TextFormField(
          onTap: widget.onTap,
          enabled: widget.enabled,
          maxLines: widget.maxLines,
          minLines: widget.minLines,
          readOnly: widget.readOnly,
          obscureText: _obscureText,
          cursorColor: AppColor.primaryHover,
          textAlign: widget.textAlign,
          maxLength: widget.maxLength,
          focusNode: widget.focusNode,
          validator: widget.validator,
          expands: widget.expands,
          onChanged: widget.onChanged,
          controller: widget.controller,
          initialValue: widget.initialValue,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          onEditingComplete:
              widget.onEditingComplete ??
              () {
                if (widget.textInputAction?.name == 'go' ||
                    widget.textInputAction?.name == 'next') {
                  FocusManager.instance.primaryFocus?.nextFocus();
                } else {
                  FocusManager.instance.primaryFocus?.unfocus();
                }
              },
          autofocus: widget.autofocus,
          style: Styles.text14Medium(
            textColor: widget.textColor ?? AppColor.textPrimary,
          ),
          decoration: InputDecoration(
            prefix: widget.prefix,
            suffix: widget.suffix,
            counterText: '',
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.showPasswordToggle
                ? IconButton(
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: AppColor.textSecondary,
                    ),
                  )
                : widget.suffixIcon,
            hintText: widget.hintText,
            errorMaxLines: widget.errorMaxLines,
            contentPadding: widget.contentPadding ??
                (_isUnderline ? Insets.oB10 : null),
            errorStyle: Styles.text12Regular(textColor: AppColor.error),
            hintStyle:
                widget.hintStyle ??
                Styles.text14Medium(textColor: AppColor.textTertiary),
            enabledBorder: _isUnderline
                ? Styles.underlineBorder(widget.borderColor)
                : Styles.inputBorder(widget.borderColor),
            disabledBorder: _isUnderline
                ? Styles.underlineBorder(widget.borderColor)
                : Styles.inputBorder(widget.borderColor),
            errorBorder: _isUnderline
                ? Styles.underlineBorder(AppColor.error)
                : Styles.inputBorder(AppColor.error),
            focusedBorder: _isUnderline
                ? Styles.underlineBorder(AppColor.primaryHover, width: 2)
                : Styles.inputBorder(AppColor.primaryHover),
            focusedErrorBorder: _isUnderline
                ? Styles.underlineBorder(AppColor.error, width: 2)
                : Styles.inputBorder(AppColor.error),
            fillColor: _isUnderline ? Colors.transparent : widget.fillColor,
            filled: !_isUnderline,
          ),
        ),
      ],
    );
  }
}
