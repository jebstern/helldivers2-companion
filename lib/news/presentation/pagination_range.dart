/// Represents the range of visible page buttons in a pagination component.
class PaginationRange {
  /// Creates a [PaginationRange].
  const PaginationRange({required this.start, required this.end});

  /// The first visible page number.
  final int start;

  /// The last visible page number.
  final int end;

  /// Calculates the visible page range based on available width and total pages.
  static PaginationRange calculate({
    required double maxWidth,
    required int totalPages,
    required int currentPage,
    required double buttonWidth,
    required double spacing,
    required int minVisiblePages,
    required int maxVisiblePagesCap,
  }) {
    final double effectiveMaxWidth =
        (maxWidth.isFinite)
            ? maxWidth
            : (buttonWidth + spacing) * maxVisiblePagesCap + 80;

    final double arrowsReserve = (buttonWidth + spacing) * 2;

    int fit =
        ((effectiveMaxWidth - arrowsReserve) / (buttonWidth + spacing)).floor();
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

    return PaginationRange(start: start, end: end);
  }
}
