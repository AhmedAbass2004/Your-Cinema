import 'package:flutter/material.dart';

class AvatarDialog extends StatefulWidget {
  const AvatarDialog({super.key, required this.paths, required this.onSelect});

  final List<String> paths;
  final void Function(String) onSelect;

  @override
  State<AvatarDialog> createState() => _AvatarDialogState();
}

class _AvatarDialogState extends State<AvatarDialog> {
  int? selectedAvater;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return AlertDialog(
      backgroundColor: colorScheme.primaryContainer,
      title: Text(
        'Choose Your Avatar',
        style: theme.textTheme.headlineMedium!.copyWith(
          color: colorScheme.surface,
        ),
      ),
      content: SizedBox(
        height: 100,
        width: MediaQuery.sizeOf(context).width,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: widget.paths.length,
          itemBuilder: (context, i) {
            bool isSelected = i == selectedAvater;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedAvater = i;
                  });
                },
                splashColor: Colors.transparent,
                child: CircleAvatar(
                  radius: isSelected ? 40 : 30,
                  backgroundImage: AssetImage(widget.paths[i]),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: TextStyle(color: colorScheme.error)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.primaryContainer,
          ),
          onPressed: () {
            if (selectedAvater == null) return;
            widget.onSelect(widget.paths[selectedAvater!]);
            Navigator.of(context).pop();
          },
          child: Text('Select'),
        ),
      ],
    );
  }
}
