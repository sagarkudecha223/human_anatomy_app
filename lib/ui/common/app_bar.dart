import 'package:flutter/material.dart';

import '../../core/dimens.dart';
import '../../core/styles.dart';

class CommonAppbar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final String? titleText;
  final List<Widget>? actions;

  const CommonAppbar({super.key, this.title, this.titleText, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
