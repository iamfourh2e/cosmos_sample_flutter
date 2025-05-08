import 'package:flutter/material.dart';
import '../core/theme/base_theme.dart';

class ThemedContainer extends StatelessWidget {
  final Widget child;
  final bool useSecondaryBackground;

  const ThemedContainer({
    super.key,
    required this.child,
    this.useSecondaryBackground = false,
  });

  @override
  Widget build(BuildContext context) {
    final baseTheme = Theme.of(context).extension<BaseTheme>()!;

    return Container(
      color: useSecondaryBackground
        ? baseTheme.secondaryBackground
        : baseTheme.primaryBackground,
      child: DefaultTextStyle(
        style: TextStyle(color: baseTheme.textPrimary),
        child: child,
      ),
    );
  }
}