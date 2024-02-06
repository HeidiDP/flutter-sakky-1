import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Huoltoilmoituslomake',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MaintenanceForm(),
    );
  }
}

class MaintenanceForm extends StatefulWidget {
    const MaintenanceForm({super.key}); //tämä on lisätty tätä ei ollut alkuperöisessä

  @override
  State<MaintenanceForm> createState() => _MaintenanceFormState(); // tässä alkuperäinen oli: _MaintenanceFormState createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _apartmentNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Huoltoilmoitus'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nimi',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Syötä nimesi';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descriptionController,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Kuvaus',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Syötä huoltoilmoituksen kuvaus';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(
                    labelText: 'Osoite',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Syötä osoite';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Puhelinnumero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Syötä puhelinnumero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _apartmentNumberController,
                  decoration: const InputDecoration(
                    labelText: 'Asunnonnumero',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Syötä asunnonnumero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Tässä voit lisätä logiikan huoltoilmoituksen lähettämiseksi
                      // esimerkiksi HTTP-pyyntö, tietokantaan tallennus jne.
                      // Käytä _nameController.text, _descriptionController.text,
                      // _addressController.text, _phoneNumberController.text ja
                      // _apartmentNumberController.text saadaksesi käyttäjän syöttämät tiedot.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Huoltoilmoitus lähetetty')),
                      );
                    }
                  },
                  child: const Text('Lähetä'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
