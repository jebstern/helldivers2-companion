import "package:cached_network_image/cached_network_image.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";

import "../../core/presentation/clickable_links_text.dart";
import "../../core/utils/app_extensions.dart";
import "../domain/news_article.dart";

class NewsArticlePage extends StatelessWidget {
  const NewsArticlePage({required this.newsArticle, super.key});

  final NewsArticle newsArticle;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    return FScaffold(
      header: FHeader(
        title: Text(newsArticle.date.toMMMDy),
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
              tag: newsArticle.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: newsArticle.imagePath,
                  placeholder: (BuildContext context, String url) =>
                      const CircularProgressIndicator(),
                  errorWidget:
                      (BuildContext context, String url, Object error) =>
                          const Icon(Icons.error),
                ),
              ),
            ),
            Text(
              newsArticle.title,
              textAlign: TextAlign.center,
              style: typography.xl3,
            ),
            const SizedBox(height: 12),
            ClickableLinksText(text: newsArticle.text),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }
}
