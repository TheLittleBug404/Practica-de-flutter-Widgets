import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String name = 'progress_screen'; 
  const ProgressScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Progress Indicator"),
      ),
      body: const _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 30),
          Text("Circular Progress Indicator"),
          SizedBox(height: 30),
          CircularProgressIndicator(//este progress sera infinito
            strokeWidth: 2,//este ajusta lo gruesa o delgado de la linea 
          ),
          SizedBox(height: 30),
          Text('Circular y linear Progress Indicator controlado'),
          SizedBox(height:20),
          _ControlerProgressIndicator(),
          SizedBox(height: 20)
        ],
      ),
    );
  }
}

//controler progress indicator
class _ControlerProgressIndicator extends StatelessWidget {
  const _ControlerProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(//stream builder es algo que se va a construir en tiempo de ejecucion
      stream: Stream.periodic(const Duration(milliseconds: 200),(value){
        return (value*2)/100;
      }).takeWhile((value) => value<100),
      builder: (context,snapshot){
        final progressValue = snapshot.data ?? 0;
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child:Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              CircularProgressIndicator(
                value: progressValue,
                strokeWidth: 2,
                backgroundColor: Colors.black12,
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue, //este es el valor que me indica que el progreso esta en cero
                )
              )
            ]
          )
        );
      }, 
    );
  }
}