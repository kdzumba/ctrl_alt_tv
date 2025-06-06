import "package:flutter/material.dart";

class CtrlButtonBase extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;
  final double padding;
  final BorderRadius borderRadius;
  final BoxShape shape;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;

  const CtrlButtonBase({
    super.key,
    required this.child,
    this.backgroundColor,
    this.padding = 0.0,
    this.borderRadius = const BorderRadius.all(Radius.circular(3)),
    this.shape = BoxShape.rectangle,
    this.border,
    this.boxShadow
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = backgroundColor ?? Theme.of(context).primaryColor;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        shape: shape,
        borderRadius: shape == BoxShape.circle ? null : borderRadius,
        border: border,
        boxShadow: boxShadow
      ),
      child: child
    );
  }
}