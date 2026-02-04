import "package:freezed_annotation/freezed_annotation.dart";
import "../domain/player_title.dart";

part "titles_state.freezed.dart";

/// Represents the state of the titles view.
@freezed
abstract class TitlesState with _$TitlesState {
  /// Creates a [TitlesState].
  const factory TitlesState({
    /// The list of available titles.
    @Default(<PlayerTitle>[]) List<PlayerTitle> titles,
  }) = _TitlesState;
}
