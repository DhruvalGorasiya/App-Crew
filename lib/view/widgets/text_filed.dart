import 'package:app_crew/exports/exports.dart';
import 'package:flutter/services.dart';

hideKeyboard() {
  return FocusManager.instance.primaryFocus?.unfocus();
}

get getPrefixTextBoxContains => const BoxConstraints(minWidth: 0, minHeight: 0);

getPrefixTextIcon({required String text}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8, left: 16),
        child: customText(
          text: text,
          style: textFiledTextStyle,
        ),
      ),
    ],
  );
}

TextInputType get getNumberKeyBoardType => const TextInputType.numberWithOptions(decimal: true);

List<TextInputFormatter> get getDoubleInputFormatter => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
    ];

List<TextInputFormatter> get getIntegerInputFormatter => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    ];

List<TextInputFormatter> get getNumberInputFormatterWithLength10 => <TextInputFormatter>[
      FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,3}')),
      LengthLimitingTextInputFormatter(10),
    ];

Widget customTextFiled(
    {String? label,
    String? hintText,
    String? titleText,
    TextStyle? titleTextStyle,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool? hasError,
    bool? obscureText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool? isDisable,
    bool? isSelected,
    Color? fillColor,
    int? maxLength,
    int? minLines,
    int? maxLines,
    ValueChanged<String>? onChanged,
    VoidCallback? onTap,
    bool? readOnly,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
    Color? hintTextColor,
    Color? borderColor,
    String? prefixText,
    BoxConstraints? prefixIconConstraints,
    List<TextInputFormatter>? inputFormatters,
    TextCapitalization textCapitalization = TextCapitalization.none,
    TextInputAction? textInputAction,
    Function(String)? onFieldSubmitted,
    FocusNode? focusNode,
    bool? underLineBorder,
    bool autofocus = false,
    TextAlign textAlign = TextAlign.start,
    TextStyle? hintStyle}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (titleText != null)
        customText(
          text: titleText,
          style: titleTextStyle ?? styleBody14Medium.copyWith(color: neutral800Color),
        ),
      if (titleText != null) h(4),
      TextFormField(
        textAlign: textAlign,
        autofocus: autofocus,
        focusNode: focusNode,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        textCapitalization: textCapitalization,
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        style: isDisable == true ? disableTextFiledTextStyle : textFiledTextStyle,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        readOnly: readOnly ?? false,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxLength,
        obscureText: obscureText ?? false,
        inputFormatters: inputFormatters,
        decoration: getTextFiledDecoration(
          hintStyle: hintStyle,
          underLine: underLineBorder,
          suffixIcon: suffixIcon,
          hintText: hintText,
          label: label,
          prefixIcon: prefixIcon,
          hasError: hasError,
          isDisable: isDisable,
          isSelected: isSelected,
          contentPadding: contentPadding,
          borderRadius: borderRadius,
          fillColor: fillColor,
          hintTextColor: hintTextColor,
          borderColor: borderColor,
          prefixText: prefixText,
          prefixIconConstraints: prefixIconConstraints,
        ),
      ),
    ],
  );
}

Widget customDropDownFiled(
    {String? label,
    String? hintText,
    FormFieldValidator? validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    Widget? suffixIcon,
    Color? borderColor,
    bool? hasError,
    bool? readOnly,
    String? value,
    bool? isDisable,
    required ValueChanged onChanged,
    required List<DropdownMenuItem> items}) {
  return DropdownButtonFormField(
    value: value,
    onChanged: onChanged,
    items: items,
    style: isDisable == true ? disableTextFiledTextStyle : textFiledTextStyle,
    borderRadius: BorderRadius.circular(6),
    validator: validator,
    icon: SvgPicture.asset(
      AppImages.arrowDown,
      height: 18,
      width: 18,
    ),
    decoration: getTextFiledDecoration(
      suffixIcon: suffixIcon,
      hintText: hintText,
      label: label,
      hasError: hasError,
      isDisable: isDisable,
      borderColor: borderColor,
    ),
  );
}

DropdownMenuItem customDropDownMenuItem({required String title, required String value}) {
  return DropdownMenuItem(
    value: value,
    child: customText(
      text: title,
      style: textFiledTextStyle,
    ),
  );
}

getTextFiledDecoration(
    {String? label,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    String? prefixText,
    bool? hasError,
    bool? isDisable,
    bool? isSelected,
    bool? underLine,
    EdgeInsetsGeometry? contentPadding,
    BorderRadius? borderRadius,
    Color? hintTextColor,
    Color? fillColor,
    Color? borderColor,
    BoxConstraints? prefixIconConstraints,
    TextStyle? hintStyle}) {
  return InputDecoration(
    errorMaxLines: 2,
    enabled: !(isDisable ?? false),
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    prefixText: prefixText,
    prefixIcon: prefixIcon,
    prefixIconConstraints: prefixIconConstraints,
    suffixIcon: suffixIcon,
    labelStyle: labelTextFiledTextStyle,
    // labelText: label,
    label: label != null
        ? RichText(
            text: TextSpan(
              style: labelTextFiledTextStyle,
              children: <TextSpan>[
                TextSpan(
                  text: (label).replaceAll("*", ""),
                ),
                if ((label).contains("*"))
                  const TextSpan(
                    text: '*',
                    style: TextStyle(color: redColor),
                  ),
              ],
            ),
          )
        : null,
    hintText: hintText,
    hintStyle: hintStyle ?? hintTextFiledTextStyle,
    errorStyle: errorTextFiledTextStyle,
    filled: fillColor != null ? true : isSelected,
    fillColor: fillColor ?? secondaryColor,
    contentPadding: contentPadding,
    focusedBorder: underLine == true
        ? UnderlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    border: underLine == true
        ? UnderlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? (isSelected == true ? primaryColor : textFiledBorderColor), width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? (isSelected == true ? primaryColor : textFiledBorderColor), width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    errorBorder: underLine == true
        ? UnderlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: const BorderSide(color: errorColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    focusedErrorBorder: underLine == true
        ? UnderlineInputBorder(
            borderSide: BorderSide(color: errorColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: const BorderSide(color: errorColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    disabledBorder: underLine == true
        ? UnderlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? textFiledBorderColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(color: borderColor ?? textFiledBorderColor, width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    enabledBorder: underLine == true
        ? UnderlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? (isSelected == true ? primaryColor : textFiledBorderColor), width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          )
        : OutlineInputBorder(
            borderSide: BorderSide(
                color: borderColor ?? (isSelected == true ? primaryColor : textFiledBorderColor), width: 1.5),
            borderRadius: borderRadius ?? BorderRadius.circular(6),
          ),
    counterStyle: const TextStyle(fontSize: 0),
    counterText: "",
  );
}
