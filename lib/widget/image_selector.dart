import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageSelector extends StatefulWidget {
  Function(File) imageData;
  ImageSelector({Key? key, required this.imageData}) : super(key: key);

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  File? file;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _picker.pickImage(source: ImageSource.gallery).then((value) {
          widget.imageData(File(value!.path));
          setState(() {
            file = File(value.path);
          });
        });
      },
      child: file == null
          ? Image.asset(
              "images/img50.png",
              width: 50,
              height: 50,
            )
          : Image.file(
              file!,
              width: 75,
              height: 75,
            ),
    );
  }
}
