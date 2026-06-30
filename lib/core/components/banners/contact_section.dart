part of 'banners.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;
    if (!(_formKey.currentState?.validate() ?? false)) return;

    FocusManager.instance.primaryFocus?.unfocus();
    setState(() => _isSubmitting = true);

    try {
      await ContactFormService.submit(
        email: _emailController.text,
        message: _messageController.text,
      );

      if (!mounted) return;

      _emailController.clear();
      _messageController.clear();
      _formKey.currentState?.reset();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Message sent! I\'ll get back to you soon.',
            style: Styles.text14Regular(textColor: AppColor.textPrimary),
          ),
          backgroundColor: AppColor.surfaceMuted,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } on ContactFormException catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.message,
            style: Styles.text14Regular(textColor: AppColor.textPrimary),
          ),
          backgroundColor: AppColor.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (_) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Something went wrong. Please try again later.',
            style: Styles.text14Regular(textColor: AppColor.textPrimary),
          ),
          backgroundColor: AppColor.error,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 700;
    final contentWidth = isCompact ? width : width * 0.42;

    return Padding(
      padding: Insets.sectionTop(width),
      child: SizedBox(
        width: contentWidth,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Say hello',
                style: Styles.displayHeavy(
                  fontSize: isCompact ? 40 : 52,
                  height: 1,
                ),
              ),
              Spacing.mediumGap,
              const _SectionAccentDivider(),
              Spacing.extraLargeGap,
              PortfolioTextField(
                fieldHeading: 'Your email',
                controller: _emailController,
                variant: PortfolioTextFieldVariant.underline,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                borderColor: AppColor.borderStrong,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Email is required';
                  }
                  if (!value.contains('@')) {
                    return 'Enter a valid email';
                  }
                  return null;
                },
              ),
              Spacing.extraLargeGap,
              PortfolioTextField(
                fieldHeading: 'Message',
                controller: _messageController,
                variant: PortfolioTextFieldVariant.underline,
                maxLines: 4,
                minLines: 4,
                textInputAction: TextInputAction.newline,
                borderColor: AppColor.borderStrong,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Message is required';
                  }
                  return null;
                },
              ),
              Spacing.extraLargeGap,
              PortfolioButton(
                text: 'Send message',
                width: 200,
                height: 48,
                showSpinner: _isSubmitting,
                onPressed: _isSubmitting ? null : _submit,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SectionAccentDivider extends StatelessWidget {
  const _SectionAccentDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomPaint(
          size: const Size(80, 7),
          painter: _TrapezoidAccentPainter(),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: AppColor.primaryHover.withValues(alpha: 0.85),
          ),
        ),
      ],
    );
  }
}

class _TrapezoidAccentPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColor.primaryHover;

    final path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width * 0.15, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width * 0.85, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
