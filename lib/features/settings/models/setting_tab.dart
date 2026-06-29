import 'package:flutter/material.dart';

enum FocusZone { sidebar, tabs, actions }

class SettingsTab {
  const SettingsTab({required this.label, required this.icon});
  final String label;
  final IconData icon;
}
