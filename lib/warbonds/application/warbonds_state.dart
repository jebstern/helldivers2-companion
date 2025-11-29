import "package:freezed_annotation/freezed_annotation.dart";

import "../domain/warbond_item.dart";

part "warbonds_state.freezed.dart";

@freezed
abstract class WarbondsState with _$WarbondsState {
  const factory WarbondsState({
    @Default(<WarbondItem>[]) List<WarbondItem> warbonds,
  }) = _WarbondsState;
}
