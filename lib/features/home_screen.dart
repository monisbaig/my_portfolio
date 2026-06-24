part of 'features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.targetSection});

  final String? targetSection;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _workKey = GlobalKey();
  final _contactKey = GlobalKey();

  int _selectedNavIndex = 0;
  int _visibleSectionIndex = 0;

  List<GlobalKey> get _sectionKeys => [
    _aboutKey,
    _experienceKey,
    _workKey,
    _contactKey,
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _handleTargetSection(widget.targetSection);
    });
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.targetSection != widget.targetSection) {
      _handleTargetSection(widget.targetSection);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final viewportHeight = MediaQuery.sizeOf(context).height;
    var activeIndex = 0;

    for (var i = 0; i < _sectionKeys.length; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final box = sectionContext.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;

      final offset = box.localToGlobal(Offset.zero).dy;
      if (offset <= viewportHeight * 0.45) {
        activeIndex = i;
      }
    }

    if (activeIndex != _visibleSectionIndex) {
      setState(() => _visibleSectionIndex = activeIndex);
    }
  }

  Future<void> _handleTargetSection(String? section) async {
    if (section == null) return;

    final index = PortfolioConfig.navSectionIds.indexOf(section);
    if (index == -1) return;

    setState(() => _selectedNavIndex = index);
    await scrollToSection(_sectionKeys[index]);
  }

  Future<void> _navigateToSection(int index) async {
    setState(() => _selectedNavIndex = index);
    goToSection(context, PortfolioConfig.navSectionIds[index]);
    await scrollToSection(_sectionKeys[index]);
  }

  Future<void> _scrollDown() async {
    final nextIndex = (_visibleSectionIndex + 1).clamp(
      0,
      _sectionKeys.length - 1,
    );
    await _navigateToSection(nextIndex);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final isCompact = screenWidth < 700;

    return Scaffold(
      backgroundColor: AppColor.scaffold,
      body: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            height: screenHeight,
            width: screenWidth * 0.5,
            child: const AbstractHeroGraphic(),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (!isCompact)
                PortfolioSideNav(
                  selectedIndex: _selectedNavIndex,
                  onItemSelected: _navigateToSection,
                ),
              Expanded(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SingleChildScrollView(
                      controller: _scrollController,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _PageSection(
                            sectionKey: _aboutKey,
                            minHeight: screenHeight,
                            hasSideNav: !isCompact,
                            child: const Align(
                              alignment: Alignment.centerLeft,
                              child: HeroSection(),
                            ),
                          ),
                          _PageSection(
                            sectionKey: _experienceKey,
                            minHeight: screenHeight,
                            hasSideNav: !isCompact,
                            child: _PlaceholderSection(
                              title: 'Experience',
                            ),
                          ),
                          _PageSection(
                            sectionKey: _workKey,
                            minHeight: screenHeight,
                            hasSideNav: !isCompact,
                            child: _PlaceholderSection(title: 'Work'),
                          ),
                          _PageSection(
                            sectionKey: _contactKey,
                            minHeight: screenHeight,
                            hasSideNav: !isCompact,
                            child: const ContactSection(),
                          ),
                          PortfolioFooter(hasSideNav: !isCompact),
                        ],
                      ),
                    ),
                    if (isCompact)
                      const Positioned(
                        left: Insets.compactLogoLeft,
                        top: Insets.compactLogoTop,
                        child: PortfolioLogo(),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: Insets.scrollIndicatorBottom,
            child: AnimatedOpacity(
              opacity: _visibleSectionIndex == 0 ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: _visibleSectionIndex != 0,
                child: ScrollIndicator(onTap: _scrollDown),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageSection extends StatelessWidget {
  const _PageSection({
    required this.sectionKey,
    required this.minHeight,
    required this.child,
    this.hasSideNav = false,
  });

  final GlobalKey sectionKey;
  final double minHeight;
  final Widget child;
  final bool hasSideNav;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Container(
      key: sectionKey,
      constraints: BoxConstraints(minHeight: minHeight),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      padding: Insets.sectionBody(width, hasSideNav: hasSideNav),
      child: child,
    );
  }
}

class _PlaceholderSection extends StatelessWidget {
  const _PlaceholderSection({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Styles.displayHeavy(fontSize: 48, height: 1),
    );
  }
}
