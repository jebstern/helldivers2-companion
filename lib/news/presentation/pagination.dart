import "package:flutter/material.dart";
import "pagination_range.dart";
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
        final PaginationRange range = PaginationRange.calculate(
          maxWidth: constraints.maxWidth,
          totalPages: totalPages,
          currentPage: currentPage,
          buttonWidth: buttonWidth,
          spacing: spacing,
          minVisiblePages: minVisiblePages,
          maxVisiblePagesCap: maxVisiblePagesCap,
        );

        final List<Widget> children = <Widget>[
          PaginationArrow(
            icon: Icons.chevron_left,
            enabled: currentPage > 1,
            onTap: () => onPageChanged((currentPage - 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
          ),
          PageButtonsList(
            start: range.start,
            end: range.end,
            totalPages: totalPages,
            buttonWidth: buttonWidth,
            pageBuilder: _buildPageButton,
            spacing: spacing,
          ),
          PaginationArrow(
            icon: Icons.chevron_right,
            enabled: currentPage < totalPages,
            onTap: () => onPageChanged((currentPage + 1).clamp(1, totalPages)),
            buttonWidth: buttonWidth,
          ),
        ];

        return PaginationContainer(spacing: spacing, children: children);
      },
    );
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
}
