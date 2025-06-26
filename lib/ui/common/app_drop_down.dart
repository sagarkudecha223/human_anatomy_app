import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base_architecture_plugin/extension/string_extensions.dart';

import '../../core/colors.dart';
import '../../core/dimens.dart';
import '../../core/styles.dart';

class AppDropDown<T> extends StatelessWidget {
  const AppDropDown({
    super.key,
    required this.onChanged,
    required this.items,
    required this.itemLabel,
    this.showInitialValue = false,
    this.horizontalPadding,
    this.menuColor,
    this.trailingIcon,
    this.enabled = true,
    this.hasBorder = true,
    this.borderWidth,
    this.borderRadius,
    this.menuBorderRadius,
    this.labelText,
    this.errorText,
    this.filled = false,
    this.onFocusEvent,
    this.autoFocus = false,
    this.enableSearch = true,
    this.focusNode,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.textAlign = TextAlign.start,
    this.leadingIcon,
    this.borderColor,
    this.textStyle,
    this.labelTextStyle,
    this.height,
  });

  final bool showInitialValue;
  final double? horizontalPadding;
  final Color? menuColor;
  final Color? borderColor;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Function(T?) onChanged;
  final List<T> items;
  final bool enabled;
  final bool hasBorder;
  final double? borderWidth;
  final double? borderRadius;
  final double? menuBorderRadius;
  final String? errorText;
  final String? hintText;
  final String? helperText;
  final String? labelText;
  final bool filled;
  final bool enableSearch;
  final Function? onFocusEvent;
  final bool autoFocus;
  final FocusNode? focusNode;
  final String Function(T) itemLabel;
  final dynamic initialValue;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final TextStyle? labelTextStyle;
  final double? height;

  OutlineInputBorder _textFieldBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(borderRadius ?? Dimens.radiusSmall),
    ),
    borderSide: BorderSide(
      color:
          errorText != null && errorText!.isNotBlank
              ? AppColors.red
              : borderColor ?? AppColors.borderColor,
      width: hasBorder ? borderWidth ?? Dimens.borderWidthXSmall : 0.0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      enabled: enabled,
      menuHeight: Dimens.containerSmall,
      errorText: errorText != null && errorText.isNotBlank ? errorText : null,
      label:
          labelText != null && labelText!.isNotBlank
              ? _LabelText(
                labelText: labelText!,
                isError: errorText != null && errorText!.isNotBlank,
                labelTextStyle: labelTextStyle,
              )
              : null,
      selectedTrailingIcon:
          trailingIcon != null
              ? Transform.rotate(angle: pi, child: trailingIcon)
              : null,
      trailingIcon: trailingIcon,
      textStyle: textStyle ?? AppFontTextStyles.textStyleSmall(),
      hintText: hintText,
      helperText: helperText,
      inputDecorationTheme: InputDecorationTheme(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
          horizontal: Dimens.spaceSmall,
        ),
        constraints: BoxConstraints(
          maxHeight: height ?? Dimens.dropDownHeightSmall,
        ),
        errorStyle: AppFontTextStyles.textStyleSmall().copyWith(
          color: AppColors.red,
          fontSize: Dimens.fontSizeTwelve,
        ),
        filled: filled,
        fillColor:
            enabled
                ? AppColors.primary.withOpacity(0.07)
                : AppColors.darkTextDisabled.withOpacity(0.05),
        enabledBorder: _textFieldBorder(),
        focusedBorder: _textFieldBorder(),
        errorBorder: _textFieldBorder(),
        disabledBorder: _textFieldBorder(),
        focusedErrorBorder: _textFieldBorder(),
      ),
      onSelected: (value) => onChanged(value as T?),
      menuStyle: MenuStyle(
        backgroundColor: WidgetStatePropertyAll<Color>(
          menuColor ?? AppColors.backgroundColor,
        ),
        side: WidgetStatePropertyAll(
          BorderSide(color: AppColors.secondaryGrey2),
        ),
        shape: WidgetStatePropertyAll(
          ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(
              menuBorderRadius ?? Dimens.radiusLarge,
            ),
          ),
        ),
      ),
      dropdownMenuEntries:
          items
              .map(
                (item) => DropdownMenuEntry(
                  value: item,
                  label: itemLabel(item),
                  labelWidget: Text(
                    itemLabel(item),
                    style: textStyle ?? AppFontTextStyles.textStyleMedium(),
                  ),
                ),
              )
              .toList(),
      leadingIcon: leadingIcon,
      initialSelection: showInitialValue ? initialValue ?? items.first : null,
      textAlign: textAlign,
      expandedInsets: EdgeInsets.all(horizontalPadding ?? 0),
    );
  }
}

class _LabelText extends StatelessWidget {
  final String labelText;
  final bool isError;
  final TextStyle? labelTextStyle;

  const _LabelText({
    required this.labelText,
    required this.isError,
    this.labelTextStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      labelText,
      style:
          labelTextStyle ??
          AppFontTextStyles.textStyleSmall().copyWith(
            color:
                isError
                    ? AppColors.red
                    : AppColors.isLightTheme
                    ? AppColors.lightTextMedium
                    : AppColors.darkTextMedium,
          ),
    );
  }
}
