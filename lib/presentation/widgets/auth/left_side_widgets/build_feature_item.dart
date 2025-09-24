import 'package:flutter/material.dart';

Widget buildFeatureItem(String title, String icon) {
  return Container(
    padding: const EdgeInsets.all(12.0),

    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.white.withOpacity(0.1),
      border: Border.all(width: 1, color: Colors.white.withOpacity(0.2)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        Text(title, style: TextStyle(color: Colors.white)),
        Text(icon, style: TextStyle(color: Colors.white)),
      ],
    ),
  );
}
