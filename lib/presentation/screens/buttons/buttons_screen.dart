import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static  const  String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons Scren',style: textTheme.bodyMedium),
        backgroundColor: colorTheme.primary
      ),
      body: const _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.arrow_back_ios_new_rounded
        ),
        onPressed: (){
          // con el context.pop retrocedemos
          context.pop();
        }
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    ColorScheme colorsTheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        //el wrap es simmilar a las columnas la unica diferencia es que cuando ya no tenga espacio
        //este simplemente se va a bajar
        child: Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){}, 
              child: const Text("Elevated Button")
            ),
            const ElevatedButton(
              onPressed: null, 
              child: Text("Elevated Disable")
            ),
            ElevatedButton.icon(
              onPressed: (){},
              icon: const Icon(Icons.access_alarm_rounded), 
              label: const Text('Elevated Icon')
            ),
            FilledButton(
              onPressed: (){}, 
              child: const Text('Filled')
            ),
            FilledButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.accessibility_new_rounded), 
              label: const Text('Filled Icon')
            ),
            OutlinedButton(
              onPressed: (){}, 
              child: const Text('Out Line')
            ),
            OutlinedButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.label_important), 
              label: const Text('Out Line Icon')
            ),
            TextButton(
              onPressed: (){}, 
              child: const Text('Text Button')
            ),
            TextButton.icon(
              onPressed: (){}, 
              icon: const Icon(Icons.person), 
              label: const Text('Text Button Icon')
            ),
            const CustomButton(),
            IconButton(
              onPressed: (){}, 
              icon: const Icon(Icons.downhill_skiing_rounded)
            ),
            IconButton(
              onPressed: (){},
              icon: const Icon(Icons.zoom_in),
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(colorsTheme.primary),
                iconColor: const MaterialStatePropertyAll(Colors.white)//definie el color del icono
              ),
            )
          ]
        ),
      ),
    );
  }
}

//boton personalizado

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    return ClipRRect(//este nos servira para colocar los bordes de nuestro boton redondeados
    borderRadius: BorderRadius.circular(10),//este nos da el radio que tendra nuestro boton
      child: Material(
        color: colorsTheme.primary,
        child: InkWell(//este inkwel es una funcion de un splash screen cuando presionemos sobre el boton veremos el efecto
          onTap: (){},
          child:const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola Ricky',
              style: TextStyle(
                color: Colors.white
              ),
            )
          ),
        ),
      ),
    );
  }
}