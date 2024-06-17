import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(this.text, {super.key, this.paddingVertical = 16});
  final String text;
  final double paddingVertical;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: paddingVertical),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    );
  }
}

class ListTitleText extends StatelessWidget {
  const ListTitleText(
    this.title, {
    super.key,
    this.trailing,
    this.leading,
    this.size = 14,
    this.color = Colors.black,
    this.padding = const EdgeInsets.all(8.0),
  });
  final String title;
  final String? trailing;
  final Widget? leading;
  final double size;
  final Color color;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        children: [
          if (leading != null) leading!,
          Expanded(
            child: Text(
              title,
              style: TextStyle(fontSize: size, color: color),
            ),
          ),
          if (trailing != null)
            Text(
              trailing!,
              style: TextStyle(fontSize: size, color: color),
            ),
        ],
      ),
    );
  }
}
