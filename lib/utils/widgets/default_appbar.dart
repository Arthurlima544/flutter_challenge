import 'package:flutter/material.dart';
import '../routes/skill_playground_router_delegate.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({required this.titleText, super.key, this.onTap});
  final String titleText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => AppBar(
    title: Text(titleText),
    leading: BackButton(
      onPressed:
          onTap ??
          () {
            (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
                .goHome();
          },
    ),
  );

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
