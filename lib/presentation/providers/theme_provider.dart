

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

final themeProviderDark = StateProvider<bool>((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//estado para manejar el color el color por defecto sera el cero
final selectedIndexColorProvider = StateProvider((ref) => 0);

//estado que maneja el tema claro y oscuro de nuestra aplicacion 
final selectedBrightnessTheme = StateProvider((ref) => false);
//un objeto de  tipo AppTheme este objeto es personalizado (Custom)
//que informacion va a fluir por este themeNotifierProvider
//stateNotifierProvider me permite mantener un estado mas complejo
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  //regresamos la primera instancia que en este caso sera nuestro ThemeNotifier
  (ref) => ThemeNotifier()
);

//stateNotifier se va encargar de mantener un estado en particular
//el estado que vamos a mantener es una instancia de nuestra appTheme
//esta clase sera la que controle nuestro estado 
class ThemeNotifier extends StateNotifier<AppTheme>{
  //con este constructor nosotros creamos la primera instancia de nuestro app theme
  //state = estado = new AppTheme();
  ThemeNotifier():super(AppTheme());
  //ahora podremos usar las propiedades de nuestro appTheme

  //metodo que nos servira para poder cmabiar el icono de sol a luna
  void toogleDarkMode(){
    //como accedemos a la propiedaddes o variables de la clase state
    //como hacemos esta cambio si vemos en nuestra clase appTheme la variable isDarkMode es de tipo final 
    //el estado sera igual al nuevo state del copyWith donde isDarkmodeNI sera lo contrario de isDarkmode
    state = state.copyWith( isDarkmodeNI: !state.isDarkmode);
  }
  void changeColorIndex(int colorIndex){
    
    state = state.copyWith(selectedColorNI: colorIndex);
  }
}