/// Represents a title that a player can earn or buy in the game.
class PlayerTitle {
  /// Creates a [PlayerTitle].
  const PlayerTitle({
    required this.title,
    required this.source,
    this.buyable = false,
    this.level,
  });

  /// The name of the title.
  final String title;

  /// The source or requirement to obtain the title.
  final String source;

  /// Whether the title is buyable.
  final bool buyable;

  /// The level required to obtain the title, if applicable.
  final int? level;

  @override
  String toString() =>
      // ignore: lines_longer_than_80_chars
      "PlayerTitle(title: $title, source: $source, buyable: $buyable, level: $level)";
}
