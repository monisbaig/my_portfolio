part of 'banners.dart';

class WorkSection extends StatefulWidget {
  const WorkSection({super.key});

  @override
  State<WorkSection> createState() => _WorkSectionState();
}

class _WorkSectionState extends State<WorkSection> {
  late int _visibleCount = PortfolioConfig.workInitialVisibleCount;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final projects = PortfolioConfig.projects;
    final visibleProjects = projects.take(_visibleCount).toList();
    final hasMore = _visibleCount < projects.length;

    return Padding(
      padding: Insets.sectionTop(width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _WorkSectionHeading(),
          Spacing.extraExtraLargeGap,
          _ProjectGrid(projects: visibleProjects),
          if (hasMore) ...[
            Spacing.extraExtraLargeGap,
            Center(
              child: PortfolioButton(
                text: 'Show More',
                width: 148,
                height: 48,
                textStyle: (color) => Styles.text13Medium(textColor: color),
                onPressed: () => setState(() => _visibleCount = projects.length),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _WorkSectionHeading extends StatelessWidget {
  const _WorkSectionHeading();

  @override
  Widget build(BuildContext context) {
    return Text(
      PortfolioConfig.workHeading,
      style: Styles.text22Semibold(),
    );
  }
}

class _ProjectGrid extends StatelessWidget {
  const _ProjectGrid({required this.projects});

  final List<ProjectEntry> projects;

  int _columnCount(double width) {
    if (width > 1000) return 3;
    if (width > 640) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final columnCount = _columnCount(width);
    const gap = 16.0;

    return LayoutBuilder(
      builder: (context, constraints) {
        final itemWidth =
            (constraints.maxWidth - (gap * (columnCount - 1))) / columnCount;

        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: projects
              .map(
                (project) => SizedBox(
                  width: itemWidth,
                  child: _ProjectCard(project: project),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

class _ProjectCard extends StatefulWidget {
  const _ProjectCard({required this.project});

  final ProjectEntry project;

  @override
  State<_ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<_ProjectCard> {
  bool _isHovered = false;

  Future<void> _openExternalLink() async {
    final url = widget.project.externalUrl;
    if (url == null) return;

    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final hasLink = project.externalUrl != null;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
        height: 340,
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: _isHovered ? AppColor.surfaceMuted : AppColor.surface,
          borderRadius: BorderRadius.circular(4),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: AppColor.primaryHover.withValues(alpha: 0.08),
                    blurRadius: 24,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.folder_outlined,
                  size: 40,
                  color: AppColor.primaryHover,
                ),
                if (hasLink)
                  _ProjectLinkIcon(
                    isHovered: _isHovered,
                    onTap: _openExternalLink,
                  ),
              ],
            ),
            Spacing.largeGap,
            Text(
              project.title,
              style: Styles.text18Medium(
                textColor: _isHovered
                    ? AppColor.primaryHover
                    : AppColor.textPrimary,
              ),
            ),
            Spacing.mediumGap,
            Expanded(
              child: Text(
                project.description,
                style: Styles.text14Regular(
                  textColor: AppColor.textSecondary,
                ).copyWith(height: 1.6),
              ),
            ),
            Spacing.largeGap,
            Wrap(
              spacing: 16,
              runSpacing: 8,
              children: project.technologies
                  .map((tech) => Text(tech, style: _techStyle))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle get _techStyle => Styles.text12Regular(
    textColor: AppColor.textSecondary,
  ).copyWith(letterSpacing: 0.2);
}

class _ProjectLinkIcon extends StatefulWidget {
  const _ProjectLinkIcon({
    required this.isHovered,
    required this.onTap,
  });

  final bool isHovered;
  final VoidCallback onTap;

  @override
  State<_ProjectLinkIcon> createState() => _ProjectLinkIconState();
}

class _ProjectLinkIconState extends State<_ProjectLinkIcon> {
  bool _isIconHovered = false;

  @override
  Widget build(BuildContext context) {
    final color = _isIconHovered || widget.isHovered
        ? AppColor.primaryHover
        : AppColor.textSecondary;

    return MouseRegion(
      onEnter: (_) => setState(() => _isIconHovered = true),
      onExit: (_) => setState(() => _isIconHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Icon(Icons.open_in_new, size: 20, color: color),
      ),
    );
  }
}
