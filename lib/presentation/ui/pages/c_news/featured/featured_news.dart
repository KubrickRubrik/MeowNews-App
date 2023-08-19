import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/settings/settings.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/not_available/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/preload/content.dart';
import 'package:news_test/presentation/ui/pages/c_news/featured/news_bar.dart/options/options.dart';
import 'package:provider/provider.dart';

class SectionFeaturedNews extends StatelessWidget {
  const SectionFeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      floating: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      toolbarHeight: 0,
      collapsedHeight: 10,
      expandedHeight: MediaQuery.of(context).size.height / 4 + 56,
      flexibleSpace: FlexibleSpaceBar(
        background: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(horizontal: 4),
            constraints: const BoxConstraints(maxWidth: 600),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            clipBehavior: Clip.hardEdge,
            child: const Stack(
              children: [
                //? Switch content
                SwitchContentFeaturedNews(),
                //? Bar options
                BarOptions(),
              ],
            ),
          ),
        ),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
      ),
    );
  }
}

// Switch content
class SwitchContentFeaturedNews extends StatelessWidget {
  const SwitchContentFeaturedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<NewsProvider, bool>(
        selector: (_, Model) => Model.pageData.newBar.statusOpen,
        builder: (_, statusOpen, child) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.ease,
            crossFadeState: (!statusOpen) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: child!,
            layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    key: bottomChildKey,
                    child: bottomChild,
                  ),
                  Positioned(
                    key: topChildKey,
                    child: topChild,
                  ),
                ],
              );
            },
            secondChild: const BarSettions(),
          );
        },
        child: const _FeaturedNews(),
      ),
    );
  }
}

class _FeaturedNews extends StatelessWidget {
  const _FeaturedNews();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 60, top: 4),
      height: (MediaQuery.of(context).size.height / 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: Selector<NewsProvider, StatusSection>(
        selector: (_, Model) => Model.status.featured.statusSection,
        builder: (_, status, child) {
          return switch (status) {
            StatusSection.isNoContent => const NotAvailableFeaturedContent(),
            StatusSection.isLoadContent => const PreloadFeaturedContent(),
            _ => child!,
          };
        },
        child: const AvailableFeatureContent(),
      ),
    );
  }
}
