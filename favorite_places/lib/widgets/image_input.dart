import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; //tarkoittaa input/output, yleinen tarkoitus on tiedostojen/kansioiden käyttö(file/folder)

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  //add_place tiedostosta lähetetään funktio jolla voidaan tallentaa imagen file sinne (add_place tidostoon siis)
  final void Function(File image) onPickImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    ImagePicker();
    final imagePicker = ImagePicker();
    imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    final pickedImage = 
        await imagePicker.pickImage(source: ImageSource.camera, maxWidth: 600);
    
    //tarkistetaan saatiinko käyttäjältä kuvaa
    if(pickedImage == null){
      //lopetaan suoritus jos ei kuvaa
      return;
    }

    //tallennetaan kuva 
    setState(() {
      _selectedImage = File(pickedImage.path);
    });
    
    //käytetään funktiota jolla objekti voidaan lähettää vanhemmille add_place tiedostoon(tässä tapauksessa)
    widget.onPickImage(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
        onPressed: _takePicture, 
        icon: const Icon(Icons.camera_alt_outlined), 
        label: const Text('Take a picture'),
        );

        //jos kuva on otettu
      if(_selectedImage != null){
        content = GestureDetector(
          onTap: _takePicture,
          child: Image.file(
            _selectedImage!, 
            fit: BoxFit.cover, 
            width: double.infinity,
            height: double.infinity,
            ),
        );
      }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
        width: 1,
        color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
      ),
      ),
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}