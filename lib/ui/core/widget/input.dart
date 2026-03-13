import 'package:blablacarv2/ui/core/theme/theme.dart';
import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({
    super.key,
    required this.label,
    required this.onTap,
    required this.icon,
    this.valueText,
  });

  final String label;
  final String? valueText;
  final Function() onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final displayText = (valueText!.trim().isNotEmpty)
        ? valueText!
        : label;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: BlaColors.white),
        child: Row(
          children: [
            Icon(icon, color: BlaColors.iconNormal),
            SizedBox(width: 10),
            Expanded(child: Text(displayText, style: TextStyle(fontSize: 16))),
          ],
        ),
      ),
    );
  }
}
