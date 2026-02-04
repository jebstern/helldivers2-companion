import "package:cloud_firestore/cloud_firestore.dart";
import "package:signals_flutter/signals_flutter.dart";

import "../../core/utils/hd_logger.dart";
import "../domain/warbond_item.dart";
import "warbonds_state.dart";

/// A controller that manages the warbonds state of the application.
///
/// It listens to warbond updates from Firebase Firestore and handles sorting.
class WarbondsController {
  /// Creates a [WarbondsController] and starts listening to warbond updates.
  WarbondsController({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance {
    _listenToWarbondUpdates();
  }

  /// The current state of warbonds, exposed as a signal.
  final FlutterSignal<WarbondsState> state = signal<WarbondsState>(
    const WarbondsState(),
  );

  final FirebaseFirestore _firestore;

  void _listenToWarbondUpdates() {
    final CollectionReference<Map<String, dynamic>> newsCollection = _firestore
        .collection("warbonds");
    newsCollection.snapshots().listen(
      (QuerySnapshot<Map<String, dynamic>> event) {
        List<WarbondItem> warbondItems = <WarbondItem>[];

        final List<Map<String, dynamic>> documents = event.docs.map((
          QueryDocumentSnapshot<Map<String, dynamic>> e,
        ) {
          final Map<String, dynamic> data = e.data();
          data["id"] = e.id;
          return data;
        }).toList();

        for (final Map<String, dynamic> element in documents) {
          final WarbondItem? item = _parseWarbondItem(element);
          if (item != null) {
            warbondItems.add(item);
          }
        }

        warbondItems = _sortWarbondItems(warbondItems);
        _updateState(warbondItems);
      },
      onError: (Object? error) {
        hdLogger.severe("Error fetching news: $error");
      },
    );
  }

  List<WarbondItem> _sortWarbondItems(List<WarbondItem> warbondItems) {
    warbondItems.sort(
      (WarbondItem a, WarbondItem b) => a.order.compareTo(b.order),
    );

    return warbondItems;
  }

  /// Safely parses a [WarbondItem] from a Firestore document map.
  ///
  /// Returns null if parsing fails or mandatory fields are missing or malformed.
  WarbondItem? _parseWarbondItem(Map<String, dynamic> element) {
    try {
      final String id = element["id"] as String? ?? "";

      // Sentinel 🛡️: Validate data types and mandatory fields
      if (element["name"] is! String ||
          element["imagePath"] is! String ||
          element["order"] is! int ||
          element["pages"] is! int ||
          element["credits"] is! int ||
          id.isEmpty) {
        hdLogger.warning("Warbond item has malformed data or missing ID, skipping. ID: $id");
        return null;
      }

      return WarbondItem(
        name: element["name"] as String,
        imagePath: element["imagePath"] as String,
        order: element["order"] as int,
        pages: element["pages"] as int,
        credits: element["credits"] as int,
        id: id,
      );
    } catch (error, stackTrace) {
      hdLogger.severe("Error parsing warbond item", error, stackTrace);
      return null;
    }
  }

  void _updateState(List<WarbondItem> warbondItems) {
    state.value = state.value.copyWith(warbonds: warbondItems);
  }
}
