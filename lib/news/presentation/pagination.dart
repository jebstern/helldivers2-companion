import "package:flutter/material.dart";

typedef PageChanged = void Function(int page);

class ResponsivePagination extends StatelessWidget {
  const ResponsivePagination({
    required this.totalPages,
    required this.currentPage,
    required this.onPageChanged,
    this.buttonWidth = 40,
    this.spacing = 8,
    this.minVisiblePages = 3,
    this.maxVisiblePagesCap = 10,
    this.pageTextStyle,
    this.activeTextStyle,
    this.buttonDecoration,
    this.activeDecoration,
    super.key,
  });

  final int totalPages;
  final int currentPage; // 1-based
  final PageChanged onPageChanged;

  /// approximate width of each page button (used for layout calculation)
  final double buttonWidth;

  /// spacing between buttons
  final double spacing;

  /// never show fewer than this many page buttons (if width allows)
  final int minVisiblePages;

  /// hard cap for visible pages (defensive)
  final int maxVisiblePagesCap;

  final TextStyle? pageTextStyle;
  final TextStyle? activeTextStyle;
  final Decoration? buttonDecoration;
  final Decoration? activeDecoration;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        // if infinite width (rare in row inside scrollable), fall back to cap
        final double maxWidth = (constraints.maxWidth.isFinite)
            ? constraints.maxWidth
            : (buttonWidth + spacing) * maxVisiblePagesCap + 80;

        // reserve space for left & right arrow buttons
        final double arrowsReserve = (buttonWidth + spacing) * 2;

        // compute how many page buttons can fit
        int fit = ((maxWidth - arrowsReserve) / (buttonWidth + spacing))
            .floor();
        fit = fit.clamp(minVisiblePages, maxVisiblePagesCap);
        fit = fit.clamp(1, totalPages);

        // pick visible window of pages centered on currentPage
        final int half = fit ~/ 2;
        int start = currentPage - half;
        int end = start + fit - 1;

        if (start < 1) {
          start = 1;
          end = start + fit - 1;
        }
        if (end > totalPages) {
          end = totalPages;
          start = end - fit + 1;
          if (start < 1) {
            start = 1;
          }
        }

        final List<Widget> children = <Widget>[];

        Widget arrow({
          required IconData icon,
          required VoidCallback onTap,
          required bool enabled,
        }) {
          return SizedBox(
            width: buttonWidth,
            height: 36,
            child: TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              onPressed: enabled ? onTap : null,
              child: Icon(icon),
            ),
          );
        }

        // left arrow
        children.add(
          arrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => onPageChanged((currentPage - 1).clamp(1, totalPages)),
          ),
        );

        // optional "1" and ellipsis when start > 1
        if (start > 1) {
          children.add(_pageButton(1, theme, isActive: currentPage == 1));
          if (start > 2) {
            children.add(_ellipsis());
          } else {
            // if start == 2 we don't need ellipsis, we'll show "2" in loop
          }
        }

        // page range
        for (int i = start; i <= end; i++) {
          // avoid duplicating "1" if already rendered
          if (i == 1 && start > 1) {
            continue;
          }
          // avoid duplicating last page if we will add later
          if (i == totalPages && end < totalPages) {
            continue;
          }

          children.add(_pageButton(i, theme, isActive: i == currentPage));
        }

        // optional ellipsis and last page when end < totalPages
        if (end < totalPages) {
          if (end < totalPages - 1) {
            children.add(_ellipsis());
          }
          children.add(
            _pageButton(totalPages, theme, isActive: currentPage == totalPages),
          );
        }

        // right arrow
        children.add(
          arrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged((currentPage + 1).clamp(1, totalPages)),
          ),
        );

        // insert spacing between children
        final List<Widget> spaced = <Widget>[];
        for (int i = 0; i < children.length; i++) {
          spaced.add(children[i]);
          if (i != children.length - 1) {
            spaced.add(SizedBox(width: spacing));
          }
        }

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: Row(mainAxisSize: MainAxisSize.min, children: spaced),
          ),
        );
      },
    );
  }

  Widget _pageButton(int page, ThemeData theme, {required bool isActive}) {
    final TextStyle? textStyle = isActive
        ? (activeTextStyle ??
              theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold))
        : (pageTextStyle ?? theme.textTheme.bodyMedium);

    final Decoration decoration = isActive
        ? (activeDecoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ))
        : (buttonDecoration ?? const BoxDecoration());

    return GestureDetector(
      onTap: () => onPageChanged(page),
      child: Container(
        width: buttonWidth,
        height: 36,
        alignment: Alignment.center,
        decoration: decoration,
        child: Text(page.toString(), style: textStyle),
      ),
    );
  }

  Widget _ellipsis() {
    return SizedBox(
      width: buttonWidth / 1.6,
      height: 36,
      child: const Center(child: Text("…")),
    );
  }
}
