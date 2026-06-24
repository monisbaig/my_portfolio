part of 'decoration.dart';

class PortfolioIndicator extends StatelessWidget {
  final Color? color;
  final double? strokeWidth;

  const PortfolioIndicator({super.key, this.color, this.strokeWidth});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        strokeWidth: strokeWidth,
        valueColor: AlwaysStoppedAnimation(color ?? AppColor.primaryFocus),
      ),
    );
  }
}
