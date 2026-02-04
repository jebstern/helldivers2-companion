import "package:flutter/material.dart";

class PaginationArrow extends StatelessWidget {
  const PaginationArrow({
    required this.icon,
    required this.onTap,
    required this.enabled,
    required this.buttonWidth,
    super.key,
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

typedef PageButtonBuilder = Widget Function(int page);

class PageButtonsList extends StatelessWidget {
  const PageButtonsList({
    required this.start,
    required this.end,
    required this.totalPages,
    required this.buttonWidth,
    required this.pageBuilder,
    required this.spacing,
    super.key,
  });

  final int start;
  final int end;
  final int totalPages;
  final double buttonWidth;
  final PageButtonBuilder pageBuilder;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = <Widget>[];

    if (start > 1) {
      children.add(pageBuilder(1));
      if (start > 2) {
        children.add(PaginationEllipsis(buttonWidth: buttonWidth));
      }
    }

    for (int i = start; i <= end; i++) {
      if (i == 1 && start > 1) {
        continue;
      }
      if (i == totalPages && end < totalPages) {
        continue;
      }

      children.add(pageBuilder(i));
    }

    if (end < totalPages) {
      if (end < totalPages - 1) {
        children.add(PaginationEllipsis(buttonWidth: buttonWidth));
      }
      children.add(pageBuilder(totalPages));
    }

    final List<Widget> spaced = <Widget>[];
    for (int i = 0; i < children.length; i++) {
      spaced.add(children[i]);
      if (i != children.length - 1) {
        spaced.add(SizedBox(width: spacing));
      }
    }

    return Row(mainAxisSize: MainAxisSize.min, children: spaced);
  }
}

class PaginationContainer extends StatelessWidget {
  const PaginationContainer({
    required this.children,
    required this.spacing,
    super.key,
  });

  final List<Widget> children;
  final double spacing;

  @override
  Widget build(BuildContext context) {
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

class PageButton extends StatelessWidget {
  const PageButton({
    required this.page,
    required this.isActive,
    required this.onTap,
    required this.buttonWidth,
    this.textStyle,
    this.decoration,
    super.key,
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
    final TextStyle effectiveTextStyle =
        (isActive
            ? (textStyle ??
                  theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ))
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

class PaginationEllipsis extends StatelessWidget {
  const PaginationEllipsis({required this.buttonWidth, super.key});

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
