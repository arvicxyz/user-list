import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  static int mobileWidth = 640;
  static int desktopWidth = 1024;
  static int largeDesktopWidth = 1280;

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? largeDesktop;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.largeDesktop,
  });

  // mobile < 640
  static bool isMobile(BuildContext context) => MediaQuery.sizeOf(context).width < mobileWidth;

  // tablet >= 640 && < 1024
  static bool isTablet(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= mobileWidth &&
      MediaQuery.sizeOf(context).width < desktopWidth;

  // desktop >= 1024
  static bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= desktopWidth;

  // desktop >= 1280
  static bool isLargeDesktop(BuildContext context) =>
      MediaQuery.sizeOf(context).width >= largeDesktopWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        if (maxWidth >= largeDesktopWidth) {
          return largeDesktop ?? desktop ?? tablet ?? mobile;
        } else if (maxWidth >= desktopWidth) {
          return desktop ?? tablet ?? mobile;
        } else if (maxWidth >= mobileWidth) {
          return tablet ?? mobile;
        } else {
          return mobile;
        }
      },
    );
  }
}

extension ResponsiveExtension on BuildContext {
  static int mobileWidth = 640;
  static int desktopWidth = 1024;
  static int largeDesktopWidth = 1280;

  T responsive<T>({
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final width = MediaQuery.sizeOf(this).width;
    return width >= largeDesktopWidth
        ? (largeDesktop ?? desktop ?? tablet ?? mobile)
        : width >= desktopWidth
            ? (desktop ?? tablet ?? mobile)
            : width >= mobileWidth && width < desktopWidth
                ? tablet ?? mobile
                : mobile;
  }
}

class ResponsiveScreen {
  static double defaultWidth = 1920;
  static double defaultHeight = 1080;

  static double screenWidth = 0;
  static double screenHeight = 0;

  static init({double? width, double? height}) {
    screenWidth = width ?? defaultWidth;
    screenHeight = height ?? defaultHeight;
  }

  static double getResponsiveWidth(BuildContext context, double width) {
    return (width / screenWidth) * MediaQuery.sizeOf(context).width;
  }

  static double getResponsiveHeight(BuildContext context, double height) {
    return (height / screenHeight) * MediaQuery.sizeOf(context).height;
  }
}

// Responsive Widgets

class ResponsivePadding extends StatelessWidget {
  final Widget child;

  const ResponsivePadding({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Responsive.isTablet(context)
          ? EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 3.8)
          : const EdgeInsets.all(0),
      child: child,
    );
  }
}
