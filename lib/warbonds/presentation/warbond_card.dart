// ignore_for_file: lines_longer_than_80_chars

import "dart:async";

import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../domain/warbond_item.dart";
import "warbond_details_page.dart";

class WarbondCard extends StatelessWidget {
  const WarbondCard({required this.warbondItem, super.key});

  final WarbondItem warbondItem;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    return GestureDetector(
      onTap: () => _onTap(context),
      child: CachedNetworkImage(
        imageUrl: warbondItem.imagePath,
        imageBuilder:
            (BuildContext context, ImageProvider<Object> imageProvider) =>
                FCard(
                  image: Hero(
                    tag: "image-${warbondItem.id}",
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                      height: 200,
                    ),
                  ),
                  title: Hero(
                    tag: "title-${warbondItem.id}",
                    child: Text(warbondItem.name),
                  ),
                  subtitle: Text("${warbondItem.credits} Claimable credits"),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      "${warbondItem.pages} Pages of goodies",
                      style: typography.xs,
                    ),
                  ),
                ),

        placeholder: (BuildContext context, String url) =>
            const CircularProgressIndicator(),
        errorWidget: (BuildContext context, String url, Object error) =>
            const Icon(Icons.error),
      ),
    );
  }

  void _onTap(BuildContext context) {
    unawaited(
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) =>
              WarbondDetailsPage(warbondItem: warbondItem),
        ),
      ),
    );
  }
}
