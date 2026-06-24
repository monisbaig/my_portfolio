part of 'util.dart';

void goToSection(BuildContext context, String section) {
  context.go('/$section');
}

Future<void> scrollToSection(GlobalKey key) async {
  final targetContext = key.currentContext;
  if (targetContext == null) return;

  await Scrollable.ensureVisible(
    targetContext,
    duration: const Duration(milliseconds: 900),
    curve: Curves.easeInOut,
    alignment: 0.08,
  );
}