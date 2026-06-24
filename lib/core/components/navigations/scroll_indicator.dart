part of 'navigations.dart';

class ScrollIndicator extends StatelessWidget {
  const ScrollIndicator({super.key, this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Center(
        child:
            Container(
                  width: 26,
                  height: 42,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColor.textSecondary.withValues(alpha: 0.6),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 3,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColor.textSecondary.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                  ),
                )
                .animate(onPlay: (controller) => controller.repeat())
                .moveY(
                  begin: -2,
                  end: 4,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                )
                .then()
                .moveY(
                  begin: 4,
                  end: -2,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                ),
      ),
    );
  }
}
