import 'package:finlog/core/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool centerTitle;
  final double toolbarHeight;
  final Color backgroundColor;
  final Widget? leading;

  final Color textColor;
  final VoidCallback? onThemeChanged;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.black,
    this.leading,
    this.centerTitle = true,
    this.toolbarHeight = 56.0,
    this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      leading: leading ?? (showBackButton ? _buildBackButton(context) : null),
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(15),
        ),
      ),
      actions: [
        if (onThemeChanged != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.light_mode,
                  color: textColor,
                ),
                Switch(
                  value: Theme.of(context).brightness == Brightness.dark,
                  onChanged: (value) => onThemeChanged?.call(),
                  activeColor: Colors.white,
                  inactiveThumbColor: Colors.black,
                ),
                Icon(
                  Icons.dark_mode,
                  color: textColor,
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: textColor,
      ),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
