import 'package:flutter/material.dart';
import 'package:news_test/core/config/image.dart';
import 'package:news_test/presentation/ui/components/extensions/econtext.dart';
import 'package:news_test/presentation/ui/components/icons.dart';

class ItemSettingsInfo extends StatefulWidget {
  const ItemSettingsInfo({super.key});

  @override
  State<ItemSettingsInfo> createState() => ItemSettingsInfoState();
}

class ItemSettingsInfoState extends State<ItemSettingsInfo> {
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
                IconsApp.info,
                size: 22,
              ),
            ),
          ),
          Expanded(
            child: Text(
              context.lcz.infoSettings,
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
    return SingleChildScrollView(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(ImagesApp.launch),
              const SizedBox(height: 8),
              Text(
                context.lcz.infoSettingsDescription,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 1.3,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
