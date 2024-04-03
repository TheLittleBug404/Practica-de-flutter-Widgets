

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProviderDark = StateProvider<bool>((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//estado para manejar el color el color por defecto sera el cero
final selectedIndexColorProvider = StateProvider((ref) => 0);

//estado que maneja el tema claro y oscuro de nuestra aplicacion 
final selectedBrightnessTheme = StateProvider((ref) => false);