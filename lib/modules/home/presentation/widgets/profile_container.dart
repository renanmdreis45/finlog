import 'package:flutter/material.dart';

class ProfileContainer extends StatelessWidget {
  const ProfileContainer(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.currentBalance});

  final String imageUrl;
  final String name;
  final String currentBalance;

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [],
    );
  }
}
