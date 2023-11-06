import "package:flutter/material.dart";

enum Categories {
  vegetables,
  fruit,
  meat,
  dairy,
  carbs,
  sweets,
  spices,
  convenience,
  hygiene,
  other
}

class Category {
  const Category({required this.type, required this.color});
  final String type;
  final Color color;
}
