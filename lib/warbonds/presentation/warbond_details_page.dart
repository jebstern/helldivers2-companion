import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../domain/warbond_item.dart";

class WarbondDetailsPage extends StatelessWidget {
  const WarbondDetailsPage({required this.warbondItem, super.key});

  final WarbondItem warbondItem;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    return FScaffold(
      header: FHeader(
        suffixes: <Widget>[
          FHeaderAction(
            icon: const Icon(FIcons.x),
            onPress: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
              tag: warbondItem.imagePath,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: warbondItem.imagePath,
                  placeholder: (BuildContext context, String url) =>
                      const CircularProgressIndicator(),
                  errorWidget:
                      (BuildContext context, String url, Object error) =>
                          const Icon(Icons.error),
                ),
              ),
            ),
            Hero(
              tag: warbondItem.name,
              child: Text(
                warbondItem.name,
                textAlign: TextAlign.center,
                style: typography.xl3,
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
