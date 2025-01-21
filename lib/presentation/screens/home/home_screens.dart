import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class HomeScreens extends StatelessWidget {
  const HomeScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Flutter"),
      ),
      body: _homeView(),
    );
  }
}

class _homeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appMenuItems;

    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItems = appMenuItems[index];
          return _customListTitle(menuItems: menuItems);
        });
  }
}

class _customListTitle extends StatelessWidget {
  const _customListTitle({
    required this.menuItems,
  });

  final MenuItems menuItems;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      trailing: Icon(Icons.arrow_forward_ios_outlined),
      leading: Icon(
        menuItems.icon,
        color: colors.primary,
      ),
      title: Text(menuItems.title),
      subtitle: Text(menuItems.subTitle),
      onTap: () => context.go(menuItems.link),

        // () => context.go('/second');
      // },
    );
  }
}
