import 'package:flutter/material.dart';
import '../models/category.dart';

const List<CategoryItem> initialCategories = [
  CategoryItem(
    id: 'hope',
    name: 'Hope',
    icon: Icons.favorite_outline,
    color: Color(0xFFE57373),
    description: 'Light when the path seems uncertain.',
  ),
  CategoryItem(
    id: 'faith',
    name: 'Faith',
    icon: Icons.wb_sunny_outlined,
    color: Color(0xFFFFB74D),
    description: 'Trusting what you cannot yet see.',
  ),
  CategoryItem(
    id: 'strength',
    name: 'Strength',
    icon: Icons.fitness_center_outlined,
    color: Color(0xFF64B5F6),
    description: 'Courage to stand tall through adversity.',
  ),
  CategoryItem(
    id: 'peace',
    name: 'Peace',
    icon: Icons.spa_outlined,
    color: Color(0xFF81C784),
    description: 'Quiet confidence in your heart and mind.',
  ),
  CategoryItem(
    id: 'motivation',
    name: 'Motivation',
    icon: Icons.bolt_outlined,
    color: Color(0xFFFFD54F),
    description: 'Energy to take the next bold step forward.',
  ),
  CategoryItem(
    id: 'growth',
    name: 'Growth',
    icon: Icons.eco_outlined,
    color: Color(0xFF4DB6AC),
    description: 'Embracing lessons and gradual progress.',
  ),
  CategoryItem(
    id: 'happiness',
    name: 'Happiness',
    icon: Icons.sentiment_satisfied_alt_outlined,
    color: Color(0xFFBA68C8),
    description: 'Finding joy in life’s simple blessings.',
  ),
  CategoryItem(
    id: 'love',
    name: 'Love & Kindness',
    icon: Icons.volunteer_activism_outlined,
    color: Color(0xFFF06292),
    description: 'Giving grace and warmth to those around you.',
  ),
  CategoryItem(
    id: 'study',
    name: 'Study & Success',
    icon: Icons.menu_book_outlined,
    color: Color(0xFF7986CB),
    description: 'Focus, wisdom, and diligence in your craft.',
  ),
  CategoryItem(
    id: 'daily',
    name: 'Daily Encouragement',
    icon: Icons.today_outlined,
    color: Color(0xFF4DD0E1),
    description: 'A thoughtful boost for your everyday journey.',
  ),
];