import 'package:flutter/material.dart';

class MenuItemModel {
  final IconData icon;
  final String route;

  const MenuItemModel({required this.icon, required this.route});

  @override
  String toString() => 'MenuItemModel(route: $route)';
}
