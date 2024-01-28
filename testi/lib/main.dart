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
      home: MaintenanceForm(),
    );
  }
}

class MaintenanceForm extends StatefulWidget {
  @override
  _MaintenanceFormState createState() => _MaintenanceFormState();
}

class _MaintenanceFormState extends State<MaintenanceForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Huoltoilmoitus'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nimi',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Syötä nimesi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                maxLines: 5,
                decoration: InputDecoration(
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Tässä voit lisätä logiikan huoltoilmoituksen lähettämiseksi
                    // esimerkiksi HTTP-pyyntö, tietokantaan tallennus jne.
                    // Käytä _nameController.text ja _descriptionController.text
                    // saadaksesi käyttäjän syöttämät tiedot.
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
    );
  }
}
