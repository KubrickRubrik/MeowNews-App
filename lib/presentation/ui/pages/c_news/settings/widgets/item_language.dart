import 'package:flutter/material.dart';
import 'package:news_test/core/config/entity.dart';
import 'package:news_test/presentation/manager/session/provider.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/icons.dart';
import 'package:news_test/presentation/ui/components/localization/controller.dart';
import 'package:provider/provider.dart';

class ItemSettingsLanguage extends StatefulWidget {
  const ItemSettingsLanguage({super.key});

  @override
  State<ItemSettingsLanguage> createState() => ItemSettingsLanguageState();
}

class ItemSettingsLanguageState extends State<ItemSettingsLanguage> {
  var isOpen = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      expandedHeaderPadding: const EdgeInsets.all(0),
      expansionCallback: (panelIndex, isExpanded) {
        isOpen = !isOpen;
        setState(() {});
      },
      children: [
        ExpansionPanel(
          isExpanded: isOpen,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return const _ItemHeader();
          },
          body: const _ItemBody(),
        ),
      ],
    );
  }
}

//! Header
class _ItemHeader extends StatelessWidget {
  const _ItemHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Flex(
        direction: Axis.horizontal,
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              child: const Icon(
                IconsApp.language,
                color: Color(0xFF745291),
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.languageSettings,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

//! Body
class _ItemBody extends StatelessWidget {
  const _ItemBody();

  @override
  Widget build(BuildContext context) {
    return Selector<SessionProvider, AvailableAppLocale>(
      selector: (_, Model) => Model.session.settings.locale,
      builder: (_, locale, __) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: LocalizationController.defaultLanguage.entries.map((e) {
            return InkWell(
              onTap: () {
                context.read<SessionProvider>().setSettings(locale: e.key);
              },
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  SizedBox(
                    height: 25,
                    width: 50,
                    child: Center(
                      child: Icon(
                        IconsApp.favorite,
                        color: (locale == e.key) ? const Color(0xFF00C110) : const Color(0xFF97ADB9),
                        size: 18,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        e.value.title,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
