import 'package:flutter/material.dart';

class GameItem {
  final int id;
  final String title;
  final String subtitle;
  final Color gradientStart;
  final Color gradientEnd;
  final String? badge;
  final String? date;

  const GameItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.gradientStart,
    required this.gradientEnd,
    this.badge,
    this.date,
  });
}
