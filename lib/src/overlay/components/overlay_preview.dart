import 'dart:io';

import 'package:flutter/material.dart';

import 'package:kalyani_app/src/overlay/models/overlay_position.dart';

class OverlayPreview extends StatelessWidget {
  final String backgroundImagePath;
  final String overlayImagePath;
  final OverlayPosition position;

  const OverlayPreview({
    super.key,
    required this.backgroundImagePath,
    required this.overlayImagePath,
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            // Background image
            SizedBox(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              child: Image.file(
                File(backgroundImagePath),
                fit: BoxFit.contain,
              ),
            ),

            // Overlay image
            Positioned(
              bottom: 20,
              left: position == OverlayPosition.bottomLeft ? 20 : null,
              right: position == OverlayPosition.bottomRight ? 20 : null,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.file(
                    File(overlayImagePath),
                    width: _calculateOverlaySize(constraints),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  double _calculateOverlaySize(BoxConstraints constraints) {
    // Make overlay size responsive to screen size
    // Roughly 1/4 of the smaller dimension, but with min/max bounds
    final smallerDimension = constraints.maxWidth < constraints.maxHeight
        ? constraints.maxWidth
        : constraints.maxHeight;

    final calculatedSize = smallerDimension * 0.25;

    // Clamp between 80 and 200 pixels
    return calculatedSize.clamp(80.0, 200.0);
  }
}
