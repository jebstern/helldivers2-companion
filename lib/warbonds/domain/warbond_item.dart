import "package:freezed_annotation/freezed_annotation.dart";

part "warbond_item.freezed.dart";

@freezed
abstract class WarbondItem with _$WarbondItem {
  const factory WarbondItem({
    @Default("") String name,
    @Default("") String imagePath,
    @Default(1) int pages,
    @Default(1) int order,
    @Default(1) int credits,
  }) = _WarbondItem;
}
