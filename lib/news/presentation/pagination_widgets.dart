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
