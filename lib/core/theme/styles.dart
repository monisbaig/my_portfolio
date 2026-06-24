part of 'theme.dart';

class Styles {
  static TextStyle text30Heavy({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 30,
    fontWeight: FontWeight.w800,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text24Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text22Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text20Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text20Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text18Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text18Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text18Medium({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text17Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 17,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text16Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text16Medium({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text16Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text16Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text15Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text15Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text14Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text14Medium({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text14Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
    letterSpacing: -0.5,
  );

  static TextStyle text13Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text13Medium({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text13Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text13Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text12Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text12Semibold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text12Medium({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text12Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text11Regular({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle text10Bold({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 10,
    fontWeight: FontWeight.w700,
    color: textColor ?? AppColor.textPrimary,
  );

  static TextStyle displayHeavy({
    required double fontSize,
    Color? textColor,
    double? height,
  }) =>
      GoogleFonts.elmsSans(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        height: height,
        color: textColor ?? AppColor.textPrimary,
      );

  static TextStyle heroName({Color? textColor}) => GoogleFonts.elmsSans(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 6,
    color: textColor ?? AppColor.textSecondary,
  );

  static TextStyle logo({double fontSize = 28, Color? textColor}) =>
      GoogleFonts.elmsSans(
        fontSize: fontSize,
        fontWeight: FontWeight.w800,
        height: 1,
        color: textColor ?? AppColor.textPrimary,
      );

  static TextTheme textTheme(TextTheme base) =>
      GoogleFonts.elmsSansTextTheme(base).apply(
        bodyColor: AppColor.textPrimary,
        displayColor: AppColor.textPrimary,
      );

  static InputBorder inputBorder(Color borderColor) {
    return OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(Sizes.inputBorderRadius),
      ),
      borderSide: BorderSide(color: borderColor, width: Sizes.borderWidth),
    );
  }

  static InputBorder underlineBorder(
    Color borderColor, {
    double width = Sizes.borderWidth,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: width),
    );
  }
}
