import 'package:app_crew/exports/exports.dart';

Widget customButton({
  required VoidCallback? onTap,
  required String name,
  bool? isLoading,
  bool? isDisable,
  double? width,
  double? loadingWidgetSize,
  double? height,
  double? fontSize,
  double? imageSize,
  FontWeight? fontWeight,
  EdgeInsets? margin,
  EdgeInsets? padding,
  Color? buttonColor,
  Color? fontColor,
  bool? isOutLine,
  double? borderRadius,
  String? image,
  Color? imageColor,
  Color? borderColor,
  Color? imageContainerColor,
}) {
  return Stack(
    alignment: Alignment.center,
    children: [
      Padding(
        padding: margin ?? paddingH,
        child: Material(
          borderRadius: BorderRadius.circular(borderRadius ?? 6),
          // elevation: 5,
          color: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          // shadowColor: grey.shade100,
          child: InkWell(
            onTap: isLoading == true
                ? null
                : isDisable == true
                    ? null
                    : () {
                        hideKeyboard();
                        onTap!();
                      },
            borderRadius: BorderRadius.circular(borderRadius ?? 6),
            child: Ink(
              height: height,
              width: width,
              padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
              decoration: BoxDecoration(
                color: isLoading == true
                    ? null
                    : buttonColor ??
                        (isOutLine == true ? white : (isDisable == true ? disableButtonColor : primaryColor)),
                borderRadius: BorderRadius.circular(borderRadius ?? 6),
                // border: Border.all(
                //   color: isLoading == true
                //       ? Colors.transparent
                //       : isOutLine == true
                //           ? primaryColor
                //           : Colors.transparent,
                // ),
                border: Border.all(color: borderColor ?? primaryColor),
              ),
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (image != null)
                      Container(
                        height: imageSize ?? 15,
                        width: imageSize ?? 15,
                        decoration: BoxDecoration(
                          color: imageContainerColor ??
                              (isOutLine == true ? primaryColor.withOpacity(0.2) : white.withOpacity(0.2)),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            image,
                            height: 5.63,
                            colorFilter: imageColor != null || isOutLine == true
                                ? ColorFilter.mode(imageColor ?? primaryColor, BlendMode.srcIn)
                                : null,
                            // color: imageColor ?? (isOutLine == true ? primaryColor : null),
                          ),
                        ),
                      ),
                    if (image != null) w(7.5),
                    customText(
                      text: name,
                      style: TextStyle(
                        fontSize: fontSize ?? 16,
                        fontWeight: fontWeight ?? FontWeight.w600,
                        color: isLoading == true
                            ? Colors.transparent
                            : isOutLine == true
                                ? fontColor ?? primaryColor
                                : fontColor ?? white,
                        fontFamily: defaultFontFamily,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      if (isLoading == true) loadingWidget(size: loadingWidgetSize ?? 24)
    ],
  );
  // }
}

Widget passwordEyeButton({required VoidCallback onTap, required bool iaOpen}) {
  return IconButton(
    onPressed: onTap,
    icon: SvgPicture.asset(
      iaOpen ? AppImages.eye : AppImages.eyeClose,
    ),
  );
}

Widget customSelectedButton({
  required String name,
  VoidCallback? onTap,
  bool? isSelected,
  TextAlign? textAlign,
  bool? hideBorder,
  EdgeInsets? padding,
  EdgeInsets? margin,
}) {
  return Material(
    color: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    child: Padding(
      padding: margin ?? const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: isSelected == true ? Colors.transparent : primaryColor.withOpacity(0.2),
        highlightColor: isSelected == true ? Colors.transparent : primaryColor.withOpacity(0.2),
        child: Ink(
          decoration: BoxDecoration(
            color: isSelected == true ? secondaryColor : null,
            borderRadius: BorderRadius.circular(16),
            border: hideBorder == true
                ? null
                : Border.all(color: isSelected == true ? primaryColor : systemFiledColor),
          ),
          padding: padding ?? const EdgeInsets.symmetric(horizontal: 21, vertical: 19),
          child: customText(
            text: name,
            style: styleBody16Medium.copyWith(color: white),
            textAlign: textAlign,
          ),
        ),
      ),
    ),
  );
}

Widget customIconButton({
  required String imagePath,
  EdgeInsets? padding,
  VoidCallback? onTap,
  double? size,
  double? iconSize,
  double? elevation,
  Color? color,
  Color? iconColor,
}) {
  return SizedBox(
    height: size,
    width: size,
    child: Material(
      elevation: elevation ?? 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
      ),
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      child: InkWell(
        onTap: onTap != null
            ? () {
                hideKeyboard();
                onTap();
              }
            : null,
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          decoration: BoxDecoration(color: color ?? white, shape: BoxShape.circle),
          padding: padding ?? const EdgeInsets.all(6),
          child: SvgPicture.asset(
            imagePath,
            width: iconSize,
            height: iconSize,
            colorFilter: iconColor != null ? ColorFilter.mode(iconColor, BlendMode.srcIn) : null,
          ),
        ),
      ),
    ),
  );
}
