import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chat/screens/auth.dart';

class UserImagePicker extends StatefulWidget {
  const UserImagePicker({super.key, required this.onPickImage});

  final void Function(File pickedImage) onPickImage;

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}
class _UserImagePickerState extends State<UserImagePicker> {
File? _pickedImageFile;

void _pickImage() async {
  final pickedImage = await ImagePicker().pickImage(
    source: ImageSource.camera, 
    imageQuality: 50, 
    maxWidth: 150,
  );

//tarkisretaan onko kuva olemassa
if(pickedImage == null){
  return; //lopetetaan metodin suoritus
}

  setState(() {
    _pickedImageFile = File(pickedImage.path);
  });

  widget.onPickImage(_pickedImageFile!);//null on tarkistettu joten voi käyttää
}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          foregroundImage: 
          _pickedImageFile != null ? FileImage(_pickedImageFile!) : null,
        ),
        TextButton.icon(
          onPressed: _pickImage, 
          icon: const Icon(Icons.image), 
          label: const Text('Add image'),
          )
      ],
    );
  }
}