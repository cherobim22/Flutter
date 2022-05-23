import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File image) onImagePick;
  const UserImagePicker({Key? key, required this.onImagePick})
      : super(key: key);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _image;

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickerImage = await picker.pickImage(
        source: ImageSource.gallery, imageQuality: 60, maxWidth: 150);

    if (pickerImage != null) {
      setState(() {
        _image = File(pickerImage.path);
      });

      // widget.onImagePick(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          backgroundImage: _image != null ? FileImage(_image!) : null,
        ),
        TextButton(
            onPressed: _pickImage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.image, color: Theme.of(context).primaryColor),
                SizedBox(
                  width: 10,
                ),
                Text('Adicionar Imagem')
              ],
            ))
      ],
    );
  }
}
