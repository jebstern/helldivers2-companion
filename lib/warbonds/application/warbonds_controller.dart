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
  WarbondsController() {
    _listenToWarbondUpdates();
  }

  /// The current state of warbonds, exposed as a signal.
  final FlutterSignal<WarbondsState> state = signal<WarbondsState>(
    const WarbondsState(),
  );

  void _listenToWarbondUpdates() {
    final FirebaseFirestore db = FirebaseFirestore.instance;

    final CollectionReference<Map<String, dynamic>> newsCollection = db
        .collection("warbonds");
    newsCollection.snapshots().listen(
      (QuerySnapshot<Map<String, dynamic>> event) {
        List<WarbondItem> warbondItems = <WarbondItem>[];

        final List<Map<String, dynamic>> documents = event.docs
            .map((QueryDocumentSnapshot<Map<String, dynamic>> e) => e.data())
            .toList();

        for (final Map<String, dynamic> element in documents) {
          String name = "";
          String imagePath = "";
          int pages = 1;
          int order = 1;
          int credits = 1;

          try {
            name = element["name"] as String;
            imagePath = element["imagePath"] as String;
            order = element["order"] as int;
            pages = element["pages"] as int;
            credits = element["credits"] as int;
          } catch (error) {
            hdLogger.warning(
              "Error parsing data:"
              ' (element["name"]: ${element["name"]}),'
              ' (element["imagePath"]: ${element["imagePath"]})'
              ' (element["order"]: ${element["order"]}),'
              ' (element["pages"]: ${element["pages"]}),'
              ' (element["credits"]: ${element["credits"]}),'
              " Error: $error",
            );
          }

          warbondItems.add(
            WarbondItem(
              imagePath: imagePath,
              name: name,
              pages: pages,
              order: order,
              credits: credits,
            ),
          );
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

  void _updateState(List<WarbondItem> warbondItems) {
    state.value = state.value.copyWith(warbonds: warbondItems);
  }
}
