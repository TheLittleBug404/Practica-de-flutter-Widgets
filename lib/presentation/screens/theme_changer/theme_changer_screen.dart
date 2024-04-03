import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {
  static  const  String name = 'theme_changer_screen';
  const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    final bool clickThemeDark = ref.watch(themeProviderDark);
    return Scaffold(
      appBar: AppBar(
        title: Text('Themes',style: textTheme.bodyLarge,),
        backgroundColor: colorTheme.primary,
        actions: <Widget>[
          IconButton(
            icon: Icon ( clickThemeDark 
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined
            ),
            onPressed: (){
              ref.read(themeProviderDark.notifier).update((state) => !state);
              ref.read(selectedBrightnessTheme.notifier).update((state) => !state);
            }, 
          )
        ],
      ),
      body: const _ThemeChangerView(),
    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext contex, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);
    final selectedColor = ref.watch(selectedIndexColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: ((context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle( color: color)
          ),
          subtitle: Text('${color.value}'),
          activeColor: color,
          value: index, 
          groupValue: selectedColor, 
          onChanged: (value){
            ref.read(selectedIndexColorProvider.notifier).update((state) => index);
          }
        );
      })
    );
  }
}