part of 'banners.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key, this.hasSideNav = false});

  final bool hasSideNav;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: Insets.footer(width, hasSideNav: hasSideNav),
      child: const SizedBox(
        width: double.infinity,
        child: Center(child: _FooterText()),
      ),
    );
  }
}

class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: Styles.text14Regular(textColor: AppColor.textSecondary),
        children: [
          const TextSpan(text: '© 2026 Monis Baig. '),
          TextSpan(
            text: 'Developed with Flutter Web',
            style: Styles.text14Regular(
              textColor: AppColor.textSecondary,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }
}
