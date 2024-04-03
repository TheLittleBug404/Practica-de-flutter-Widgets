import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';

class SideMenu  extends StatefulWidget {
  //aca tomaremos el key 
  final GlobalKey<ScaffoldState> scaffoldKey;
  const SideMenu ({
    super.key,
    required this.scaffoldKey
  });

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  //esta variable nos ayudara a saber cual de las opciones del menu es la que esta seleccionada 
  int navDrawerIndex = 0;
  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    //esto nos indicara cuanto es el padding de una direccion por ejemplo cuanto es el padding del top
    //nos ayudara a saber esa distancia que hay en el top 
    //si es mayor a 35 tenemos un Top caso contrario no tenemos
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value)  {
        setState(() {
          navDrawerIndex = value;
        });
        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: <Widget> [
        Padding(
          //si tiene notch el valor que colocaremos sera 10 
          // si no tiene notch colocaremos unos 20
          padding: EdgeInsets.fromLTRB(28, hasNotch ? 10:20, 16, 10),
          child: const Text('Menu Drawer'),
        ),
        //utilizaremos el operador ...
        //lo colocaremos en un map y la variable sera item y nos retornara un NavigationDrawerDestination
        ...appMenuItems
          .sublist(0,3)//este sublist es el que nos mostrara los elementos de  la lista desde el 0 al 3
          .map((item) => 
            NavigationDrawerDestination(
              icon: Icon(item.icon), 
              label: Text(item.title)
            )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(
            color: colorTheme.primary,
            thickness: 3,
          ),
        ),
        ...appMenuItems
          .sublist(3,appMenuItems.length)
          .map((e) => NavigationDrawerDestination(
            icon: Icon(e.icon), 
            label: Text(e.title)
          )
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(
            color: colorTheme.primary,
            thickness: 3
          ),
        ),
      ]
    );
  }
}