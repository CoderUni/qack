import 'package:flutter/material.dart';
import 'package:qack/widgets/input/check_box_list_tile.dart';


/// {@template check_box_list_tile_theme_data}
/// Stores checkbox list tile configuration
/// {@endtemplate}
class CheckBoxListTileThemeData {
  /// {@macro check_box_list_tile_theme_data}
  const CheckBoxListTileThemeData({
    required this.inactiveColor,
    required this.activeColor,
  });

  /// Inactive color of [AppCheckBoxListTile]
  final Color inactiveColor;

  /// Active color of [AppCheckBoxListTile]
  final Color activeColor;

  BorderRadius get borderRadius => BorderRadius.circular(4);
}
