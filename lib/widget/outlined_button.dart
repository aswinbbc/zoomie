import 'package:flutter/material.dart';

class SimpleOutlinedButton extends StatelessWidget {
  const SimpleOutlinedButton(
      {this.child,
      this.textColor,
      this.outlineColor,
      required this.onPressed,
      this.borderRadius = 6,
      this.padding = const EdgeInsets.symmetric(horizontal: 28, vertical: 20),
      Key? key})
      : super(key: key);
  
  final Widget? child;
  final Function() onPressed;
  final double borderRadius;
  final Color? outlineColor;
  final Color? textColor;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = Theme.of(context);
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        padding: padding,
        textStyle: TextStyle(color: currentTheme.primaryColor),
        side: BorderSide(color: outlineColor ?? currentTheme.primaryColor),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        primary: textColor ?? outlineColor ?? currentTheme.primaryColor,
      ),
      onPressed: onPressed,
      child: child!,
    );
  }
}
