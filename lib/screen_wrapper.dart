import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "news/presentation/news_view.dart";
import "settings/presentation/settings_view.dart";
import "titles/presentation/titles_view.dart";
import "warbonds/presentation/warbonds_view.dart";

class ScreenWrapper extends StatefulWidget {
  const ScreenWrapper({super.key});

  @override
  State<ScreenWrapper> createState() => _ScreenWrapperState();
}

class _ScreenWrapperState extends State<ScreenWrapper> {
  int _index = 0;

  static const List<Widget> _views = <Widget>[
    NewsView(),
    WarbondsView(),
    TitlesView(),
    SettingsView(),
  ];

  static const List<String> _titles = <String>[
    "Home",
    "Warbonds",
    "Titles",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return FScaffold(
      header: FHeader(
        title: Text(_titles[_index], textAlign: TextAlign.center),
      ),
      footer: FBottomNavigationBar(
        index: _index,
        onChange: (int index) => setState(() => _index = index),
        children: const <Widget>[
          FBottomNavigationBarItem(
            icon: Icon(FIcons.house),
            label: Text("Home"),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.banknote),
            label: Text("Warbonds"),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.ticket),
            label: Text("Titles"),
          ),
          FBottomNavigationBarItem(
            icon: Icon(FIcons.settings),
            label: Text("Settings"),
          ),
        ],
      ),
      child: IndexedStack(index: _index, children: _views),
    );
  }
}
