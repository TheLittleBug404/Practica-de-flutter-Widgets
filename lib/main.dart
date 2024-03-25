import 'package:flutter/material.dart';
import 'package:widgets_app/config/presentation/screens/buttons/buttons_screen.dart';
import 'package:widgets_app/config/presentation/screens/cards/cards_screen.dart';
import 'package:widgets_app/config/presentation/screens/home/home_screens.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
//aleida
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //aca colcoaremos un numero de 0 a 8 por que este es el tamaño de nuestra lista de colores
      theme: AppTheme(selectedColor: 1).getTheme(),
      routes: {
        '/buttons' : (context) => const ButtonsScreen(),
        '/cards': (context) => const CardsScreen()
      },
      home:  const HomeScreen()
    );
  }
}
