import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreens extends StatefulWidget {
  const InfiniteScrollScreens({super.key});

  @override
  State<InfiniteScrollScreens> createState() => _InfiniteScrollScreensState();
}

class _InfiniteScrollScreensState extends State<InfiniteScrollScreens> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();

  bool isLoading = false;

  bool isMounted = true;

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      double currentScroll = scrollController.position.pixels;
      double maxScroll = scrollController.position.maxScrollExtent;

      if ((currentScroll + 500) >= maxScroll) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    moveScrollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

Future<void> onRefresh() async {
isLoading = true;
setState(() {}); 

await Future.delayed(Duration(seconds: 3));

if(!isMounted) return;

final lastIds = imagesIds.last;
imagesIds.clear();
imagesIds.add(lastIds + 1);
addFiveImages();
isLoading = false;
setState(() {}); 

}

void moveScrollToBottom(){
  if( scrollController.position.pixels + 100 <= scrollController.position.maxScrollExtent) return;
    
    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: Duration(milliseconds: 250),
      curve: Curves.fastOutSlowIn
    );
}


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh:onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (BuildContext context, int index) {
              return FadeInImage(
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 300,
                  placeholder: AssetImage('assets/images/jar-loading.gif'),
                  image: NetworkImage(
                      "https://picsum.photos/id/${imagesIds[index]}/500/300"));
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading 
            ? SpinPerfect(
                infinite: true,
                child: const Icon(Icons.refresh_outlined)) 
            : const Icon(Icons.arrow_back) 
            
      ),
    );
  }
}
