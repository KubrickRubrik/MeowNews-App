import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/pages/news/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/icons.dart';
import 'package:news_test/presentation/ui/components/toast.dart';
import 'package:provider/provider.dart';

class ButtonettingViewedNews extends StatelessWidget {
  const ButtonettingViewedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.hardEdge,
      child: Selector<NewsProvider, StatusViewed>(
          selector: (_, Model) => Model.status.statusSetViewed,
          builder: (_, statusSetViewed, __) {
            Widget widget;
            if (statusSetViewed == StatusViewed.isLoadContent) {
              widget = const CircularProgressIndicator.adaptive(
                backgroundColor: Colors.white,
              );
            } else if (statusSetViewed == StatusViewed.isNotViewed) {
              widget = const Icon(
                IconsApp.completed,
                color: Color(0xFF90A4AE),
                size: 30,
              );
            } else {
              widget = const Icon(
                IconsApp.completed,
                color: Color(0xFF65F436),
                size: 30,
              );
            }
            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  if (statusSetViewed == StatusViewed.isViewed) {
                    ToastMassage.toast(context, context.lcz.allViewedToast, code: TypeMassage.warning);
                  } else {
                    context.read<NewsProvider>().setAllNewsViewed().then((isDone) {
                      if (isDone == null) return;
                      if (!isDone) {
                        ToastMassage.toast(context, context.lcz.actionNotViewedToast, code: TypeMassage.error);
                      } else {
                        ToastMassage.toast(context, context.lcz.actionViewedToast, code: TypeMassage.good);
                      }
                    });
                  }
                },
                child: widget,
              ),
            );
          }),
    );
  }
}
