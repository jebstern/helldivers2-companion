import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

class BaseView extends ConsumerStatefulWidget {
  const BaseView({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends ConsumerState<BaseView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[const SizedBox(height: 16), widget.child],
        ),
      ),
    );
  }
}
