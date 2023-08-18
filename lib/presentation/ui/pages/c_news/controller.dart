import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/pages/c_news/appbar/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/featured_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/latest_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/bar.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/options/options.dart';
import 'package:news_test/presentation/ui/pages/c_news/news_bar.dart/settings/settings.dart';
import 'package:news_test/presentation/ui/pages/c_news/preloader/preloader.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => locator<NewsProvider>(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF37474F),
            centerTitle: false,
            title: Text(
              context.lcz.titleNewsPage,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            actions: const [
              ButtonettingViewedNews(),
            ],
          ),
          body: Align(
            // For more convenient viewing in the desktop
            // version without settings, use Align nad ConstrainedBox
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 600,
              ),
              child:
                  // const Stack(
                  //   children: [
                  //     //? Main content
                  //     Flex(
                  //       direction: Axis.vertical,
                  //       children: [
                  //         SizedBox(height: 8),
                  //         //? Featured news (horizontal scrolllist)
                  //         FeaturedNews(),
                  //         SizedBox(height: 4),
                  //         //? Set news and search options.
                  //         NewsOptionsBar(),
                  //         SizedBox(height: 8),
                  //         //? Featured news (vertical scrolllist)
                  //         LatestNews(),
                  //       ],
                  //     ),
                  //     //? Spinner for open item news
                  //     PreloaderContent(),
                  //   ],
                  // ),
                  CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: false, //  при прокрутке вверх, картинка скрывается, но AppBar c title остается прикрепленным к верху
                    stretch: true, // при прокрутке растягивает блок с картинкой до полной видимости картинки
                    floating: true, //
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    toolbarHeight: 0, // размер AppBar, который не меняется
                    collapsedHeight: 10, // минимальный неизменный размер картинки при сворачивании списка, когда выплнили прокрутку списка
                    expandedHeight: MediaQuery.of(context).size.height / 4 + 56, // максимально растянутая картинка когда прокрутка списка равна 0
                    // title: const Text("Страница 1", style: TextStyle(fontSize: 20)),
                    flexibleSpace: const FlexibleSpaceBar(
                      background: Column(
                        children: [
                          //? Featured news (horizontal scrolllist)
                          FeaturedNews(),
                          //? Set news and search options.
                          BarOptions(),
                        ],
                      ),
                      centerTitle: true,
                      collapseMode: CollapseMode.pin,
                    ),
                  ),
                  // SliverList.list(children: [
                  //     const BarSettions(),
                  //       const SizedBox(height: 8),
                  //       //? Latest news (vertical scrolllist)
                  //       const LatestNews(),
                  //     ],
                  // ]),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        const BarSettions(),
                        const SizedBox(height: 8),
                        //? Latest news (vertical scrolllist)
                        const LatestNews(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

// CustomScrollView(
              //   slivers: [
              //     SliverAppBar(
              //       pinned: false, //  при прокрутке вверх, картинка скрывается, но AppBar c title остается прикрепленным к верху
              //       stretch: true, // при прокрутке растягивает блок с картинкой до полной видимости картинки
              //       floating: true, //
              //       backgroundColor: Colors.transparent,
              //       elevation: 0,
              //       toolbarHeight: 0, // размер AppBar, который не меняется
              //       collapsedHeight: 10, // минимальный неизменный размер картинки при сворачивании списка, когда выплнили прокрутку списка
              //       expandedHeight: MediaQuery.of(context).size.height / 4 + 56, // максимально растянутая картинка когда прокрутка списка равна 0
              //       // title: const Text("Страница 1", style: TextStyle(fontSize: 20)),
              //       flexibleSpace: const FlexibleSpaceBar(
              //         background: Column(
              //           children: [
              //             //? Featured news (horizontal scrolllist)
              //             FeaturedNews(),
              //             //? Set news and search options.
              //             BarOptions(),
              //           ],
              //         ),
              //         centerTitle: true,
              //         collapseMode: CollapseMode.pin,
              //       ),
              //     ),
              //     SliverList(
              //       delegate: SliverChildListDelegate(
              //         [
              //           const BarSettions(),
              //           const SizedBox(height: 8),
              //           //? Latest news (vertical scrolllist)
              //           const LatestNews(),
              //         ],
              //       ),
              //     ),
              //   ],
              // ),