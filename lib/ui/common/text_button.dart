import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/colors.dart';
import '../../core/dimens.dart';
import '../../core/styles.dart';
import 'app_loader.dart';

class AppTextButton extends StatelessWidget {
  final String title;
  final TextStyle? titleTextStyle;
  final VoidCallback? onTap;
  final bool isLoading;
  final Color? disabledColor;
  final Color? backgroundColor;
  final bool hasBorder;
  final Color? borderColor;
  final double? borderWidth;
  final double? borderRadius;
  final bool isEnabled;
  final double? height;
  final double width;
  final Color? textColor;
  final bool isShowUnderLine;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Widget? loadingWidget;
  final VisualDensity? visualDensity;

  const AppTextButton({
    this.title = '',
    this.titleTextStyle,
    this.onTap,
    this.isLoading = false,
    this.disabledColor = AppColors.secondaryGrey2,
    this.backgroundColor = AppColors.transparent,
    this.hasBorder = false,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.isEnabled = true,
    this.height,
    this.width = double.infinity,
    this.textColor,
    this.isShowUnderLine = false,
    this.prefixWidget,
    this.suffixWidget,
    this.loadingWidget,
    super.key,
    this.visualDensity,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: isLoading || !isEnabled ? null : onTap,
      style: TextButton.styleFrom(
        visualDensity: visualDensity,
        backgroundColor: isEnabled ? backgroundColor : disabledColor,
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingXMedium),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: borderColor ?? AppColors.borderColor,
            width: borderWidth ?? Dimens.borderWidthSmall,
            style: hasBorder ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(
            borderRadius ?? Dimens.radiusMedium,
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: width,
        height: height ?? Dimens.buttonXLarge,
        child:
            isLoading
                ? SizedBox(
                  width: Dimens.iconXSmall,
                  height: Dimens.iconXSmall,
                  child: loadingWidget ?? const AppLoader(),
                )
                : IgnorePointer(
                  child: _TextWithIcon(
                    title: title,
                    style:
                        titleTextStyle ??
                        AppFontTextStyles.buttonTextStyle().copyWith(
                          decoration:
                              isShowUnderLine ? TextDecoration.underline : null,
                          decorationColor: textColor,
                          color: textColor,
                        ),
                    prefixIcon: prefixWidget,
                    suffixIcon: suffixWidget,
                  ),
                ),
      ),
    );
  }
}

class _TextWithIcon extends StatelessWidget {
  final String title;
  final TextStyle style;
  final Widget? suffixIcon;
  final Widget? prefixIcon;

  const _TextWithIcon({
    required this.title,
    required this.style,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        prefixIcon ?? const SizedBox(),
        Gap(Dimens.space2xSmall),
        Flexible(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: style,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Gap(Dimens.space2xSmall),
        suffixIcon ?? const SizedBox(),
      ],
    );
  }
}
