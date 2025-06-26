import 'package:flutter/material.dart';

import '../../core/dimens.dart';
import '../../core/styles.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool forceMaterialTransparency;

  const CommonAppbar({
    super.key,
    this.title,
    this.titleText,
    this.actions,
    this.backgroundColor,
    this.forceMaterialTransparency = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      forceMaterialTransparency: forceMaterialTransparency,
      title:
          title ??
          Text(titleText ?? '', style: AppFontTextStyles.appbarTextStyle()),
      elevation: Dimens.elevationSmall,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
