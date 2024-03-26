import 'dart:math' show Random;// de esta libreria que es el math solo usaremos el Random que noes generara numero aleatorios
import 'package:flutter/material.dart';

class AnimatedScreen extends StatefulWidget {
  static const String name = 'animated_screen'; 
  const AnimatedScreen({super.key});
  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  //estos seran los valores iniciales de nuestra animacion
  double widthInitial = 50;
  double heightInitial = 50;
  Color colorInitial = Colors.indigo;
  double borderRadiusInitial = 10.0;
  //funcion 
  void changeShape(){
    final random  = Random();
    //le damos un valor randon a nuestro widthInitial el valor maximo sera de 300 y el minimo de 50
    widthInitial = random.nextInt(300) + 50;
    heightInitial = random.nextInt(400) +30;
    borderRadiusInitial = random.nextInt(130) +5;
    colorInitial = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container')
      ),
      body: Center(
        child: AnimatedContainer(
          duration:const Duration(seconds: 2) ,//este sera la animacion del contenedor
          curve: Curves.bounceIn,//este es el tipo de animacion que tendra nuestro Container animated
          width: widthInitial <=0 ? 0 : widthInitial,
          height: heightInitial <= 0 ? 0: heightInitial,
          decoration: BoxDecoration(
            color: colorInitial,
            borderRadius: BorderRadius.circular(borderRadiusInitial < 0 ? 0 : borderRadiusInitial)
          ),
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          changeShape();
        },
        child: const Icon(Icons.play_arrow_sharp),
      ),
    );
  }
}