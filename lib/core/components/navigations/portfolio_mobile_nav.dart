part of 'navigations.dart';

class PortfolioMobileNav extends StatelessWidget {
  const PortfolioMobileNav({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.onLogoTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final VoidCallback? onLogoTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.scaffold,
      child: SafeArea(
        child: Padding(
          padding: Insets.hv20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PortfolioLogo(
                size: 48,
                onTap: () {
                  Navigator.of(context).pop();
                  onLogoTap?.call();
                },
              ),
              Spacing.extraExtraLargeGap,
              ...List.generate(PortfolioConfig.navItems.length, (index) {
                return Padding(
                  padding: Insets.oB16,
                  child: _MobileNavItem(
                    label: PortfolioConfig.navItems[index],
                    isActive: selectedIndex == index,
                    onTap: () {
                      Navigator.of(context).pop();
                      onItemSelected(index);
                    },
                  ),
                );
              }),
              Spacing.largeGap,
              PortfolioButton(
                text: 'Resume',
                width: 120,
                height: 40,
                textStyle: (color) => Styles.text12Bold(textColor: color),
                onPressed: () =>
                    LaunchUrl.openResume(PortfolioConfig.resumeUrl),
              ),
              const Spacer(),
              const _MobileSocialLinks(),
              Spacing.mediumGap,
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioMobileMenuButton extends StatelessWidget {
  const PortfolioMobileMenuButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(4),
        child: Padding(
          padding: Insets.all8,
          child: FaIcon(
            FontAwesomeIcons.barsStaggered,
            size: 28,
            color: AppColor.primaryHover,
          ),
        ),
      ),
    );
  }
}

class _MobileNavItem extends StatelessWidget {
  const _MobileNavItem({
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

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: isActive
                ? AppColor.surfaceMuted
                : Colors.transparent,
            border: Border(
              left: BorderSide(
                color: isActive ? AppColor.primaryHover : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: (isActive ? Styles.text16Semibold : Styles.text16Regular)(
              textColor: color,
            ),
          ),
        ),
      ),
    );
  }
}

class _MobileSocialLinks extends StatelessWidget {
  const _MobileSocialLinks();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _MobileSocialIcon(
          icon: FontAwesomeIcons.github,
          url: PortfolioConfig.githubUrl,
        ),
        Spacing.largeGap,
        _MobileSocialIcon(
          icon: FontAwesomeIcons.linkedinIn,
          url: PortfolioConfig.linkedInUrl,
        ),
        Spacing.largeGap,
        _MobileSocialIcon(
          icon: FontAwesomeIcons.envelope,
          url: PortfolioConfig.emailUrl,
        ),
      ],
    );
  }
}

class _MobileSocialIcon extends StatelessWidget {
  const _MobileSocialIcon({required this.icon, required this.url});

  final FaIconData icon;
  final String url;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication),
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: Insets.all8,
        child: FaIcon(
          icon,
          size: 20,
          color: AppColor.textSecondary,
        ),
      ),
    );
  }
}
