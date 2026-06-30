part of 'features.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.targetSection});

  final String? targetSection;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scrollController = ScrollController();
  final _aboutKey = GlobalKey();
  final _experienceKey = GlobalKey();
  final _workKey = GlobalKey();
  final _contactKey = GlobalKey();

  int _selectedNavIndex = 0;
  bool _isNavigatingToSection = false;

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
      _onScroll();
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
    if (_isNavigatingToSection) return;

    final activeIndex = _activeSectionIndex();
    if (activeIndex != _selectedNavIndex) {
      setState(() => _selectedNavIndex = activeIndex);
    }
  }

  int _activeSectionIndex() {
    const activationOffset = 200.0;
    var activeIndex = 0;

    for (var i = 0; i < _sectionKeys.length; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final box = sectionContext.findRenderObject() as RenderBox?;
      if (box == null || !box.attached) continue;

      final offset = box.localToGlobal(Offset.zero).dy;
      if (offset <= activationOffset) {
        activeIndex = i;
      }
    }

    return activeIndex;
  }

  Future<void> _handleTargetSection(String? section) async {
    if (section == null) return;

    final index = PortfolioConfig.navSectionIds.indexOf(section);
    if (index == -1) return;

    setState(() => _selectedNavIndex = index);
    await scrollToSection(_sectionKeys[index]);
  }

  Future<void> _navigateToSection(int index) async {
    _isNavigatingToSection = true;
    setState(() => _selectedNavIndex = index);
    goToSection(context, PortfolioConfig.navSectionIds[index]);
    await scrollToSection(_sectionKeys[index]);
    _isNavigatingToSection = false;
    _onScroll();
  }

  Future<void> _resetToAbout() async {
    if (_scaffoldKey.currentState?.isEndDrawerOpen ?? false) {
      Navigator.of(context).pop();
    }
    await _navigateToSection(0);
  }

  Future<void> _scrollDown() async {
    final nextIndex = (_selectedNavIndex + 1).clamp(
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
      key: _scaffoldKey,
      backgroundColor: AppColor.scaffold,
      endDrawer: isCompact
          ? PortfolioMobileNav(
              selectedIndex: _selectedNavIndex,
              onItemSelected: _navigateToSection,
              onLogoTap: _resetToAbout,
            )
          : null,
      drawerEnableOpenDragGesture: isCompact,
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
                  onLogoTap: _resetToAbout,
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
                            child: const ExperienceSection(),
                          ),
                          _PageSection(
                            sectionKey: _workKey,
                            minHeight: screenHeight,
                            hasSideNav: !isCompact,
                            child: const WorkSection(),
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
                    if (isCompact) ...[
                      Positioned(
                        left: Insets.compactLogoLeft,
                        top: Insets.compactLogoTop,
                        child: PortfolioLogo(onTap: _resetToAbout),
                      ),
                      Positioned(
                        right: Insets.compactLogoLeft,
                        top: Insets.compactLogoTop,
                        child: PortfolioMobileMenuButton(
                          onPressed: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
                        ),
                      ),
                    ],
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
              opacity: _selectedNavIndex == 0 ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: _selectedNavIndex != 0,
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
