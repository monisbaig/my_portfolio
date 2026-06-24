part of 'util.dart';

extension MediaQueryValues on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get mediaWidth => mediaQuery.size.width;

  double get mediaHeight => mediaQuery.size.height;

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => theme.textTheme;

  ColorScheme get colorScheme => theme.colorScheme;
}
