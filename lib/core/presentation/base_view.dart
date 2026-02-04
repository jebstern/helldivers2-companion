import "package:flutter/material.dart";

class BaseView extends StatelessWidget {
  const BaseView({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[const SizedBox(height: 16), child],
        ),
      ),
    );
  }
}
