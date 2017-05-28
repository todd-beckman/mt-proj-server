import 'package:meta/meta.dart' show required;

import 'utils.dart';

/// The parent class for enumerations with a CSS classname
abstract class MTSkinConstant {
  /// The CSS className of this constant
  final String className;
  const MTSkinConstant(String this.className);
}

/// An enumeration of which viewport mode to use based on the viewport's width.
class ViewportWidthMode {
  /// The inclusive lower bound in px
  final int minPx;

  /// The inclusive upper bound in px
  final int maxPx;

  /// The inclusive lower bound in rem
  final double minRem;

  /// The inclusive upper bound in rem
  final double maxRem;

  ViewportWidthMode._internal({
    @required this.maxPx,
    @required this.minPx,
  })
      : minRem = pxToRem(minPx),
        maxRem = pxToRem(maxPx);

  /// The mode to be used for small (mobile and tablet) devices
  static final SM = new ViewportWidthMode._internal(maxPx: 767, minPx: 0);

  /// The mode to be used for small personal computers.
  ///
  /// This might also be the range for users that work in split-screen.
  static final MD = new ViewportWidthMode._internal(maxPx: 899, minPx: 768);

  /// The mode to be used for large personal computers.
  static final LG = new ViewportWidthMode._internal(maxPx: 1129, minPx: 900);

  /// The largest mode.
  static final XL =
      new ViewportWidthMode._internal(maxPx: 1000000, minPx: 1129);

  static ViewportWidthMode getModeForPx(int px) =>
      [SM, MD, LG.XL].firstWhere((ViewportWidthMode breakpoint) =>
          breakpoint.minPx <= px && px <= breakpoint.maxPx);

  static ViewportWidthMode getModeForRem(double rem) =>
      [SM, MD, LG.XL].firstWhere((ViewportWidthMode breakpoint) =>
          breakpoint.minRem <= rem && rem <= breakpoint.maxRem);
}
