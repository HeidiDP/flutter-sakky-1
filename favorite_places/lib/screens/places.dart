import 'package:flutter/material.dart';
import 'package:favorite_places/data/dummy_data.dart';
import 'package:favorite_places/models/country.dart';
import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget{
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesScreenState();
}
class _PlacesScreenState extends ConsumerState<PlacesScreen>{};