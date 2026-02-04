import "package:signals_flutter/signals_flutter.dart";
import "../../core/constants/titles_repository.dart";
import "../../core/utils/hd_logger.dart";
import "../domain/player_title.dart";
import "titles_state.dart";

import "../../main.dart" show di;

/// A controller that manages the titles state of the application.
class TitlesController {
  /// Creates a [TitlesController] and initializes its state.
  TitlesController({TitlesRepository? repository})
    : _repository = repository ?? di<TitlesRepository>() {
    _init();
  }

  final TitlesRepository _repository;

  /// The current state of titles, exposed as a signal.
  final FlutterSignal<TitlesState> state = signal<TitlesState>(
    const TitlesState(),
  );

  void _init() {
    // Sentinel 🛡️: Validate data from repository
    final List<PlayerTitle> titles = _repository.playerTitles.where((
      PlayerTitle title,
    ) {
      if (title.title.isEmpty || title.source.isEmpty) {
        hdLogger.warning("Skipping malformed title: $title");
        return false;
      }
      return true;
    }).toList();

    state.value = TitlesState(titles: titles);
  }
}
