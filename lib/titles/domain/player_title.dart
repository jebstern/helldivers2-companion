class PlayerTitle {
  const PlayerTitle({
    required this.title,
    required this.source,
    this.buyable = false,
    this.level,
  });
  final String title;
  final String source;
  final bool buyable;
  final int? level;

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      "PlayerTitle(title: $title, source: $source, buyable: $buyable, level: $level)";
}
