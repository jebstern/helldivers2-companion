import "package:freezed_annotation/freezed_annotation.dart";

part "warbond_item.freezed.dart";

/// Represents a warbond item in the game.
@freezed
abstract class WarbondItem with _$WarbondItem {
  /// Creates a [WarbondItem].
  const factory WarbondItem({
    /// The name of the warbond.
    @Default("") String name,

    /// The path to the image representing the warbond.
    @Default("") String imagePath,

    /// The number of pages in the warbond.
    @Default(1) int pages,

    /// The display order of the warbond.
    @Default(1) int order,

    /// The cost of the warbond in Super Credits.
    @Default(1) int credits,

    /// Unique identifier for the warbond.
    @Default("") String id,
  }) = _WarbondItem;
}
