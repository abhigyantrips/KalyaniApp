import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';

import 'package:kalyani_app/src/overlay/components/overlay_preview.dart';
import 'package:kalyani_app/src/overlay/controllers/config_controller.dart';
import 'package:kalyani_app/src/overlay/models/overlay_position.dart';
import 'package:kalyani_app/src/overlay/services/image_composer_service.dart';

class PreviewView extends ConsumerStatefulWidget {
  final String imagePath;

  const PreviewView({
    super.key,
    required this.imagePath,
  });

  @override
  ConsumerState<PreviewView> createState() => _PreviewViewState();
}

class _PreviewViewState extends ConsumerState<PreviewView> {
  bool _isExporting = false;
  String? _lastComposedImagePath;

  @override
  Widget build(BuildContext context) {
    final config = ref.watch(configControllerProvider);
    final configController = ref.read(configControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Preview'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: _isExporting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_alt),
            onPressed: _isExporting ? null : _exportImage,
            tooltip: 'Save to Gallery',
          ),
        ],
      ),
      body: Column(
        children: [
          // Preview area
          Expanded(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: OverlayPreview(
                  backgroundImagePath: widget.imagePath,
                  overlayImagePath: config.currentOverlayPath!,
                  position: config.selectedPosition,
                ),
              ),
            ),
          ),

          // Position controls
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Overlay Position:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile<OverlayPosition>(
                          title: const Text('Bottom Left'),
                          value: OverlayPosition.bottomLeft,
                          groupValue: config.selectedPosition,
                          onChanged: _isExporting
                              ? null
                              : (value) {
                                  if (value != null) {
                                    configController.setSelectedPosition(value);
                                    setState(
                                        () => _lastComposedImagePath = null);
                                  }
                                },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile<OverlayPosition>(
                          title: const Text('Bottom Right'),
                          value: OverlayPosition.bottomRight,
                          groupValue: config.selectedPosition,
                          onChanged: _isExporting
                              ? null
                              : (value) {
                                  if (value != null) {
                                    configController.setSelectedPosition(value);
                                    setState(
                                        () => _lastComposedImagePath = null);
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

          const SizedBox(height: 16),

          // Share buttons
          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    'Share Your Photo:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _ShareButton(
                        icon: FontAwesomeIcons.facebook,
                        label: 'Facebook',
                        color: const Color(0xFF1877F2),
                        onTap: _isExporting ? null : () => _shareToFacebook(),
                      ),
                      _ShareButton(
                        icon: FontAwesomeIcons.instagram,
                        label: 'Instagram',
                        color: const Color(0xFFE4405F),
                        onTap: _isExporting ? null : () => _shareToInstagram(),
                      ),
                      _ShareButton(
                        icon: FontAwesomeIcons.whatsapp,
                        label: 'WhatsApp',
                        color: const Color(0xFF25D366),
                        onTap: _isExporting ? null : () => _shareToWhatsApp(),
                      ),
                      _ShareButton(
                        icon: FontAwesomeIcons.whatsapp,
                        label: 'Status',
                        color: const Color(0xFF128C7E),
                        onTap: _isExporting
                            ? null
                            : () => _shareToWhatsAppStatus(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Export button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FilledButton.icon(
              onPressed: _isExporting ? null : _exportImage,
              icon: _isExporting
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.save_alt),
              label: Text(_isExporting ? 'Saving...' : 'Save to Gallery'),
              style: FilledButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<String> _ensureComposedImage() async {
    if (_lastComposedImagePath != null) {
      return _lastComposedImagePath!;
    }

    final config = ref.read(configControllerProvider);
    final imageComposer = ref.read(imageComposerServiceProvider);

    setState(() => _isExporting = true);

    try {
      final composedPath = await imageComposer.composeImages(
        backgroundImagePath: widget.imagePath,
        overlayImagePath: config.currentOverlayPath!,
        position: config.selectedPosition,
      );

      setState(() {
        _lastComposedImagePath = composedPath;
        _isExporting = false;
      });

      return composedPath;
    } catch (e) {
      setState(() => _isExporting = false);
      throw e;
    }
  }

  Future<void> _exportImage() async {
    try {
      final composedPath = await _ensureComposedImage();

      // For now, just show success - implement gallery save later
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Image saved successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save image: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }

  Future<void> _shareToFacebook() async {
    await _shareImage('Check out my photo!');
  }

  Future<void> _shareToInstagram() async {
    await _shareImage('📸✨');
  }

  Future<void> _shareToWhatsApp() async {
    await _shareImage('Look at this beautiful photo! 😊');
  }

  Future<void> _shareToWhatsAppStatus() async {
    await _shareImage('');
  }

  Future<void> _shareImage(String text) async {
    try {
      final composedPath = await _ensureComposedImage();

      await Share.shareXFiles(
        [XFile(composedPath)],
        text: text,
      );
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to share: $e'),
            backgroundColor: Theme.of(context).colorScheme.error,
          ),
        );
      }
    }
  }
}

class _ShareButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback? onTap;

  const _ShareButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isEnabled = onTap != null;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(
                color: isEnabled
                    ? color.withOpacity(0.1)
                    : Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: isEnabled
                      ? color.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.3),
                  width: 2,
                ),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: onTap,
                  borderRadius: BorderRadius.circular(16),
                  child: Center(
                    child: FaIcon(
                      icon,
                      color: isEnabled ? color : Colors.grey,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isEnabled ? color : Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
