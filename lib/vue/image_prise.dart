import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePrise extends StatefulWidget {
  const ImagePrise({required this.onPhotoSelectionnee, super.key});
  final void Function(File image) onPhotoSelectionnee;
  @override
  State<ImagePrise> createState() => _ImagePriseState();
}

class _ImagePriseState extends State<ImagePrise> {
  File? _photoSelectionnee;

  Future<void> _prendrePhoto() async {
    final picker = ImagePicker();
    final photoPrise = await picker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );
    if (photoPrise == null) return;
    setState(() {
      _photoSelectionnee = File(photoPrise.path);
    });
    widget.onPhotoSelectionnee(_photoSelectionnee!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _photoSelectionnee == null
            ? TextButton.icon(
                onPressed: _prendrePhoto,
                label: const Text('Prendre photo'),
              )
            : GestureDetector(
                onTap: _prendrePhoto,
                child: Image.file(
                  _photoSelectionnee!,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
      ],
    );
  }
}
