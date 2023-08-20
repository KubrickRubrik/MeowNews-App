import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/session/provider.dart';
import 'package:news_test/presentation/ui/pages/c_news/settings/widgets/item_info.dart';
import 'package:news_test/presentation/ui/pages/c_news/settings/widgets/item_language.dart';
import 'package:news_test/presentation/ui/pages/c_news/settings/widgets/item_theme.dart';
import 'package:provider/provider.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Selector<SessionProvider, bool>(
        selector: (_, Model) => Model.session.settings.isViewed,
        builder: (_, isViewMenu, child) {
          return AnimatedCrossFade(
            duration: const Duration(milliseconds: 300),
            sizeCurve: Curves.ease,
            crossFadeState: (!isViewMenu) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            firstChild: const Center(),
            secondChild: child!,
            layoutBuilder: (topChild, topChildKey, bottomChild, bottomChildKey) {
              // Used to avoid abrupt jumps between widgets.
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
          );
        },
        child: const _Menu(),
      ),
    );
  }
}

class _Menu extends StatelessWidget {
  const _Menu();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<SessionProvider>().setViewMenuSettings();
      },
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          color: Color(0x4C000000),
        ),
        alignment: Alignment.center,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Container(
            margin: const EdgeInsets.only(left: 50, right: 50, top: 70, bottom: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            clipBehavior: Clip.hardEdge,
            child: const SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemSettingsTheme(),
                  ItemSettingsLanguage(),
                  ItemSettingsInfo(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
