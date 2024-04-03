import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_items.dart';
import 'package:widgets_app/presentation/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  static  const  String name = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: colorTheme.primary,
        title: Text('Flutter + Material 3',style: textTheme.bodyMedium),
        centerTitle: false,
      ),
      body:const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey)
    );
  }
}


class _HomeView extends StatelessWidget {
  //cuando es privado no es necesario colocar el super.key en el constructor
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context,index) {
        final menuItem = appMenuItems[index];
        return _CustomListTile(menuItem: menuItem);
      }
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menuItem.icon,
        color: colorsTheme.primary,
      ),//icono que podemos usar antes del widget
      title: Text(menuItem.title),
      subtitle: Text(menuItem.subTitle),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: colorsTheme.primary,
      ),
      onTap: () {
        context.push(menuItem.link); //este nos sirve para navegar con rutas
        //context.pushNamed(CardsScreen.name); //este nos sirve para navegar por nombres 
      }
    );
  }
}