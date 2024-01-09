import 'package:flutter/material.dart';
import 'package:favorite_places/models/place.dart';

class PlaceDetailsScreen extends StatelessWidget {
  const PlaceDetailsScreen(this.place, {super.key});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          place.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Theme.of(context).colorScheme.onBackground,
        ),
        ),
      ),
      //stack laittaa widgettejä päällekkäin
      body: Stack(
        children: [Image.file(place.image,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        )],
      ),
    );
  }
}