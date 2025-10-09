import 'package:flutter/material.dart';

class SectionHeadlineText extends StatelessWidget {
  const SectionHeadlineText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        text,
        style: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Colors.white),
      ),
    );
  }
}
