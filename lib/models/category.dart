import 'package:flutter/material.dart';

class CategoryItem {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final String description;

  const CategoryItem({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.description,
  });
}