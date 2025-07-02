import 'package:app_crew/exports/exports.dart';

AppBar customAppBar({
  required BuildContext context,
  bool? hideBackIcon,
  Widget? actions,
  String? title,
  Widget? leading,
  VoidCallback? onBack,
  TextStyle? titleStyle,
  bool? isForDashBoard,
}) {
  return AppBar(
    backgroundColor: white,
    surfaceTintColor: white,
    leadingWidth: hideBackIcon == true || isForDashBoard == true ? 0 : null,
    leading: leading ??
        (hideBackIcon == true || isForDashBoard == true ? Container() : backButton(context, onBack: onBack)),
    titleSpacing: isForDashBoard == true ? null : 0,
    actions: [
      if (actions != null) actions,
    ],
    title: Row(
      children: [
        Expanded(
          child: customText(
            text: title ?? "",
            style: titleStyle ?? (isForDashBoard == true ? styleTitle24SemiBold : styleSubtitle16SemiBold),
          ),
        ),
      ],
    ),
  );
}

Widget? backButton(BuildContext context, {VoidCallback? onBack, Color? color}) {
  if (Navigator.canPop(context)) {
    return IconButton(
      onPressed: onBack ??
          () {
            Navigator.pop(context);
          },
      icon: SvgPicture.asset(
        AppImages.backArrow,
        color: color,
      ),
    );
  } else {
    return null;
  }
}
