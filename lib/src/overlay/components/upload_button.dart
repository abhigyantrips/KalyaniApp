import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:kalyani_app/src/overlay/controllers/config_controller.dart';
import 'package:kalyani_app/src/overlay/models/overlay_position.dart';
import 'package:kalyani_app/src/overlay/services/file_service.dart';
import 'package:kalyani_app/src/overlay/services/image_service.dart';

class UploadButton extends ConsumerWidget {
  final String title;
  final OverlayPosition position;
  final bool isUploaded;

  const UploadButton({
    super.key,
    required this.title,
    required this.position,
    required this.isUploaded,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FilledButton.tonal(
      onPressed: () => _uploadOverlay(ref),
      style: FilledButton.styleFrom(
        minimumSize: const Size(double.infinity, 80),
        backgroundColor:
            isUploaded ? Theme.of(context).colorScheme.primaryContainer : null,
      ),
      child: Column(
        children: [
          Icon(
            isUploaded ? Icons.check_circle : Icons.upload,
            size: 32,
          ),
          const SizedBox(height: 8),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Future<void> _uploadOverlay(WidgetRef ref) async {
    final imageService = ref.read(imageServiceProvider);
    final fileService = ref.read(fileServiceProvider);
    final configController = ref.read(configControllerProvider.notifier);

    final imagePath = await imageService.pickFromGallery();
    if (imagePath == null) return;

    final savedPath = await fileService.saveOverlayImage(imagePath, position);
    await configController.setOverlayPath(position, savedPath);
  }
}
