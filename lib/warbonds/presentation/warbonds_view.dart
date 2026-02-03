import "package:flutter/material.dart";

import "../../core/presentation/base_view.dart";
import "../../main.dart" show di;
import "../application/warbonds_controller.dart";
import "../application/warbonds_state.dart";
import "../domain/warbond_item.dart";
import "warbond_card.dart";

class WarbondsView extends StatefulWidget {
  const WarbondsView({super.key});

  @override
  State<WarbondsView> createState() => _WarbondsViewState();
}

class _WarbondsViewState extends State<WarbondsView> {
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
    final WarbondsController controller = di<WarbondsController>();
    final WarbondsState warbondsState = controller.state.value;

    return Column(
      spacing: 32,
      children: warbondsState.warbonds.map((WarbondItem e) {
        final WarbondItem warbondItem = e;
        return WarbondCard(warbondItem: warbondItem);
      }).toList(),
    );
  }
}
