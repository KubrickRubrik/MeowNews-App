import 'package:flutter/material.dart';
import 'package:news_test/presentation/locator/locator.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/pages/c_news/appbar/button.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/featured_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/latest/latest_news.dart';
import 'package:news_test/presentation/ui/pages/c_news/preloader/preloader.dart';
import 'package:provider/provider.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: locator<NewsProvider>(),
        child: Listener(
          onPointerDown: (_) {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.focusedChild?.unfocus();
            }
          },
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
            body: const Stack(
              children: [
                //? Main content
                _MainConntent(),
                //? Preload
                PreloaderContent(),
              ],
            ),
          ),
        ));
  }
}

class _MainConntent extends StatefulWidget {
  const _MainConntent();

  @override
  State<_MainConntent> createState() => _MainConntentState();
}

class _MainConntentState extends State<_MainConntent> {
  final scrollController = ScrollController();

  void listenScroll() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels != 0) {
        context.read<NewsProvider>().getLatestNews();
      }
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scrollController.addListener(listenScroll);
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(listenScroll);
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      slivers: [
        //? Featured news section.
        const SectionFeaturedNews(),
        //? Latest news section.
        SectionLatestNews(scrollController),
      ],
    );
  }
}
