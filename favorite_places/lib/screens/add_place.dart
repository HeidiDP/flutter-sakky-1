import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'dart:io';



class AddPlaceScreen extends  ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {

//tämä objekti toimii textfield widgetin kanssa
final _titleController = TextEditingController();
File? _selectedImage;

void _savePlace(){
  final enteredText = _titleController.text;

  if(enteredText.trim().isEmpty || _selectedImage == null){
    //ei tehdä tallennusta vaan lopeteaan metodin suoritus
    //tässä voisi olla joku ilmoitus käyttäjälle
    return;
  }
  //täällä tehdään tallennus provideriin/tässä on viittaus provider tiedostoon
  ref.read(userPlacesProvider.notifier).addPlace(enteredText, _selectedImage!);
  Navigator.of(context).pop();
}

  @override
  void dispose(){
    //yleensä dart vapauttaa resurssit(RAM), mutta controlleri pitää itse vapauttaa(eli kuten tässä tehdään titleControllerille)
    _titleController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new place'),
      ),
      body:  SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
            decoration: const InputDecoration(labelText: 'Title'),
            controller: _titleController,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onBackground,
              ),
          ),
          const SizedBox(
            height: 16,
            ),
          //image input
           ImageInput(onPickImage: (imageFile){
            _selectedImage = imageFile;
          }),

          const SizedBox(
            height: 16,
            ),
            LocationInput();
            
          ElevatedButton.icon(
            onPressed: _savePlace, 
            icon:const  Icon(Icons.add),
            label: const Text('Add Place'),
            ),
          ],
          
        ),
      ),
    );
  }
}