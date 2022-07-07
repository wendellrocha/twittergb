import 'dart:developer' as devtools show log;

import 'package:asuka/asuka.dart' as asuka;
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

import '../widgets/options_modal/options_modal_widget.dart';

class Utils {
  static Future<Map<String, dynamic>?> pickImage() async {
    return asuka.showDialog<Map<String, dynamic>?>(
      builder: (context) {
        return OptionsModalWidget(
          title: 'Precisamos de uma boa imagem',
          text: 'Você prefere usar a câmera ou acessar a galeria?',
          assetImage: 'assets/images/camera.png',
          buttonOkTitle: 'Galeria',
          buttonCancelCallback: () async {
            Navigator.of(context).pop(await openCamera());
          },
          buttonCancelTitle: 'Câmera',
          buttonOkCallback: () async {
            Navigator.of(context).pop(await openGallery());
          },
        );
      },
    );
  }

  static Future<Map<String, dynamic>?> openCamera() async {
    var picker = ImagePicker();
    XFile? image = await picker.pickImage(
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 50,
      source: ImageSource.camera,
    );

    if (image != null) {
      return {
        'file': image.path,
        'fileName': image.name,
        'fileExtension': image.mimeType,
        'fileSize': await image.length(),
      };
    }

    return null;
  }

  static Future<Map<String, dynamic>?> openGallery() async {
    var picker = ImagePicker();
    XFile? image = await picker.pickImage(
      maxWidth: 800,
      maxHeight: 800,
      imageQuality: 50,
      source: ImageSource.gallery,
    );

    if (image != null) {
      return {
        'file': image.path,
        'fileName': image.name,
        'fileExtension': image.mimeType,
        'fileSize': await image.length(),
      };
    }

    return null;
  }
}

extension Log on Object {
  void log() => devtools.log(toString());
}
