import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const String name = 'ui_controls_screen';
  const UiControlsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.lightBlue.shade50,
        appBar: AppBar(
          title: Text('UI Controls',style: textTheme.bodyMedium),
          backgroundColor: colorTheme.primary
        ),
        body: const _UiControlsView());
  }
}


class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}
enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  //este bool controlara el Switch si estara en true o en false
  bool isDeveloper = true;
  //este Transportetion le colocaremos por defecto para que empieze en el valor car
  Transportation selectedTransportacion = Transportation.car;
  //cos creamos valores para nuestro check Box
  bool desayuno = false;
  bool almuerzo = false;
  bool cena = false;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics:
          const ClampingScrollPhysics(), //este es para que haga el movimiento de rebote
      children: [
        SwitchListTile(
            title: const Text('Developer Mode'),
            subtitle: const Text('Controles adicionales',style:TextStyle(color: Colors.black38)),
            value: isDeveloper, //este es el que cambia el valor del switch
            onChanged: (value) {
              //value es el valor del switch que nos servira para poder implementar nuestra logica
              setState(() {
                isDeveloper =
                    !isDeveloper; //isDeveloper sera igual al valor opuesto de isDeveloper
              });
            }),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          subtitle: Text('$selectedTransportacion'),
          children: <Widget>[
            RadioListTile(
                title: const Text('Carro'),
                subtitle: const Text('Viajar por carro'),
                value: Transportation.car,
                groupValue: selectedTransportacion,
                onChanged: (value) => setState(() {
                      selectedTransportacion = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('Bote'),
                subtitle: const Text('Viajar por bote'),
                value: Transportation.boat,
                groupValue: selectedTransportacion,
                onChanged: (value) => setState(() {
                      selectedTransportacion = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('Avion'),
                subtitle: const Text('Viajar por Avion'),
                value: Transportation.plane,
                groupValue: selectedTransportacion,
                onChanged: (value) => setState(() {
                      selectedTransportacion = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('Submarino'),
                subtitle: const Text('Viajar por submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportacion,
                onChanged: (value) => setState(() {
                      selectedTransportacion = Transportation.submarine;
                    }))
          ],
        ),
        CheckboxListTile(
          title: const Text('Desayuno'),
          subtitle: const Text('Marque si quiere desayuno'),
          value: desayuno, 
          onChanged: (value)=>setState(() {
            desayuno = !desayuno;
          })
        ),
        CheckboxListTile(
          title: const Text('Almuerzo'),
          subtitle: const Text('Marque si quiere almuerzo'),
          value: almuerzo, 
          onChanged: (value) => setState(() {
            almuerzo = !almuerzo;
          })
        ),
        CheckboxListTile(
          title: const Text('Cena'),
          subtitle: const Text('Marque si quiere cena'),
          value: cena, 
          onChanged: (value) => setState(() {
            cena = !cena;
          })
        ),
        const SizedBox(height: 50)
      ],
    );
  }
}
