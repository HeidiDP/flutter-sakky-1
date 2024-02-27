import 'dart:io'; //file luokka
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:chat/widgets/user_image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Tämän objektin välityksellä käytetään firebase:ia
final _firebase = FirebaseAuth.instance;

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  // Onko kirjautuminen vai registeröinti
  var _isLogin = true; // false == luodaan uusi tili

  final _formKey = GlobalKey<FormState>();

  var _enteredEmail = '';
  var _enteredPassword = '';
  File ? _selectedImage;
  var _isAutheticating = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid || !_isLogin && _selectedImage == null) {
      //virheilmoitus...
      return; // Lopetetaan suoritus, jos data ei ole validi
    }
    
    // Suorittaa FormField:n save metodin
    _formKey.currentState!.save();

    try {
      setState(() {
        _isAutheticating = true;
      });
      if (!_isLogin) {
        // Rekisteröinti

        // Yritetään suorittaa koodi(luodaan käyttäjä)
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        //print(userCredentials);

        //jotta kuva voidaan talllentaa, ensin tulee luoda käyttäjä
        //josa päästään tähän käyttäjän luonti on onnistunu. 
        final storageRef = FirebaseStorage.instance
        .ref().child('user_images')
        .child('${userCredentials.user!.uid}.jpg');

        await storageRef.putFile(_selectedImage!); //tässä kuva tallentuu tietokantaan
       final imageUrl = await storageRef.getDownloadURL();

      } else {
        // Kirjautuminen

        final userCredentials = await _firebase.signInWithEmailAndPassword(
            email: _enteredEmail, password: _enteredPassword);
        //print(userCredentials);
      } // Else päättyy
    } on FirebaseAuthException catch (error) {
      // Otetaan vastaan virheilmoitus
      if (error.code == 'email-already-in-use') {
        // Virhe ilmoitus, kun sähköposti on jo käytössä
      }
      // Tässä näytetään kaikki virheet samalla tavalla
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message ?? 'Authentication failed!'),
          // Jos error.message == null, teksti = 'Authentication failed!'
        ),
      );
      setState(() {
        _isAutheticating = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Enter your information'),
              Card(
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if(!_isLogin)
                        UserImagePicker(onPickImage: (pickedImage){
                        _selectedImage = pickedImage;
                        }),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Email Address'),
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          textCapitalization: TextCapitalization.none,
                          validator: (value) {
                            if (value == null ||
                                value.trim().isEmpty ||
                                !value.contains('@')) {
                              // Virhe
                              return 'Please enter a valid email address!';
                            }

                            return null; // ei virhettä
                          },
                          onSaved: (newValue) {
                            _enteredEmail = newValue!;
                          },
                        ),
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().length < 6) {
                              // Virhe
                              return 'Password must be at least 6 characters long!';
                            }

                            return null; // ei virhettä
                          },
                          onSaved: (newValue) {
                            _enteredPassword = newValue!;
                          },
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        if(_isAutheticating)
                        const CircularProgressIndicator(),
                        if(!_isAutheticating)
                        ElevatedButton(
                          onPressed: _submit,
                          child: Text(
                            _isLogin ? 'Login' : 'Signup',
                          ),
                        ),
                        if(!_isAutheticating)
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _isLogin = !_isLogin;
                            });
                          },
                          child: Text(
                            _isLogin
                                ? 'Create an account'
                                : 'I already have an account',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}