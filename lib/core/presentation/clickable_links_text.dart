import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:forui/forui.dart";
import "package:url_launcher/url_launcher.dart";

class ClickableLinksText extends StatelessWidget {
  const ClickableLinksText({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    final FTypography typography = context.theme.typography;

    return buildTextWithLinks(style: typography.base);
  }

  Widget buildTextWithLinks({TextStyle? style, TextStyle? linkStyle}) {
    final RegExp urlRegExp = RegExp(
      r"(https?:\/\/[^\s]+)",
      caseSensitive: false,
    );

    final List<InlineSpan> spans = <InlineSpan>[];
    int start = 0;

    for (final RegExpMatch match in urlRegExp.allMatches(text)) {
      // normal text before the link
      if (match.start > start) {
        spans.add(
          TextSpan(text: text.substring(start, match.start), style: style),
        );
      }

      final String url = match.group(0)!;
      spans.add(
        TextSpan(
          text: url,
          style:
              linkStyle ??
              const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
          recognizer: TapGestureRecognizer()
            ..onTap = () async {
              final Uri uri = Uri.parse(url);
              final bool canLaunch = await canLaunchUrl(uri);

              if (canLaunch) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
        ),
      );

      start = match.end;
    }

    // add the remaining text after the last link
    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start), style: style));
    }

    return Text.rich(TextSpan(children: spans));
  }
}
