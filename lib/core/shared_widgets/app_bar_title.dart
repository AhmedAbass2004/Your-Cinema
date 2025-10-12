import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(
      context,
    ).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'YOUR',
          style: textStyle.copyWith(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),

        const SizedBox(width: 4),
        Text(
          'CINEMA',
          style: textStyle.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ],
    );
  }
}
