import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/router/app_router.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';
//aleida
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){ 
    return super.createHttpClient(context) ..badCertificateCallback =
    (X509Certificate cert, String host, int port) => true; 
  }
}
void main(){
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    const ProviderScope(
      child: MainApp()
    )
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    //final int colorSeleccionado = ref.watch(selectedIndexColorProvider);
    //final bool selectedBrightness = ref.watch(selectedBrightnessTheme);
    //ahora colocaremos nuestro provider para que podamos manejar nuestro AppTheme
    final AppTheme appThemeAhora = ref.watch(themeNotifierProvider);
    return MaterialApp.router(
      title: 'Flutter Widgets',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      //como ya usamos nuestro Statenotifier para la clase appTheme ya no es necesario la sisguiente linea de codigo
      //theme: AppTheme(selectedColor: colorSeleccionado,isDarkmode: selectedBrightness).getTheme(),
      //usaremos el getTheme por que como ya sabemos nosotros ya podemos usar nuestros metodos de nuestro AppTheme
      theme:appThemeAhora.getTheme()
    );
  }
}
