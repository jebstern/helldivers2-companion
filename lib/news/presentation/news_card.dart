import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../../core/utils/app_extensions.dart";
import "../domain/news_article.dart";

class NewsCard extends StatelessWidget {
  const NewsCard({required this.newsArticale, this.onTap, super.key});

  final NewsArticle newsArticale;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    final String text = newsArticale.text.length > 100
        ? "${newsArticale.text.substring(0, 100)}..."
        : newsArticale.text;

    return GestureDetector(
      onTap: onTap,
      child: CachedNetworkImage(
        imageUrl: newsArticale.imagePath,
        imageBuilder:
            (BuildContext context, ImageProvider<Object> imageProvider) =>
                FCard(
                  image: Hero(
                    tag: newsArticale.date.toIso8601String(),
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
                  title: Text(newsArticale.title),
                  subtitle: Text(
                    _getSubtitle(),
                    style: typography.sm.copyWith(
                      color: newsArticale.read ? null : Colors.green,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(text, style: typography.sm),
                  ),
                ),

        placeholder: (BuildContext context, String url) =>
            const CircularProgressIndicator(),
        errorWidget: (BuildContext context, String url, Object error) =>
            const Icon(Icons.error),
      ),
    );
  }

  String _getSubtitle() {
    String date = newsArticale.date.toMMMDy;

    if (!newsArticale.read) {
      date = "$date - Unread";
    }

    return date;
  }
}
