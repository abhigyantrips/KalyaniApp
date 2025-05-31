import 'dart:io';

import 'package:image/image.dart' as img;
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

part 'image_composer_service.g.dart';

@riverpod
ImageComposerService imageComposerService(ImageComposerServiceRef ref) =>
    ImageComposerService();

class ImageComposerService {
  // Positioning constants (as percentages of background image dimensions)
  static const double overlayBottomMarginPercent = 0.05; // 5% from bottom
  static const double overlaySideMarginPercent = 0.05; // 5% from left/right
  static const double overlaySizePercent = 0.15; // 15% of image width

  Future<String> composeImages({
    required String backgroundImagePath,
    required String overlayImagePath,
    required OverlayPosition position,
  }) async {
    try {
      // Load both images at full resolution
      final backgroundBytes = await File(backgroundImagePath).readAsBytes();
      final overlayBytes = await File(overlayImagePath).readAsBytes();

      final backgroundImage = img.decodeImage(backgroundBytes);
      final overlayImage = img.decodeImage(overlayBytes);

      if (backgroundImage == null || overlayImage == null) {
        throw Exception('Failed to decode images');
      }

      // Calculate overlay dimensions based on background image resolution
      final overlayWidth = (backgroundImage.width * overlaySizePercent).round();
      final overlayHeight =
          (overlayWidth * (overlayImage.height / overlayImage.width)).round();

      // Resize overlay to calculated dimensions
      final resizedOverlay = img.copyResize(
        overlayImage,
        width: overlayWidth,
        height: overlayHeight,
        interpolation: img.Interpolation.cubic, // High quality scaling
      );

      // Calculate positioning based on background image resolution
      final bottomMargin =
          (backgroundImage.height * overlayBottomMarginPercent).round();
      final sideMargin =
          (backgroundImage.width * overlaySideMarginPercent).round();

      late int overlayX, overlayY;

      switch (position) {
        case OverlayPosition.bottomLeft:
          overlayX = sideMargin;
          overlayY = backgroundImage.height - bottomMargin - overlayHeight;
          break;
        case OverlayPosition.bottomRight:
          overlayX = backgroundImage.width - sideMargin - overlayWidth;
          overlayY = backgroundImage.height - bottomMargin - overlayHeight;
          break;
      }

      // Create a copy of background image for composition
      final compositeImage = img.Image.from(backgroundImage);

      // Add subtle shadow behind overlay (optional for better visibility)
      final shadowOffset = (overlayWidth * 0.02).round(); // 2% of overlay width
      final shadowBlur = (overlayWidth * 0.01).round(); // 1% of overlay width

      if (shadowOffset > 0 && shadowBlur > 0) {
        // Create shadow
        final shadow = img.copyResize(
          resizedOverlay,
          width: overlayWidth,
          height: overlayHeight,
        );

        // Make it darker and semi-transparent
        img.fill(shadow, color: img.ColorRgba8(0, 0, 0, 100));

        // Apply blur effect
        img.gaussianBlur(shadow, radius: shadowBlur);

        // Composite shadow slightly offset
        img.compositeImage(
          compositeImage,
          shadow,
          dstX: overlayX + shadowOffset,
          dstY: overlayY + shadowOffset,
          blend: img.BlendMode.multiply,
        );
      }

      // Composite the overlay image onto background
      img.compositeImage(
        compositeImage,
        resizedOverlay,
        dstX: overlayX,
        dstY: overlayY,
      );

      // Save the composite image
      final directory = await getApplicationDocumentsDirectory();
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final fileName = 'composed_image_$timestamp.jpg';
      final outputPath = '${directory.path}/$fileName';

      // Encode as JPEG with high quality
      final jpegBytes = img.encodeJpg(
        compositeImage,
        quality: 95, // High quality for grandma's photos
      );

      await File(outputPath).writeAsBytes(jpegBytes);

      return outputPath;
    } catch (e) {
      throw Exception('Failed to compose images: $e');
    }
  }

  /// Get the exact positioning info for debugging/info purposes
  Map<String, dynamic> getCompositionInfo({
    required int backgroundWidth,
    required int backgroundHeight,
    required int overlayWidth,
    required int overlayHeight,
    required OverlayPosition position,
  }) {
    final calculatedOverlayWidth =
        (backgroundWidth * overlaySizePercent).round();
    final calculatedOverlayHeight =
        (calculatedOverlayWidth * (overlayHeight / overlayWidth)).round();

    final bottomMargin =
        (backgroundHeight * overlayBottomMarginPercent).round();
    final sideMargin = (backgroundWidth * overlaySideMarginPercent).round();

    late int overlayX, overlayY;

    switch (position) {
      case OverlayPosition.bottomLeft:
        overlayX = sideMargin;
        overlayY = backgroundHeight - bottomMargin - calculatedOverlayHeight;
        break;
      case OverlayPosition.bottomRight:
        overlayX = backgroundWidth - sideMargin - calculatedOverlayWidth;
        overlayY = backgroundHeight - bottomMargin - calculatedOverlayHeight;
        break;
    }

    return {
      'backgroundSize': '${backgroundWidth}x$backgroundHeight',
      'overlaySize': '${calculatedOverlayWidth}x$calculatedOverlayHeight',
      'overlayPosition': '($overlayX, $overlayY)',
      'margins': 'bottom: ${bottomMargin}px, side: ${sideMargin}px',
      'percentages': {
        'overlaySize': '${(overlaySizePercent * 100)}% of width',
        'bottomMargin': '${(overlayBottomMarginPercent * 100)}% of height',
        'sideMargin': '${(overlaySideMarginPercent * 100)}% of width',
      }
    };
  }
}
