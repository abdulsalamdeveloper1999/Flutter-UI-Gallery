import 'package:flutter/material.dart';

void showSnackBar(context, content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$content'),
      duration: const Duration(milliseconds: 800),
    ),
  );
}
