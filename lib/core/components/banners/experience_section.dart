part of 'banners.dart';

class ExperienceSection extends StatefulWidget {
  const ExperienceSection({super.key});

  @override
  State<ExperienceSection> createState() => _ExperienceSectionState();
}

class _ExperienceSectionState extends State<ExperienceSection> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 700;
    final contentWidth = isCompact ? double.infinity : width * 0.62;
    final experiences = PortfolioConfig.experiences;
    final selected = experiences[_selectedIndex];

    return Padding(
      padding: Insets.sectionTop(width),
      child: SizedBox(
        width: contentWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const _ExperienceSectionHeading(),
            Spacing.extraExtraLargeGap,
            if (isCompact) ...[
              _CompanyTabs(
                experiences: experiences,
                selectedIndex: _selectedIndex,
                isCompact: true,
                onSelected: (index) => setState(() => _selectedIndex = index),
              ),
              Spacing.largeGap,
              _ExperienceDetail(
                key: ValueKey(selected.company),
                experience: selected,
              ),
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _CompanyTabs(
                    experiences: experiences,
                    selectedIndex: _selectedIndex,
                    isCompact: false,
                    onSelected: (index) => setState(() => _selectedIndex = index),
                  ),
                  Spacing.extraLargeGap,
                  Expanded(
                    child: _ExperienceDetail(
                      key: ValueKey(selected.company),
                      experience: selected,
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceSectionHeading extends StatelessWidget {
  const _ExperienceSectionHeading();

  @override
  Widget build(BuildContext context) {
    return Text(
      PortfolioConfig.experienceHeading,
      style: Styles.text22Semibold(),
    );
  }
}

class _CompanyTabs extends StatelessWidget {
  const _CompanyTabs({
    required this.experiences,
    required this.selectedIndex,
    required this.isCompact,
    required this.onSelected,
  });

  final List<ExperienceEntry> experiences;
  final int selectedIndex;
  final bool isCompact;
  final ValueChanged<int> onSelected;

  static const double _tabWidth = 180;

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return SizedBox(
        height: 44,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: experiences.length,
          separatorBuilder: (_, _) => Spacing.smallGap,
          itemBuilder: (context, index) {
            return _CompanyTab(
              label: experiences[index].displayTabLabel,
              isSelected: selectedIndex == index,
              isCompact: true,
              onTap: () => onSelected(index),
            );
          },
        ),
      );
    }

    return Container(
      width: _tabWidth,
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColor.border, width: 2),
        ),
      ),
      child: Column(
        children: List.generate(experiences.length, (index) {
          return _CompanyTab(
            label: experiences[index].displayTabLabel,
            isSelected: selectedIndex == index,
            isCompact: false,
            onTap: () => onSelected(index),
          );
        }),
      ),
    );
  }
}

class _CompanyTab extends StatelessWidget {
  const _CompanyTab({
    required this.label,
    required this.isSelected,
    required this.isCompact,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final bool isCompact;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    if (isCompact) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? AppColor.surfaceMuted : AppColor.surface,
              border: Border.all(
                color: isSelected ? AppColor.primaryHover : AppColor.border,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              label,
              style: Styles.text13Medium(
                textColor:
                    isSelected ? AppColor.primaryHover : AppColor.textSecondary,
              ),
            ),
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          decoration: BoxDecoration(
            color: isSelected ? AppColor.surfaceMuted : Colors.transparent,
            border: Border(
              left: BorderSide(
                color: isSelected ? AppColor.primaryHover : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            label,
            style: Styles.text13Medium(
              textColor:
                  isSelected ? AppColor.primaryHover : AppColor.textSecondary,
            ),
          ),
        ),
      ),
    );
  }
}

class _ExperienceDetail extends StatelessWidget {
  const _ExperienceDetail({super.key, required this.experience});

  final ExperienceEntry experience;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: Column(
        key: ValueKey(experience.company),
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '${experience.title} ',
                  style: Styles.text18Medium(),
                ),
                TextSpan(
                  text: '@ ${experience.company}',
                  style: Styles.text18Medium(textColor: AppColor.primaryHover),
                ),
              ],
            ),
          ),
          Spacing.smallGap,
          Text(
            experience.dateRange,
            style: Styles.text13Regular(textColor: AppColor.textSecondary),
          ),
          Spacing.smallGap,
          Text(
            experience.location,
            style: Styles.text13Regular(textColor: AppColor.textTertiary),
          ),
          Spacing.largeGap,
          ...experience.responsibilities.map(
            (item) => _ExperienceBullet(text: item),
          ),
        ],
      ),
    );
  }
}

class _ExperienceBullet extends StatelessWidget {
  const _ExperienceBullet({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Insets.oB16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 4),
            child: _TriangleBullet(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Styles.text14Regular(
                textColor: AppColor.textSecondary,
              ).copyWith(height: 1.6),
            ),
          ),
        ],
      ),
    );
  }
}
