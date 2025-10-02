import 'package:flutter/material.dart';
import 'package:pokedex/core/theme/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? titleContent;
  final List<Widget>? actions;
  final Widget? bottomContent;
  final double appBarPreferredSize;

  const CustomAppBar({
    super.key,
    this.titleContent,
    this.actions,
    this.bottomContent,
    this.appBarPreferredSize = 132,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      centerTitle: false,
      title: titleContent,
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(bottomContent != null ? 48 + 1 : 1),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (bottomContent != null) bottomContent!,
            const Divider(
              height: 1,
              thickness: 1,
              color: AppColors.disabledColor,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    kToolbarHeight + (bottomContent != null ? appBarPreferredSize : 0) + 1,
  );
}
