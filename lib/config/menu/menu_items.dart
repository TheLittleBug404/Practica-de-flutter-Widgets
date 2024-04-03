import 'package:flutter/material.dart';

class MenuItem{
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  //nos creamos el constructor todos nuestras variables seran requeridas ninguno es opcional
  //este constructor sera de manera constante ya que 
  const MenuItem({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon
  });
}
//aca nos crearemos las diferentes opciones del Menu
const appMenuItems = <MenuItem>[
  MenuItem(
    title: 'Contador RiverPod', 
    subTitle: 'Introduccion a RiverPod', 
    link: '/counter', 
    icon: Icons.add
  ),
  MenuItem(
    title: "Botones", 
    subTitle: "Varios botones en flutter", 
    link: "/buttons", 
    icon: Icons.smart_button_outlined
  ),
  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estilizado', 
    link: '/cards', 
    icon: Icons.credit_card
  ),
  MenuItem(
    title: 'ProgressIndicator', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_rounded
  ),
  MenuItem(
    title: 'SnackBars y dialogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbars', 
    icon: Icons.info_outline
  ),
  MenuItem(
    title: 'Animated Container', 
    subTitle: 'State Ful Widget animado', 
    link: '/animated', 
    icon: Icons.android_outlined
  ),
  MenuItem(
    title: 'UI controls + tiles', 
    subTitle: 'Aca vemos CheckBox y RadioButtons', 
    link: '/ui-controls', 
    icon: Icons.contact_mail_rounded
  ),
  MenuItem(
    title: 'Tutorial', 
    subTitle: 'Introduccion a la aplicacion', 
    link: '/tutorial', 
    icon: Icons.tune_rounded
  ),
  MenuItem(
    title: 'InifiniteScroll y pull', 
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/infinite', 
    icon: Icons.backup_outlined
  ),
  MenuItem(
    title: 'Cambio de temas', 
    subTitle: 'En aca podremos cambiar el tema de nuestra aplicacion', 
    link: '/theme', 
    icon: Icons.theater_comedy_outlined
  )
];