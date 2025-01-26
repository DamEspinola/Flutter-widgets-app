import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/widgets/sidebar_menu.dart';

class HomeScreens extends StatelessWidget {
   HomeScreens({super.key});


  @override
  Widget build(BuildContext context) {
  
  final scaffoldkey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(
        title: const Text("Hello Flutter"),
      ),
      body: _HomeView(),
      drawer: SidebarMenu(scaffoldkey: scaffoldkey,),
    );
  }
}

class _HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    appMenuItems;

    return ListView.builder(
        itemCount: appMenuItems.length,
        itemBuilder: (context, index) {
          final menuItems = appMenuItems[index];
          return _CustomListTitle(menuItems: menuItems);
        });
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
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
