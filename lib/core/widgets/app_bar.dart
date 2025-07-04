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

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.black,
    this.leading,
    this.centerTitle = true,
    this.toolbarHeight = 56.0,
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
