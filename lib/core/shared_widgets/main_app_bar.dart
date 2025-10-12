import 'package:flutter/material.dart';
import 'package:your_cinema/core/shared_widgets/app_bar_title.dart';
import 'package:your_cinema/core/shared_widgets/user_app_bar_icon.dart';
import 'package:your_cinema/features/authentication/presentation/screens/user_screen.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, required this.title});

  final String title;

  void onTap(BuildContext context) {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => const UserScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppBarTitle(),
      leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.menu,
          size: 36,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      actions: [
        UserAppBarIcon(
          onTap: () {
            onTap(context);
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
