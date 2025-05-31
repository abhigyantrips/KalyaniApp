import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kalyani_app/src/overlay/models/upload_state.dart';
import 'package:kalyani_app/src/overlay/services/image_service.dart';

part 'upload_controller.g.dart';

@riverpod
class UploadController extends _$UploadController {
  @override
  UploadState build() {
    return const UploadState();
  }

  Future<void> selectImage() async {
    state = state.copyWith(isProcessing: true, errorMessage: null);

    try {
      final imageService = ref.read(imageServiceProvider);
      final imagePath = await imageService.pickFromGallery();

      if (imagePath != null) {
        state = state.copyWith(
          selectedImagePath: imagePath,
          isProcessing: false,
        );
      } else {
        state = state.copyWith(isProcessing: false);
      }
    } catch (e) {
      state = state.copyWith(
        isProcessing: false,
        errorMessage: 'Failed to select image: $e',
      );
    }
  }

  void clearSelection() {
    state = const UploadState();
  }
}
