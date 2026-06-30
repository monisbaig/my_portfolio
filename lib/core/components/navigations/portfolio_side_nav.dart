part of 'navigations.dart';

class PortfolioSideNav extends StatelessWidget {
  const PortfolioSideNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.onLogoTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback? onLogoTap;

  static const double width = 100;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Padding(
        padding: Insets.v32,
        child: Column(
          children: [
            PortfolioLogo(onTap: onLogoTap),
            const Spacer(),
            ...List.generate(PortfolioConfig.navItems.length, (index) {
              return Padding(
                padding: Insets.oB28,
                child: _NavItem(
                  label: PortfolioConfig.navItems[index],
                  isActive: selectedIndex == index,
                  onTap: () => onItemSelected(index),
                ),
              );
            }),
            Spacing.mediumLargeGap,
            RotatedBox(
              quarterTurns: 3,
              child: PortfolioButton(
                text: 'Resume',
                width: 88,
                height: 36,
                textStyle: (color) => Styles.text12Bold(textColor: color),
                onPressed: () =>
                    LaunchUrl.openResume(PortfolioConfig.resumeUrl),
              ),
            ),
            const Spacer(),
            const _SocialLinks(),
            Spacing.smallGap,
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColor.primaryHover : AppColor.textSecondary;

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 20 : 0,
              height: 2,
              margin: Insets.oR6,
              color: isActive ? AppColor.primaryHover : Colors.transparent,
            ),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                label,
                style: (isActive
                        ? Styles.text13Semibold
                        : Styles.text13Regular)(textColor: color)
                    .copyWith(letterSpacing: 1.2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialLinks extends StatelessWidget {
  const _SocialLinks();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SocialIcon(
          icon: FontAwesomeIcons.github,
          url: PortfolioConfig.githubUrl,
        ),
        Spacing.mediumLargeGap,
        _SocialIcon(
          icon: FontAwesomeIcons.linkedinIn,
          url: PortfolioConfig.linkedInUrl,
        ),
        Spacing.mediumLargeGap,
        _SocialIcon(
          icon: FontAwesomeIcons.envelope,
          url: PortfolioConfig.emailUrl,
        ),
      ],
    );
  }
}

class _SocialIcon extends StatelessWidget {
  const _SocialIcon({required this.icon, required this.url});

  final FaIconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: Insets.all4,
        child: FaIcon(
          icon,
          size: 16,
          color: AppColor.textSecondary,
        ),
      ),
    );
  }
}
