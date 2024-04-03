import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'inifinite_screen'; 
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  //nos creamos una lista
  List<int> imagesIds = [1,2,3,4,5];
  final ScrollController scrollControler = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  @override
  void initState() {
    super.initState();
    scrollControler.addListener(() {
      //aca preguntamos si la posicion inicial sera igual a la posicion final 
      //scrollControler.position.pixels es la posicion inicial
      // scrollControler.position.maxScrollExten es la posiscion final
      if((scrollControler.position.pixels + 500) >= scrollControler.position.maxScrollExtent){
        //laod next page
        loadNextpage();
      }
    });
  }
  @override
  void dispose() {
    scrollControler.dispose();
    isMounted = false;
    super.dispose();
  }
  //funcion asincrona
  Future loadNextpage() async{
    if(isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;
    if(!isMounted) return;
    setState(() {});
    //todo: mover scroll
    moveScrollToBottom();
  }
  void addFiveImages(){
    final lastId = imagesIds.last;
    imagesIds.addAll(
      [1,2,3,4,5].map((e) => lastId + e)
    );
  }

  Future<void> onRefresh() async{
    await Future.delayed(const Duration(seconds: 3));
    if(!isMounted) return;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId +1);
    addFiveImages();
    setState(() {});
  }
  void moveScrollToBottom(){
    //solo cuando estamos cerca del final es en donde queremos disparar el movimiento
    if(scrollControler.position.pixels + 100 <= scrollControler.position.maxScrollExtent) return;

    scrollControler.animateTo(
      scrollControler.position.pixels + 120, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.fastOutSlowIn
    );
  }
  @override
  Widget build(BuildContext context) {
    ColorScheme colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      //builder va a saber cuando los elementos esten a punto de entrar en pantalla ya que esto sera un scroll infinite
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          //elonrefresh es lo que llamaremos cuando ya se tiene el trabajo
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollControler,
            itemCount: imagesIds.length,
            itemBuilder: (context, index){
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200,
                placeholder: const AssetImage('assets/images/pikachu.gif'), 
                image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/500/300')
                //image: NetworkImage('https://cdn-images-1.medium.com/max/1024/0*LtCDFBQudFeDS_f6'),
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: (!isLoading)
          ? FadeIn(
              child: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: colorTheme.primary,
              ),
            )
          : SpinPerfect(
              infinite: true,
                child: Icon(
                  Icons.refresh_rounded,
                  color: colorTheme.primary,
                ),
            )
      ),
    );
  }
}