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

  @override
  void dispose() {
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      FocusManager.instance.primaryFocus?.unfocus();
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
                clipBottomRight: true,
                buttonColor: AppColor.primaryHover,
                hoverColor: AppColor.primary,
                onPressed: _submit,
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
