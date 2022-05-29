import 'package:flutter/material.dart';

class AppDefaultButton extends StatefulWidget {
  const AppDefaultButton({Key? key, this.onTap, required this.title})
      : super(key: key);
  final VoidCallback? onTap;
  final Widget title;
  @override
  State<AppDefaultButton> createState() => _AppDefaultButtonState();
}

class _AppDefaultButtonState extends State<AppDefaultButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: const EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Theme.of(context).primaryColor,
        ),
        child: widget.title,
      ),
    );
  }
}
