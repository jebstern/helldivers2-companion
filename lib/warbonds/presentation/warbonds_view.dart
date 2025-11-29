import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../core/presentation/base_view.dart";
import "../application/warbonds_controller.dart";
import "../application/warbonds_state.dart";
import "../domain/warbond_item.dart";
import "warbond_card.dart";

class WarbondsView extends ConsumerStatefulWidget {
  const WarbondsView({super.key});

  @override
  ConsumerState<WarbondsView> createState() => _WarbondsViewState();
}

class _WarbondsViewState extends ConsumerState<WarbondsView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 32),
          _buildBody(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildBody() {
    final WarbondsState warbondsState = ref.watch(warbondsControllerProvider);

    return Column(
      spacing: 32,
      children: warbondsState.warbonds.map((WarbondItem e) {
        final WarbondItem warbondItem = e;
        return WarbondCard(warbondItem: warbondItem);
      }).toList(),
    );
  }
}
