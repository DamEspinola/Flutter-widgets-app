import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SidebarMenu extends StatefulWidget {
  
  final GlobalKey<ScaffoldState> scaffoldkey;
   
   SidebarMenu({
    required this.scaffoldkey
    });

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
   int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    
    return NavigationDrawer(
      selectedIndex: selectedIndex,
      onDestinationSelected: (value) {
        setState(() {
        selectedIndex = value;
        });
        
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        // context.go(menuItem.link);
        widget.scaffoldkey.currentState?.closeDrawer();

      },
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10 : 20 , 16, 10),
          child: const Text("Menu")
        ),

        ...appMenuItems
        .sublist(0,3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
        )),

         Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider()
        ),
      
      Padding(
          padding: EdgeInsets.fromLTRB(28, 10, 16, 10),
          child: const Text("More options") 
        ),
        
        ...appMenuItems
        .sublist(3)
        .map((item) => NavigationDrawerDestination(
          icon: Icon(item.icon),
          label: Text(item.title),
        ))
    ]);
  }
}


