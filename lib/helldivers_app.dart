import "package:flutter/material.dart"
    show BuildContext, MaterialApp, StatelessWidget, Widget;
import "package:forui/forui.dart" show FTheme, FThemes;

import "screen_wrapper.dart";

class HelldiversApp extends StatelessWidget {
  const HelldiversApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    builder: (BuildContext context, Widget? child) =>
        FTheme(data: FThemes.zinc.dark, child: child!),
    debugShowCheckedModeBanner: false,
    home: const ScreenWrapper(),
  );
}
