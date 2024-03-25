import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  //nos crearemos una varialbe para poder seleccionar un color
  //nosotros necesitamos asegurarnos de que ningun otro programador de nuestro equipo pueda seleccionar otro color
//que no sea parte de nuestra lista de colores por que si no se desbordaria y me daria problemas para eso usaremos el assert
  final int selectedColor;
  AppTheme({
    this.selectedColor = 0
  }): assert( selectedColor >= 0, 'Selected Color must be greater then 0'),//este assert le colocamos para que el valor que entre en la lista sea mayor igual a cero
      assert( selectedColor <= colorList.length, 'Selected Color must be less or equal than ${colorList.length-1}');//este le colcamos para que el valor entrado sea menor o igual al tamaño de la lista de colores

  //hacemos un get para poder obtener nuestro tema de colores esto lo llamaremos en el main
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: colorList[selectedColor],
    //esto sera la  configuracion de todos nuestro AppBar
    appBarTheme: const AppBarTheme(
      centerTitle: false,
    )
  );
}
