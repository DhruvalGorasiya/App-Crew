import 'package:app_crew/exports/exports.dart';

Widget customInkWellColor(
    {required VoidCallback onTap,
    BorderRadius? borderRadius,
    Color? color,
    required Widget child,
    EdgeInsetsGeometry padding = EdgeInsets.zero,
    EdgeInsetsGeometry margin = EdgeInsets.zero}) {
  return Material(
    color: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    child: Padding(
      padding: margin,
      child: InkWell(
        splashColor: (color ?? primaryColor).withValues(alpha: 0.1),
        focusColor: (color ?? primaryColor).withValues(alpha: 0.2),
        highlightColor: (color ?? primaryColor).withValues(alpha: 0.2),
        borderRadius: borderRadius,
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    ),
  );
}

const double maxWebWidth = 640;
const BoxConstraints webWidthConstraint = BoxConstraints(maxWidth: maxWebWidth);

int crossAxisCount({
  required BuildContext context,
  required double maxWidth,
  required int minCount,
  bool isWithDrawerCondition = false,
  double? removeSize,
  double? currentWidth,
}) {
  double currentSize = currentWidth ?? width(context, 1);

  if (removeSize != null) {
    currentSize = currentSize - removeSize;
  }
  int count = currentSize ~/ maxWidth;
  if (count >= 2) {
    return count;
  } else {
    return minCount;
  }
}
