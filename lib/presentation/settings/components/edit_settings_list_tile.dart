import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qack/widgets/buttons/buttons.dart';

class EditSettingsListTile extends StatelessWidget {
  const EditSettingsListTile({
    required this.color,
    required this.icon,
    required this.title,
    required this.onTap,
    super.key,
  });

  final Color color;
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ActionListTile(
      color: color,
      prefixIcon: Icon(icon),
      title: title,
      onTap: onTap,
      suffixIcon: const Icon(EvaIcons.arrowIosForward),
    );
  }
}
