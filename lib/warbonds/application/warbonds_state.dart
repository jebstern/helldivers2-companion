import "package:freezed_annotation/freezed_annotation.dart";

import "../domain/warbond_item.dart";

part "warbonds_state.freezed.dart";

/// Represents the state of the warbonds feature.
@freezed
abstract class WarbondsState with _$WarbondsState {
  /// Creates a [WarbondsState].
  const factory WarbondsState({
    /// The list of available warbonds.
    @Default(<WarbondItem>[]) List<WarbondItem> warbonds,
  }) = _WarbondsState;
}
