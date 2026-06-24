part of 'decoration.dart';

class PortfolioLogo extends StatelessWidget {
  const PortfolioLogo({super.key, this.size = 70});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.imagesLogo,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
