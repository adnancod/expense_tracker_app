import 'package:flutter/material.dart';

class GradientFAB extends StatelessWidget {
  final VoidCallback onPressed;

  const GradientFAB({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,  // Default FAB size
      height: 56,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.tertiary,
            Theme.of(context).colorScheme.secondary,
            Theme.of(context).colorScheme.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: IconButton(
        icon: Icon(Icons.add, color: Colors.white),
        onPressed: onPressed,
      ),
    );
  }
}
