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

        // left arrow
        children.add(
          _PaginationArrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => onPageChanged((currentPage - 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
          ),
        );

        // optional "1" and ellipsis when start > 1
        if (start > 1) {
          children.add(
            _PageButton(
              page: 1,
              isActive: currentPage == 1,
              onTap: () => onPageChanged(1),
              buttonWidth: buttonWidth,
              textStyle: currentPage == 1 ? activeTextStyle : pageTextStyle,
              decoration:
                  currentPage == 1 ? activeDecoration : buttonDecoration,
            ),
          );
          if (start > 2) {
            children.add(_Ellipsis(buttonWidth: buttonWidth));
          }
        }

        // page range
        for (int i = start; i <= end; i++) {
          if (i == 1 && start > 1) {
            continue;
          }
          if (i == totalPages && end < totalPages) {
            continue;
          }

          children.add(
            _PageButton(
              page: i,
              isActive: i == currentPage,
              onTap: () => onPageChanged(i),
              buttonWidth: buttonWidth,
              textStyle: i == currentPage ? activeTextStyle : pageTextStyle,
              decoration:
                  i == currentPage ? activeDecoration : buttonDecoration,
            ),
          );
        }

        // optional ellipsis and last page when end < totalPages
        if (end < totalPages) {
          if (end < totalPages - 1) {
            children.add(_Ellipsis(buttonWidth: buttonWidth));
          }
          children.add(
            _PageButton(
              page: totalPages,
              isActive: currentPage == totalPages,
              onTap: () => onPageChanged(totalPages),
              buttonWidth: buttonWidth,
              textStyle:
                  currentPage == totalPages ? activeTextStyle : pageTextStyle,
              decoration: currentPage == totalPages
                  ? activeDecoration
                  : buttonDecoration,
            ),
          );
        }

        // right arrow
        children.add(
          _PaginationArrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged((currentPage + 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
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

}

class _PaginationArrow extends StatelessWidget {
  const _PaginationArrow({
    required this.icon,
    required this.onTap,
    required this.enabled,
    required this.buttonWidth,
  });

  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;
  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
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
}

class _PageButton extends StatelessWidget {
  const _PageButton({
    required this.page,
    required this.isActive,
    required this.onTap,
    required this.buttonWidth,
    this.textStyle,
    this.decoration,
  });

  final int page;
  final bool isActive;
  final VoidCallback onTap;
  final double buttonWidth;
  final TextStyle? textStyle;
  final Decoration? decoration;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle effectiveTextStyle = (isActive
            ? (textStyle ??
                theme.textTheme.bodyMedium
                    ?.copyWith(fontWeight: FontWeight.bold))
            : (textStyle ?? theme.textTheme.bodyMedium)) ??
        const TextStyle();

    final Decoration effectiveDecoration = isActive
        ? (decoration ??
              BoxDecoration(
                color: theme.colorScheme.primary,
                borderRadius: BorderRadius.circular(6),
              ))
        : (decoration ?? const BoxDecoration());

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: buttonWidth,
        height: 36,
        alignment: Alignment.center,
        decoration: effectiveDecoration,
        child: Text(page.toString(), style: effectiveTextStyle),
      ),
    );
  }
}

class _Ellipsis extends StatelessWidget {
  const _Ellipsis({required this.buttonWidth});

  final double buttonWidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: buttonWidth / 1.6,
      height: 36,
      child: const Center(child: Text("…")),
    );
  }
}
