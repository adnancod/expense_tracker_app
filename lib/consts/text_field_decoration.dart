import 'package:flutter/material.dart';

 BoxDecoration textFieldDecoration(BuildContext context) => BoxDecoration(
  color: Theme.of(context).colorScheme.onPrimary, // required for shadow to show
  borderRadius: BorderRadius.circular(20),
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.4),
      spreadRadius: 0,
      blurRadius: 0,
      offset: Offset(0, 0), // changes position of shadow
    ),
  ],
);