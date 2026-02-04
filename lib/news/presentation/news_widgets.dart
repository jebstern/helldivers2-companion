import "package:flutter/material.dart";

/// A widget that displays a loading indicator for the news view.
class NewsLoading extends StatelessWidget {
  /// Creates a [NewsLoading] widget.
  const NewsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// A widget that displays an error message for the news view.
class NewsError extends StatelessWidget {
  /// Creates a [NewsError] widget with the given [error] message.
  const NewsError({required this.error, super.key});

  /// The error message to display.
  final String error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Error: $error",
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

/// A widget that displays a message when no news articles are available.
class NewsEmpty extends StatelessWidget {
  /// Creates a [NewsEmpty] widget.
  const NewsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("No news available."));
  }
}
