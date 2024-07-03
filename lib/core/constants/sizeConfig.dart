part of 'constants.dart';

/// SizeConfig file contains all size of widget we can modify size from here
class SizeConfig {
  const SizeConfig._();

  /// spaceBetween two widgets
  static double spaceBetween = 10;

  /// smaller font size
  static double smallerFont = 10;

  /// small font size
  static double smallFont = 13;

  /// medium font size
  static double mediumFont = 16;

  /// large font size
  static double largeFont = 18;

  /// common border Radius
  static double borderRadius = 8;

  /// Returns an [EdgeInsets] object representing the padding to be used for a page.
  ///
  /// The padding is symmetric with a horizontal spacing of 20 [sp] and a vertical spacing of 10 [sp].
  ///
  /// Returns:
  ///   An [EdgeInsets] object with the specified horizontal and vertical spacing.
  static EdgeInsets get pagePadding {
    return EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp);
  }
 

  /// vertical small space between widgets
  static Widget verticalSpaceSmall() {
    return SizedBox(
      height: spaceBetween * .8,
    );
  }

  /// vertical  space between widgets
  static Widget verticalSpace({double? height}) {
    return SizedBox(
      height: height ?? spaceBetween,
    );
  }

  /// vertical medium space between widgets
  static Widget verticalSpaceMedium() {
    return SizedBox(
      height: spaceBetween * 1.2,
    );
  }

  /// vertical large space between widgets
  static Widget verticalSpaceLarge() {
    return SizedBox(
      height: spaceBetween * 2,
    );
  }

  /// horizontal  space between widgets
  static Widget horizontalSpace() {
    return SizedBox(
      width: spaceBetween,
    );
  }

  /// app card shadow
  static List<BoxShadow> appShadow = <BoxShadow>[
    BoxShadow(
      color: Colors.black.withOpacity(.2),
      blurRadius: 10.0,
      offset: const Offset(0.0, 10.0), // shadow direction: bottom right
    )
  ];
}
