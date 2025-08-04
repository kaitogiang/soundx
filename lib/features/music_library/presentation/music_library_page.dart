import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soundx/core/constants/app_text_style.dart';
import 'package:soundx/features/auth/presentation/providers/auth_providers.dart';

class MusicLibraryPage extends ConsumerWidget {
  const MusicLibraryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentSignedInUserProvider);
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome: ${currentUser?.displayName}',
              style: AppTextStyle.textSize20(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                ref.read(logoutProvider);
              },
              child: Text('Logout here'),
            ),
          ],
        ),
      ),
    );
  }
}
