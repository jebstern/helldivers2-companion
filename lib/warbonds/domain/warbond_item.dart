import "package:freezed_annotation/freezed_annotation.dart";

part "warbond_item.freezed.dart";

/// Represents a warbond item in the game.
@freezed
abstract class WarbondItem with _$WarbondItem {
  /// Creates a [WarbondItem].
  const factory WarbondItem({
    @Default("") String name,
    @Default("") String imagePath,
    @Default(1) int pages,
    @Default(1) int order,
    @Default(1) int credits,
  }) = _WarbondItem;
}
