import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:your_cinema/features/authentication/presentation/providers/avatars_provider.dart';
import 'package:your_cinema/features/authentication/presentation/widgets/avatar_dialog.dart';

class SelectedAvatarNotifier extends StateNotifier<String> {
  SelectedAvatarNotifier(this.ref) : super(ref.read(avatarsProvider)[0]);

  final Ref ref;

  setAvatar(String avatar) {
    state = avatar;
  }

  showAvatarSelectionDialog(
    BuildContext context,
    WidgetRef ref,
    List<String> paths,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => AvatarDialog(
        paths: paths,
        onSelect: (path) {
          state = path;
        },
      ),
    );
  }
}

final selectedAvatarProvider =
    StateNotifierProvider<SelectedAvatarNotifier, String>(
      (ref) => SelectedAvatarNotifier(ref),
    );
