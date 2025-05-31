import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalyani_app/src/overlay/components/upload_button.dart';
import 'package:kalyani_app/src/overlay/controllers/config_controller.dart';
import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

import 'upload_view.dart';

class OnboardingView extends ConsumerWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(configControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Setup Your Photos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Upload your person photos for both positions:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            UploadButton(
              title: 'Bottom Left Photo',
              position: OverlayPosition.bottomLeft,
              isUploaded: config.leftOverlayPath != null,
            ),
            const SizedBox(height: 20),
            UploadButton(
              title: 'Bottom Right Photo',
              position: OverlayPosition.bottomRight,
              isUploaded: config.rightOverlayPath != null,
            ),
            const Spacer(),
            if (config.isConfigured)
              FilledButton(
                onPressed: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const UploadView()),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text('Continue', style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}
