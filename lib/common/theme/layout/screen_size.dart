import 'package:flutter/cupertino.dart';

extension ScreenSize on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  double get mobileWidth => 550;
  double get tabletWidth => 800;
  double get desktopWidth => 900;
  double get largeDesktopWidth => 1440;
  bool get isMobile => screenWidth < mobileWidth;
  bool get isTablet => screenWidth >= mobileWidth && screenWidth < tabletWidth;
  bool get isDesktop =>
      screenWidth >= tabletWidth && screenWidth < desktopWidth;
  bool get isLargeDesktop => screenWidth >= desktopWidth;
}
