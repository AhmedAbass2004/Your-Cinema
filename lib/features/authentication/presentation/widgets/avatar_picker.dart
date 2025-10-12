import 'package:flutter/material.dart';

class AvatarPicker extends StatelessWidget {
  const AvatarPicker({super.key, required this.image, required this.onTap});

  final String image;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(radius: 80, backgroundImage: AssetImage(image)),
    );
  }
}
