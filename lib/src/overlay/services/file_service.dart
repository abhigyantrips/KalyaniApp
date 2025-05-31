import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

part 'file_service.g.dart';

@riverpod
FileService fileService(FileServiceRef ref) => FileService();

class FileService {
  Future<String> saveOverlayImage(
      String sourcePath, OverlayPosition position) async {
    final directory = await getApplicationDocumentsDirectory();
    final fileName = position == OverlayPosition.bottomLeft
        ? 'overlay_left.png'
        : 'overlay_right.png';
    final savedPath = '${directory.path}/$fileName';

    await File(sourcePath).copy(savedPath);
    return savedPath;
  }

  Future<String> saveUploadedImage(String sourcePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final timestamp = DateTime.now().millisecondsSinceEpoch;
    final savedPath = '${directory.path}/upload_$timestamp.jpg';

    await File(sourcePath).copy(savedPath);
    return savedPath;
  }
}
