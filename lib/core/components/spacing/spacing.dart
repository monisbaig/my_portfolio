import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class Spacing {
  static const extraSmallGap = Gap(4);
  static const smallGap = Gap(8);
  static const regularGap = Gap(12);
  static const mediumGap = Gap(16);
  static const mediumLargeGap = Gap(20);
  static const largeGap = Gap(24);
  static const largeMediumGap = Gap(28);
  static const extraLargeGap = Gap(32);
  static const extraSmallLargeGap = Gap(36);
  static const extraExtraLargeGap = Gap(48);
  static const extraMediumLargeGap = Gap(65);
  static const extraDoubleLargeGap = Gap(96);

  static const double fieldLabel = 5;
  static const double iconText = 6;
}

class Insets {
  //** Symmetric **//
  static const h4 = EdgeInsets.symmetric(horizontal: 4);
  static const h16 = EdgeInsets.symmetric(horizontal: 16);
  static const h20 = EdgeInsets.symmetric(horizontal: 20);
  static const h24 = EdgeInsets.symmetric(horizontal: 24);
  static const v16 = EdgeInsets.symmetric(vertical: 16);
  static const v32 = EdgeInsets.symmetric(vertical: 32);
  static const hv16 = EdgeInsets.symmetric(horizontal: 16, vertical: 16);
  static const hv20 = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
  static const hv1612 = EdgeInsets.symmetric(horizontal: 16, vertical: 12);
  static const hv1620 = EdgeInsets.symmetric(horizontal: 16, vertical: 20);

  //** All **//
  static const all4 = EdgeInsets.all(4);
  static const all5 = EdgeInsets.all(5);
  static const all8 = EdgeInsets.all(8);
  static const all10 = EdgeInsets.all(10);
  static const all16 = EdgeInsets.all(16);
  static const all20 = EdgeInsets.all(20);
  static const all30 = EdgeInsets.all(30);

  //** Only **//
  static const oL4 = EdgeInsets.only(left: 4);
  static const oR6 = EdgeInsets.only(right: 6);
  static const oB8 = EdgeInsets.only(bottom: 8);
  static const oB12 = EdgeInsets.only(bottom: 12);
  static const oB16 = EdgeInsets.only(bottom: 16);
  static const oB28 = EdgeInsets.only(bottom: 28);

  static const oB10 = EdgeInsets.only(bottom: 10);

  static const hv1410 = EdgeInsets.symmetric(horizontal: 14, vertical: 8);

  static const sectionContentLeft = 100.0;

  static EdgeInsets sectionBody(double width, {bool hasSideNav = false}) {
    return EdgeInsets.only(
      left: hasSideNav
          ? sectionContentLeft
          : (width > 900 ? 48 : 32),
      right: width > 900 ? 48 : 24,
    );
  }

  static EdgeInsets sectionTop(double width) => EdgeInsets.only(top: 90);

  static EdgeInsets heroSection(double width, {bool hasSideNav = false}) {
    return sectionBody(width, hasSideNav: hasSideNav) +
        sectionTop(width);
  }

  static EdgeInsets footer(double width, {bool hasSideNav = false}) =>
      EdgeInsets.fromLTRB(
        hasSideNav ? sectionContentLeft : (width > 900 ? 48 : 32),
        32,
        width > 900 ? 48 : 24,
        48,
      );

  static EdgeInsets highlightTitle(double fontSize) => EdgeInsets.symmetric(
    horizontal: fontSize * 0.18,
    vertical: fontSize * 0.06,
  );

  static const compactLogoLeft = 20.0;
  static const compactLogoTop = 28.0;
  static const scrollIndicatorBottom = 36.0;
}
