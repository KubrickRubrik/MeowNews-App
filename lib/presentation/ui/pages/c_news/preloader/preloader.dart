import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:provider/provider.dart';

class PreloaderContent extends StatelessWidget {
  const PreloaderContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<NewsProvider, ActionStatus>(
      selector: (_, Model) => Model.status.statusPreload,
      builder: (_, statusPreload, __) {
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.ease,
          top: (statusPreload == ActionStatus.isAction) ? 32 : -64,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(12),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 2,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 200),
                sizeCurve: Curves.ease,
                crossFadeState: (statusPreload == ActionStatus.isDone) ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                firstChild: const Center(),
                secondChild: const _Spinner(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Spinner extends StatefulWidget {
  const _Spinner({super.key});

  @override
  State<_Spinner> createState() => _SpinnerState();
}

class _SpinnerState extends State<_Spinner> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Image.asset(ImagesApp.preloaderLight));
  }
}
