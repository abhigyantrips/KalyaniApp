import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'image_service.g.dart';

@riverpod
ImageService imageService(ImageServiceRef ref) => ImageService();

class ImageService {
  final ImagePicker _picker = ImagePicker();

  Future<String?> pickFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image?.path;
  }

  Future<String?> pickFromCamera() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    return image?.path;
  }
}
