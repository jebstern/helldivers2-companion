import "package:flutter/material.dart";
import "pagination_widgets.dart";

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
        final _PaginationRange range = _calculateRange(constraints.maxWidth);

        final List<Widget> children = <Widget>[
          PaginationArrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => onPageChanged((currentPage - 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
          ),
          ..._buildPageButtons(range),
          PaginationArrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged((currentPage + 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
          ),
        ];

        return _buildScrollableRow(children);
      },
    );
  }

  _PaginationRange _calculateRange(double maxWidth) {
    final double effectiveMaxWidth = (maxWidth.isFinite)
        ? maxWidth
        : (buttonWidth + spacing) * maxVisiblePagesCap + 80;

    final double arrowsReserve = (buttonWidth + spacing) * 2;

    int fit = ((effectiveMaxWidth - arrowsReserve) / (buttonWidth + spacing))
        .floor();
    fit = fit.clamp(minVisiblePages, maxVisiblePagesCap);
    fit = fit.clamp(1, totalPages);

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

    return _PaginationRange(start: start, end: end);
  }

  List<Widget> _buildPageButtons(_PaginationRange range) {
    final List<Widget> children = <Widget>[];

    if (range.start > 1) {
      children.add(_buildPageButton(1));
      if (range.start > 2) {
        children.add(PaginationEllipsis(buttonWidth: buttonWidth));
      }
    }

    for (int i = range.start; i <= range.end; i++) {
      if (i == 1 && range.start > 1) {
        continue;
      }
      if (i == totalPages && range.end < totalPages) {
        continue;
      }

      children.add(_buildPageButton(i));
    }

    if (range.end < totalPages) {
      if (range.end < totalPages - 1) {
        children.add(PaginationEllipsis(buttonWidth: buttonWidth));
      }
      children.add(_buildPageButton(totalPages));
    }

    return children;
  }

  Widget _buildPageButton(int page) {
    return PageButton(
      page: page,
      isActive: page == currentPage,
      onTap: () => onPageChanged(page),
      buttonWidth: buttonWidth,
      textStyle: page == currentPage ? activeTextStyle : pageTextStyle,
      decoration: page == currentPage ? activeDecoration : buttonDecoration,
    );
  }

  Widget _buildScrollableRow(List<Widget> children) {
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
  }
}

class _PaginationRange {
  const _PaginationRange({required this.start, required this.end});
  final int start;
  final int end;
}
