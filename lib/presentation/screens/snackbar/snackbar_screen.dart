import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen'; 
  const SnackbarScreen({super.key});
  //nos creamos un metodo para el Snack Bar
  //recibira el build context
  void showCustomSnackbar(BuildContext context){
    //debemos destruti los Snack Bars si no cada vez qeu presionemos el boton parecera que nuestra aplicacion se trabo
    ScaffoldMessenger.of(context).clearSnackBars();//este nos destruye los snackBars
    ScaffoldMessenger.of(context).showSnackBar(        
      SnackBar(
        content: const Text(
          'Hola Mundo'
        ),
        action: SnackBarAction(//este hara que cada vez que presionemos el ok el snackbar se cierre
          label: 'Ok', 
          onPressed: (){}
        ),
        duration: const Duration(//es la duracion que dura nuestro snack bars
          seconds: 2
        ),
      )
    );
  }
  //metodo que me va a regresar un dialogo personalizado
  //como parametro colcoaremos el build Context que es la informacion de nuestra aplicacion
  void openDialog(BuildContext context){
    showDialog(
      barrierDismissible: false,//esta te obliga a seleccionar uno de los botones del showDialog
      context: context, 
      //builder es algo que se construye en tiempo de ejecucion
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro'),
        content: const Text('Sunt id ex quis qui adipisicing ipsum. Excepteur eu duis adipisicing consectetur laboris fugiat aute esse sunt eu cupidatat aliqua pariatur proident. Anim cillum Lorem in nostrud exercitation id cillum cupidatat Lorem pariatur in ad labore. Labore enim proident ipsum anim adipisicing culpa deserunt qui ullamco. Proident nisi culpa consequat minim qui et aute eiusmod amet incididunt qui ullamco laborum duis.'),
        actions:[
          TextButton(
            onPressed: ()=> context.pop(), 
            child: const Text('Cancelar')
          ),
          FilledButton(
            onPressed: () => context.pop(), 
            child: const Text('Aceptar')
          )
        ]
      )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SnackBars y Dialogos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children:<Widget>[
                    const Text('Laboris amet anim adipisicing fugiat aute duis exercitation elit qui quis reprehenderit laborum nostrud dolor. Mollit commodo fugiat dolore sit eu mollit reprehenderit sunt nisi enim labore eiusmod. Esse aute id proident sit minim cupidatat qui quis. Ut deserunt cillum eiusmod minim nostrud commodo deserunt ea. Dolor proident dolore reprehenderit ullamco dolore enim.')
                  ]
                );
              }, 
              child: const Text('Licencias Usadas')
            ),
            FilledButton.tonal(
              onPressed: (){
                openDialog(context);
              }, 
              child: const Text('Mostrar dialogo')
            )
          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => showCustomSnackbar(context),
        label: const Text('Mostrar SnackBars'),
        icon: const Icon(Icons.remove_red_eye_outlined),
      )
    );
  }
}