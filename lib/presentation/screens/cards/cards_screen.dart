import 'package:flutter/material.dart';
//nos creamos un listado de tarjetas

const cards =< Map<String,dynamic>>[
  {'elevation': 0.0, 'label': 'Elevation 0'},
  {'elevation': 1.0, 'label': 'Elevation 1'},
  {'elevation': 2.0, 'label': 'Elevation 2'},
  {'elevation': 3.0, 'label': 'Elevation 3'},
  {'elevation': 4.0, 'label': 'Elevation 4'},
  {'elevation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static  const  String name = 'card_screen';
  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards Screen',style: textTheme.bodyMedium),
        backgroundColor: colorTheme.primary
      ),
      body: const _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children:<Widget>[
          ...cards.map(
            (card) => _CardType1(
              labelC: card['label'], 
              elevationC: card['elevation']
            )
          ),
          ...cards.map(
            (card) => _CardType2(
              labelC: card['label'], 
              elevationC: card['elevation']
            )
          ),
          ...cards.map(
            (card) => _CardType3(
              labelC: card['label'], 
              elevationC: card['elevation']
            )
          ),
          ...cards.map(
            (card) => _CardType4(
              labelC: card['label'], 
              elevationC: card['elevation']
            )
          ),
          const SizedBox(height: 50)
        ]
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String labelC;
  final double elevationC;
  const _CardType1({
    required this.labelC,
    required this.elevationC
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevationC,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: <Widget>[
            Align(//este alig nos lo llevara los iconos a la parte derecha
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              ),
            ),
            Align(//este align me llevara el label a la parte izquierda
              alignment: Alignment.bottomLeft,
              child: Text(labelC),
            )
          ],
        ),
      ),
    );
  }
}

//esta sera la tarjeta con borde esta tarjeta sera con un color lleno
class _CardType2 extends StatelessWidget {
  final String labelC;
  final double elevationC;
  const _CardType2({
    required this.labelC,
    required this.elevationC
  });

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    return Card(
      shape: RoundedRectangleBorder(//si no le especificamos ningun borde este sera cuadrado
      borderRadius: const BorderRadius.all(Radius.circular(20)),//este nos da el borde de nuestra tarjeta de forma circular 
        side: BorderSide(
          color: colorsTheme.outline
        )
      ),
      elevation: elevationC,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: <Widget>[
            Align(//este alig nos lo llevara los iconos a la parte derecha
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              ),
            ),
            Align(//este align me llevara el label a la parte izquierda
              alignment: Alignment.bottomLeft,
              child: Text('$labelC - outline'),
            )
          ],
        ),
      ),
    );
  }
}

//esta sera la tarjeta con fondo lleno
class _CardType3 extends StatelessWidget {
  final String labelC;
  final double elevationC;
  const _CardType3({
    required this.labelC,
    required this.elevationC
  });

  @override
  Widget build(BuildContext context) {
    final colorsTheme = Theme.of(context).colorScheme;
    return Card(
      color: colorsTheme.surfaceVariant,
      elevation: elevationC,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: <Widget>[
            Align(//este alig nos lo llevara los iconos a la parte derecha
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              ),
            ),
            Align(//este align me llevara el label a la parte izquierda
              alignment: Alignment.bottomLeft,
              child: Text('$labelC - Filled'),
            )
          ],
        ),
      ),
    );
  }
}

//estas tarjetas seran con imagenes
class _CardType4 extends StatelessWidget {
  final String labelC;
  final double elevationC;
  const _CardType4({
    required this.labelC,
    required this.elevationC
  });

  @override
  Widget build(BuildContext context) {
    //final colorsTheme = Theme.of(context).colorScheme;
    return Card(
      clipBehavior: Clip.hardEdge,//este evita que los hijos se salgan del contenido de su padre
      elevation: elevationC,
      child: Stack(
        children: <Widget>[
          Image.network(
            'https://cdn-images-1.medium.com/v2/resize:fit:1024/0*vowtRZE_wvyVA7CB',
            height: 200,
            width: double.infinity,
            fit:BoxFit.cover//con este se adapta al tamaño de las dimensiones del padre
          ),
          Align(//este alig nos lo llevara los iconos a la parte derecha
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20))
              ),
              child: IconButton(
                onPressed: (){},
                icon: const Icon(Icons.more_vert_outlined)
              ),
            ),
          ),
        ],
      ),
    );
  }
}