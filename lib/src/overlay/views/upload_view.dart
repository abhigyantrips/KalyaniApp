import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalyani_app/src/overlay/controllers/config_controller.dart';
import 'package:kalyani_app/src/overlay/controllers/upload_controller.dart';
import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

import 'preview_view.dart';

class UploadView extends ConsumerWidget {
  const UploadView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uploadState = ref.watch(uploadControllerProvider);
    final config = ref.watch(configControllerProvider);
    final uploadController = ref.read(uploadControllerProvider.notifier);
    final configController = ref.read(configControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photo'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Position selector
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Choose overlay position:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<OverlayPosition>(
                            title: const Text('Bottom Left'),
                            value: OverlayPosition.bottomLeft,
                            groupValue: config.selectedPosition,
                            onChanged: (value) {
                              if (value != null) {
                                configController.setSelectedPosition(value);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<OverlayPosition>(
                            title: const Text('Bottom Right'),
                            value: OverlayPosition.bottomRight,
                            groupValue: config.selectedPosition,
                            onChanged: (value) {
                              if (value != null) {
                                configController.setSelectedPosition(value);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Upload button
            FilledButton.icon(
              onPressed: uploadState.isProcessing
                  ? null
                  : uploadController.selectImage,
              icon: uploadState.isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.add_photo_alternate),
              label: Text(
                uploadState.isProcessing ? 'Selecting...' : 'Select Photo',
                style: const TextStyle(fontSize: 18),
              ),
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
            ),

            if (uploadState.errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(
                uploadState.errorMessage!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            const Spacer(),

            if (uploadState.selectedImagePath != null)
              FilledButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PreviewView(
                      imagePath: uploadState.selectedImagePath!,
                    ),
                  ),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                ),
                child: const Text('Preview', style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}
