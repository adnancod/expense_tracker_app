import 'package:flutter/material.dart';

class ColorGradient{

  static LinearGradient colorGradient(BuildContext context) => LinearGradient(
    colors: [
      Theme.of(context).colorScheme.primary,
      Theme.of(context).colorScheme.secondary,
      Theme.of(context).colorScheme.tertiary
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,);
}