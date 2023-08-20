import 'package:flutter/material.dart';
import 'package:news_test/presentation/manager/session/provider.dart';
import 'package:news_test/presentation/ui/components/icons.dart';
import 'package:provider/provider.dart';

/// Button Settings
class ButtonSettingsNews extends StatelessWidget {
  const ButtonSettingsNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //! Settings
        InkWell(
          onTap: () {
            context.read<SessionProvider>().setViewMenuSettings();
          },
          child: Container(
            width: 35,
            alignment: Alignment.center,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Icon(
                IconsApp.settings,
                size: 24,
                color: Color(0xFFEBF2F6),
              ),
            ),
          ),
        ),
        const SizedBox(width: 7),
      ],
    );
  }
}
