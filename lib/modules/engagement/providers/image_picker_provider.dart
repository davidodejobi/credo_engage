import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier {
  final picker = ImagePicker();
  File? convertedImage;
  List<String> imagePaths = [];

  _getImageFromGallery() async {
    await picker
        .pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    )
        .then((value) {
      if (value != null) {
        convertedImage = File(value.path);
        imagePaths.add(value.path);

        notifyListeners();
      }
      notifyListeners();
      return null;
    });
    log('convertedImage: $convertedImage');

    notifyListeners();
  }

  _getImageFromCamera() async {
    await picker
        .pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
    )
        .then((value) {
      if (value != null) {
        convertedImage = File(value.path);
        imagePaths.add(value.path);
        notifyListeners();
      }
      notifyListeners();
      return null;
    });
    log('convertedImage: $convertedImage');
    // selectedImage = image!;
    notifyListeners();
  }

  clearImage() {
    convertedImage = null;
    imagePaths.clear();
    notifyListeners();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _getImageFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _getImageFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }
}
