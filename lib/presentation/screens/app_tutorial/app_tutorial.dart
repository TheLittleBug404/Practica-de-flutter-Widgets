import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//creamos la clase sladeINfo
class SlideInfo{
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
    this.title,
    this.caption,
    this.imageUrl
  );
}
final slides = <SlideInfo>[
  SlideInfo('Linux', 'Fugiat velit dolor sit anim duis qui in id. In duis anim veniam dolore reprehenderit tempor ad laboris adipisicing duis nulla est irure. Duis aliquip fugiat commodo elit culpa.', 'assets/images/1.png'),
  SlideInfo('Flutter', 'Id ex in esse nulla sint veniam mollit eiusmod deserunt fugiat aliqua ullamco esse veniam. Exercitation qui id labore est ad elit nulla. Amet nulla ad est enim mollit cupidatat labore tempor cillum excepteur consequat culpa nulla enim. Pariatur sint cupidatat nostrud exercitation pariatur sint et irure in. Proident laboris veniam anim reprehenderit aliquip sit amet duis magna qui culpa minim deserunt officia.', 'assets/images/2.png'),
  SlideInfo('Kotlin', 'Commodo amet qui voluptate aute nulla pariatur laboris officia veniam. Veniam occaecat est nulla consectetur exercitation do aute in nulla incididunt. Elit non aute sint amet ut Lorem aute commodo duis labore proident. Adipisicing pariatur exercitation adipisicing esse et aliqua aute culpa nostrud excepteur. Commodo dolore excepteur amet adipisicing consectetur do do incididunt minim voluptate nostrud qui proident. Ut enim dolor exercitation reprehenderit mollit eiusmod anim eiusmod exercitation. Aliquip laboris voluptate reprehenderit eu minim cillum ipsum est ut ea consectetur sunt cupidatat tempor.', 'assets/images/3.png'),
  SlideInfo('Java', 'Cupidatat pariatur eu reprehenderit ex. Commodo anim elit aute elit aute. Elit non culpa esse dolore aliqua sunt Lorem exercitation dolore. Velit dolor elit irure incididunt ex enim quis irure. Minim ex reprehenderit officia do do. Eiusmod ad ut amet excepteur est irure velit aute duis.', 'assets/images/4.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen'; 
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  late final PageController pageViewController = PageController();
  bool endReached = false;
  //colocamos el initState
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReached && page >= (slides.length - 1.0)){
        setState(() {
          endReached = true;
        });
      }
    });
  }
  //aca llamaremos al dispose de los pageVIewController para que limpie los listener
  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides.map(
              (slideInfo) => _Slide(
                title: slideInfo.title, 
                caption: slideInfo.caption, 
                imageUrl: slideInfo.imageUrl
              )
            ).toList(), 
          ),
          //este sera nuestro boton de Skip para saltar el tutorial
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              child: const Text('Saltar'),
              onPressed: () => context.pop()
            )
          ),
          endReached ? 
            Positioned(
              bottom: 30,
              right: 30,
              child: FilledButton(
                onPressed: () => context.pop(),
                child: const Text('Comenzar'),
              )
            ): const SizedBox()
        ],
      ),
    );
  }
}

//este va a recibir la informacion que nosotros tengamos dle slide
class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl
  });
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle
            ),
            const SizedBox(height: 10),
            Text(
              caption,
              style: captionStyle,
            )
          ]
        ),
      ),
    );
  }
}