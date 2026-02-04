import "package:flutter/material.dart";

import "../domain/news_article.dart";
import "news_card.dart";

class NewsList extends StatelessWidget {
  const NewsList({
    required this.articles,
    required this.onArticleTap,
    super.key,
  });

  final List<NewsArticle> articles;
  final void Function(NewsArticle) onArticleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 32,
      children: articles.map((NewsArticle e) {
        return NewsCard(
          newsArticle: e,
          onTap: () => onArticleTap(e),
        );
      }).toList(),
    );
  }
}
