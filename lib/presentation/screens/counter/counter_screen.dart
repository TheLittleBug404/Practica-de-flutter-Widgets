import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget{
  static const String name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //con el watch le decimos a mi aplicacion que este pendiente de nuestro Counter Provider
    final int clickCounter = ref.watch(counterProvider);
    //nos creamos un watch para que este pendiente de nuestra variable
    final bool clickThemeDark = ref.watch(themeProviderDark);
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contador de numeros',
          style: textTheme.bodyMedium,
        ),
        backgroundColor: colorTheme.primary,
        actions: [
          IconButton(
            icon: Icon ( clickThemeDark 
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined
            ),
            onPressed: (){
              ref.read(themeProviderDark.notifier).update((state) => !state);
              ref.read(selectedBrightnessTheme.notifier).update((state) => !state);
            }
          )
        ],
      ),
      body: Center(
        child: Text(
          clickCounter.toString(),
          style: textTheme.displayLarge
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //leemos el ref que es widget de referencia de nuestro Provider
          //.notifier es el que notifica que se esta cambiando nuestro estado
          //.state este es un int es un int por que nuestra variable counterProvider es de tipo int
          //en el state es en donde nosotros ya lo podemos transformar
          //ref.read(counterProvider.notifier).state++;
          ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      )
    );
  }
}