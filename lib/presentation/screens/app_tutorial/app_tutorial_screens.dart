import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
    'Busca la comida',
    'Encuentra tu comida favorita de la mejor manera',
    'assets/images/1.png',
  ),
  SlideInfo(
    'Entrega rapida',
    'Entrega rapida en tu puerta en 30 minutos',
    'assets/images/2.png',
  ),
  SlideInfo(
    'Disfruta de la comida',
    'Disfruta de la comida en tu casa',
    'assets/images/3.png',
  ),
];

class AppTutorialScreens extends StatefulWidget {
  const AppTutorialScreens({super.key});

  @override
  State<AppTutorialScreens> createState() => _AppTutorialScreensState();
}

class _AppTutorialScreensState extends State<AppTutorialScreens> {
  final PageController pageViewController = PageController();
  bool endReached = false;


  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

      // print("${pageViewController.page}");
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  final colors = Theme.of(context).colorScheme;

    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList()),
          Positioned(
              top: 50,
              right: 20,
              child: TextButton(
                  onPressed: () => context.pop(), child: Text('Salir'))),
                  Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Center(
              child: SmoothPageIndicator(
                controller: pageViewController,
                count: slides.length,
                effect: WormEffect(
                  dotHeight: 12,
                  dotWidth: 12,
                  activeDotColor: colors.primary,
                ),
              ),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 20,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(milliseconds: 300),
                    child: FilledButton(
                        onPressed: () => context.pop(), child: Text('Comenzar')),
                  ))
              : SizedBox()
        ]));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyled = Theme.of(context).textTheme.titleLarge;
    final captionStyled = Theme.of(context).textTheme.bodyLarge;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage(imageUrl)),
              const SizedBox(height: 20),
              Text(title, style: titleStyled),
              const SizedBox(height: 10),
              Text(caption, style: captionStyled)
            ]),
      ),
    );
  }
}
